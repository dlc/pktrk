#!/usr/bin/perl

use strict;

use Test::More tests => 1;
use FindBin qw($Bin);

my $cmd = "$^X -cw $Bin/boxoh";
ok($cmd, "$cmd");

