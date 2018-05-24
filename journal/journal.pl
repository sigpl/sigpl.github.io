#!/usr/bin/perl
$home = "/Volumes/oukseh/Sites/sigpl";
$dir = "$home/journal";
$bindir = "$home/bin";

open(FILE, "find $dir -name \"*.data\"|");

foreach(<FILE>) {
    chop;
    print "$bindir/journal_one_volume.pl $_\n";
    system "$bindir/journal_one_volume.pl $_\n";
}

close(FILE);
