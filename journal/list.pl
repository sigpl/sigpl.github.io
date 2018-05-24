#!/usr/bin/perl 

open(FILE, 'find . -name "*.data" -print|');

foreach(<FILE>) {
  chop;
  open(DATA, $_);
  $year = <DATA>;
  $month = <DATA>;
  close(DATA);
  chop $year;
  chop $month;
  print "$year-$month\n";
}

close(FILE);
