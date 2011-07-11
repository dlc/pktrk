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
