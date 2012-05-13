# Purpose

This web spider harvests any email addresses that it can find on the target web site.  It stores the
harvested addresses in a SQLite database file.  Each address also includes information about the site
and the page where it was harvested, and the time that it was discovered.

# Installation

I recommend using RVM to set up the Ruby 1.9.2 environment and a gemset.  An .rvmrc file is included.

Then bundle the gems with: `bundle install`

# Usage

Invoke the spider with:

    ruby crawl.rb http://target.com

The spider will display the URL of each page as it crawls the web site.  It will write out a pages.pstore
file for keeping track of the pages that it has crawled, and a data.db file for storing harvested
addresses.

To export the addresses from the database, us the "export" Rake task:

    rake export

You should see output like this:

    [~/projects/email_spider] rake export
    31 addresses exported to addresses.csv

Each row in the exported data contains the email address, the date/time that it was collected, the host
of the site where it was collected, and the URL for the specific page where it was found.