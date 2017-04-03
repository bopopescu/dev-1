#!/usr/bin/env python
from bs4 import BeautifulSoup
import urllib2
import json


EDGAR_BASE = "http://data-interview.enigmalabs.org"
EDGAR_COMPANY_BASE = EDGAR_BASE + "/companies/"
EDGAR_RELATIVE_PAGES = ["?page=" + str(_x) for _x in xrange(1, 11)]
COMPANY_IDS = ['street_address', 'street_address_2', 'city', 'description',
               'state', 'zipcode', 'phone_number', 'website']


def get_html(site):
    """ Retrieves html of site from the internet.

    Args:
        site: Full url string of site to retrieve html from.

    Returns:
        The html of the given site as a Beautiful Soup object

        If site cannot be retrieved, the error description is printed
        and an empty Beautiful Soup object is returned.
    """

    try:
        html = urllib2.urlopen(site)
        parsed_html = BeautifulSoup(html, 'html.parser')
        return parsed_html

    except urllib2.URLError as e:
        print "get_html URLError: %s\n\tCould not download: %s" % (e, site)
        return BeautifulSoup('', 'html.parser')
    except ValueError as e:
        print "get_html ValueError: %s\n\tCould not download: %s" % (e, site)
        return BeautifulSoup('', 'html.parser')


def get_url(tag, base_address=EDGAR_BASE):
    """ Turn's relative address in the href of a tag into a full string url.

    Args:
        tag: html <a> tag, as a dict, containing a href attribute
        base_address: If href in tag is to a relative address,
            use this to turn it into a full address.
            i.e. full_address = base_address + tag["href"]


    Returns:
        Full url string to the link's address.
    """

    href = tag.get('href')

    # Spaces in relative url's string need to be converted to %20 for the actual url
    relative_url = href.replace(' ', '%20')
    url = base_address + relative_url
    return url


def get_urls_from_pages(base_address, relative_endings):
    """ Retrieves company-specific urls listed on the pages

    Args:
        base_address: Base address, as a string, of the pages to visit
        relative_endings: List of relative endings of pages, as strings,
            to be appended to base_address in order to get one of the pages
            to be scraped for company-specific urls.
    Returns:
        Returns list of relevant urls fetched, as strings.
        Only returns urls that link to a company specific-page, and no others.
    """

    def has_href_and_id(tag):
        # only company-specific tags have id's
        return tag.has_attr('href') and tag.has_attr('id')

    urls = []
    for ending in relative_endings:
        html = get_html(base_address + ending)

        new_urls = [get_url(tag) for tag in html.find_all(has_href_and_id)]

        urls.extend(new_urls)

    return urls


def get_info(html_list):
    """ Scrapes company-specific information from given html strings

    Assumes each html is of a company-specific site, and that each
    company only has info related to those given in COMPANY_IDS,
    plus said company's name.

    Args:
        html_list: List of html data, as strings, of company-specific sites
    Returns:
        Dictionary in format {company_name:{company_info:info}} for each
        company specific site.
    """

    info = {}
    for html in html_list:
        name = None
        info_dict = {}

        # All info on company-specific sites were stored within td tags.
        tds = html.find_all('td')

        # Get name and info from each companies' html data
        for td in tds:
            company_id = td.get('id')
            if company_id == 'name':
                name = td.text
            elif company_id in COMPANY_IDS:
                info_dict[company_id] = td.text

        # Only add info if html actually has name and information to add
        if info_dict != {} and name is not None:
            info[name] = info_dict
    return info


def write_to_json(info, filename):
    """Writes info, a json dict, to given filename."""

    json_data = json.dumps(info)

    with open(filename, 'w') as json_file:
        json.dump(json_data, json_file)

if __name__ == '__main__':

    urls = get_urls_from_pages(EDGAR_COMPANY_BASE, EDGAR_RELATIVE_PAGES)
    print "Retrieved a list of all company-specific urls"

    htmls_to_scrape = [get_html(url) for url in urls]
    print "Retrieved html from all company-specific urls"

    companies = get_info(htmls_to_scrape)
    print "Retrieved the info from all the companies' html data"

    write_to_json(companies, 'output/solutions.json')
    print "Wrote company info to output/solutions.json"
