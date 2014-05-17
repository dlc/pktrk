pktrk - A CLI package tracking app
==================================

pktrk first tries to use boxoh to track a package, and if that
fails, will try to look up packages directly (DHL, LaserShip, etc).

Interface
---------

    $ pktrk help
    $ pktrk track/add [-t TITLE] PACKAGE_IDENTIFIER
    $ pktrk untrack/remove/delete PACKAGE_IDENTIFIER
    $ pktrk edit PACKAGE_IDENTIFIER
    $ pktrk list [-A]
    $ pktrk update
    $ pktrk genfeed [-O /path/to/file]

subcommands:

    * help emits detailed usage info
    * track adds a package to the datastore.  If -t TITLE is
      indicated, use TITLE as the description in the datastore.
    * untrack removes a package. Should only be used for mistakes
    * edit changes metadata for a package
    * list lists outstanding packages, or all if -A is indicated
    * update attempts to update info on every outstanding and
      pending package
    * genfeed generates an RSS feed of packages

If you try to add a package and it doesn't work, pktrk retries
on every call to update.

Datastore Structure
-------------------

Uses a single json file under the hood.  On each startup, pktrk
unserializes the file into a structure, and then, if there are
changes, reserializes the structure to json in an END block.

Schema looks something like this:

{ "packages": [
        { "title": "...",
          "id": "The identifier being tracked",
          "tracked_via": "One of: boxoh, lasership, others",
          "events": [
            [ timestamp, "one entry per event" ],
            [ timestamp, "these might need to be more complex than just strings" ]
            [ timestamp, "etc" ],
          ],
          "status": "Either PENDING, which means it hasn't been found yet and
                     should be retried; IN_PROCESS, which means use the latest
                     event as the status; DELIVERED, which means delivered but
                     still in the list; or PURGED, which means it's been deleted
                     from the list (but still exists in the datastore)",
          "meta": { catchall hash of random attributes },
        },
   ]
}

This would be read/written by Perl's JSON module.
