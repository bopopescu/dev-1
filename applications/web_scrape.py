#!/usr/bin/env python
from bs4 import BeautifulSoup
import urllib2

import json

EDGAR_BASE = 'http://data-interview.enigmalabs.org'
EDGAR_COMPANY = EDGAR_BASE + '/companies/'

def get_site(site):
    print(site)
    return urllib2.urlopen(site)

def get_url(tag):
    href = tag.get('href')
    relative_url = href.replace(' ', '%20')
    url = EDGAR_BASE + relative_url
    return url

if __name__ == '__main__':
    # get's html of site from internet
    site = get_site(EDGAR_COMPANY)

    # Turn's html into something we can parse
    parse = BeautifulSoup(site, 'html.parser')

    # link tags in html start with '<a', url itself is in href
    urls = [get_url(tag) for tag in parse.find_all('a')]

    sites_to_scrape = [get_site(url) for url in urls]

    print(urls)
    print(sites_to_scrape)