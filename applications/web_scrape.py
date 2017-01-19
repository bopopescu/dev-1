#!/usr/bin/env python
from bs4 import BeautifulSoup
import urllib2

import json

EDGAR_BASE = 'http://data-interview.enigmalabs.org'
EDGAR_COMPANY = EDGAR_BASE + '/companies/'


EDGAR_PAGES = [""] + ["?page=" + str(x) for x in xrange(2,11)]

COMPANY_IDS = ['street_address', 'street_address_2', 'city',
               'state', 'zipcode', 'phone_number', 'website']

def get_site(site):
    print(site)
    return urllib2.urlopen(site)

def get_url(tag):
    href = tag.get('href')

    # Replace with quote_plus from urllib?
    relative_url = href.replace(' ', '%20')
    url = EDGAR_BASE + relative_url
    return url

if __name__ == '__main__':

    urls = []
    for ending in EDGAR_PAGES:
        # get's html of site from internet
        site = get_site(EDGAR_COMPANY + ending)

        # Turn's html into something we can parse
        parse = BeautifulSoup(site, 'html.parser')

        # link tags in html start with '<a', url itself is in href
        new_urls = [get_url(tag) for tag in parse.find_all('a') if not tag.get('id') is None]
        urls.extend(new_urls)
    sites_to_scrape = [get_site(url) for url in urls]

    print(urls)
    companies = {}
    for site in sites_to_scrape:
        p = BeautifulSoup(site, 'html.parser')
        name = None
        comp_dict = {}
        tds = p.find_all('td')
        for td in tds:
            id = td.get('id')
            if id == 'name':
                name = td.text
            elif id in COMPANY_IDS:
                comp_dict[id] = td.text
        if comp_dict != {} and not name is None:
            companies[name] = comp_dict
            print(comp_dict)
    json_data = json.dumps(companies,sort_keys=True, indent=4, separators=(",", ":"))
    print json_data

    with open('solution.json','w') as json_file:
        json.dump(json_data, json_file, sort_keys=True, indent=4, separators=(",", ":"))
