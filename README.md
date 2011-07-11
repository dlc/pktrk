boxoh -- Command-line interface to boxoh.com
============================================

`boxoh` provides a simple command-line interface to boxoh.com.  It lets you
track packages using the service while keeping most of the details local, in a
sqlite database.

Usage is very simple:

    $ boxoh track $PACKAGEID

Use `boxoh help` to see a list of available commands.

Usage Examples
==============

Start tracking a package
------------------------

    $ boxoh track 12341234123412341234

Listing tracked packages
------------------------

    $ boxoh list
      58. USPS tracking information for 12341234123412341234 <http://boxoh.com/?t=12341234123412341234>

The leading number (58, above) is the internal id, which starts at 1.  You can use this number for calls to `boxoh info` and `boxoh remove`, or you can use the package's tracking number.

Show package status and info
----------------------------

    $ boxoh info 58
    USPS tracking information for 12341234123412341234
    -----------------------------------------------
    Tracking Number: 12341234123412341234
    Carrier: USPS
    Status: Origin Scan
    Link: http://boxoh.com/?t=12341234123412341234

    Package history
    ---------------
    2011/07/10 03:31: Billing Information Received
    2011/07/11 15:49: Origin Scan

Stop tracking a package
-----------------------

    $ boxoh remove 58
    $ boxoh remove 12341234123412341234

Both forms work.

Generating a Feed
-----------------

First, ensure that the database is up-to-date:

    $ boxoh update-feeds

`update-feeds` contacts boxoh.com for each tracked package and gets the latest updates.

Then generate the new, aggregated feed:

    $ boxoh feed > /src/www/htdocs/packages.xml

The generated feed will be RSS 2.0, and is completely unconfigurable.

Hacky bits / Future Directions / TODO
=====================================

  * Right now, `boxoh` works completely using the public-facing web site, and
    not the API.  I'm going to soon investigate using the [boxoh API][api] and
    see if it provides any additional functionality.

  * There are no configurable parts.  Configurability will most likely happen
    through a config file in `/etc/boxoh` or a similar place.

  * How `boxoh` finds its database is pretty weak, and pretty much always ends
    up being in `~/.boxoh.db` for the current user.


    [api]: http://boxoh.com/api/docs/
