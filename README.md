bxtrxr -- Command-line interface to boxoh.com
============================================

`bxtrxr` provides a simple command-line interface to boxoh.com.  It lets you
track packages using the service while keeping most of the details local, in a
sqlite database.

Usage is very simple:

    $ bxtrxr track $PACKAGEID

Use `bxtrxr help` to see a list of available commands.

Usage Examples
==============

Start tracking a package
------------------------

    $ bxtrxr track 12341234123412341234

The title of the tracked package defaults to "$CARRIER tracking formation for $NUMBER", but you can give a tracked package an explicit name thusly:

    $ bxtrxr track 12341234123412341234 as "Bday gift for Susan"

Listing tracked packages
------------------------

    $ bxtrxr list
      58. USPS tracking information for 12341234123412341234 <http://boxoh.com/?t=12341234123412341234>

The leading number (58, above) is the internal id, which starts at 1.  You can use this number for calls to `bxtrxr info` and `bxtrxr remove`, or you can use the package's tracking number.

Show package status and info
----------------------------

    $ bxtrxr info 58
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

    $ bxtrxr remove 58
    $ bxtrxr remove 12341234123412341234

Both forms work.

Generating a Feed
-----------------

First, ensure that the database is up-to-date:

    $ bxtrxr update-feeds

`update-feeds` contacts boxoh.com for each tracked package and gets the latest updates.

Then generate the new, aggregated feed:

    $ bxtrxr feed > /src/www/htdocs/packages.xml

The generated feed will be RSS 2.0, and is completely unconfigurable.

Seeing What's Out For Delivery
------------------------------

Use the `out-for-delivery` command to make `bxtrxr` try to determine
what's currently out for delivery. Note that this is pretty sketchy,
and shouldn't be relied on for anything real.

Hacky bits / Future Directions / TODO
=====================================

  * Right now, `bxtrxr` works completely using the public-facing web site, and
    not the API.  I'm going to soon investigate using the [boxoh API](http://boxoh.com/api/docs/) and
    see if it provides any additional functionality.

  * There are no configurable parts.  Configurability will most likely happen
    through a config file in `/etc/bxtrxr` or a similar place.

  * How `bxtrxr` finds its database is pretty weak, and pretty much always ends
    up being in `~/.bxtrxr.db` for the current user.
