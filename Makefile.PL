use ExtUtils::MakeMaker;

use strict;

WriteMakefile(
    NAME        => "boxoh",
    VERSION     => "1.00",
    PREREQ_PM   => {
        'DBI'               => undef,
        'DBD::SQLite'       => undef,
        'HTML::Entities'    => undef,
        'LWP::Simple'       => undef,
        'Time::ParseDate'   => undef,
        'URI'               => undef,
        'XML::RSS'          => undef,
    },
    EXE_FILES   => [ 'boxoh' ],
);
