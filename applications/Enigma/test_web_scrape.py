#!/usr/bin/env python
from web_scrape import get_info, get_url, get_urls_from_pages, get_html, \
    EDGAR_COMPANY_BASE, EDGAR_RELATIVE_PAGES, EDGAR_BASE
from bs4 import BeautifulSoup

TEST_HTML = 'data/enigma_pollich_llc.html'


def test_get_html_handle_nonsense_url():
    # Shouldn't throw error, just print and return empty BS4 object
    assert get_html("Nonsense.nowhere.com") == BeautifulSoup('', 'html.parser')


# Test is supposed to fail if no internet connection.
def test_get_html_first_edgar_page_retrieved_and_has_links():
    html = get_html(EDGAR_COMPANY_BASE + EDGAR_RELATIVE_PAGES[0])

    assert html.find_all("a") != []


def test_get_url_from_page_one_returns_10_pages():
    # Only first page of urls
    urls = get_urls_from_pages(EDGAR_COMPANY_BASE, [EDGAR_RELATIVE_PAGES[0]])
    assert len(urls) == 10


def test_get_url_returns_full_link_to_existing_company_site():
    urls = get_urls_from_pages(EDGAR_COMPANY_BASE, [EDGAR_RELATIVE_PAGES[0]])
    company_url = "http://data-interview.enigmalabs.org/companies/Douglas,%20Walsh%20and%20Luettgen"
    assert company_url in urls


def test_get_url_replaces_spaces():
    tag = {'href': "www.google.com/ why helloooo"}
    assert get_url(tag, base_address="") == "www.google.com/%20why%20helloooo"


def test_get_url_works_with_relative_addresses():
    relative_addr = '/companies/Pollich%20LLC'
    tag = {'href': "/companies/Pollich LLC"}
    assert get_url(tag) == EDGAR_BASE + relative_addr


def test_get_info_can_scrape_a_company_specific_site():
    html_file = open(TEST_HTML, 'r')
    html = BeautifulSoup(html_file, 'html.parser')
    html_file.close()

    info = get_info([html])

    # Tests company exists and has correct city
    assert info["Pollich LLC"]["city"] == 'Merylland'
