#!/bin/bash

service haproxy restart
/opt/torscraper/scripts/harvest.sh
/opt/torscraper/scripts/scrape.sh
