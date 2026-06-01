#!/usr/bin/perl

open(FILE, "find . -name \"*.html\" -print|");

foreach(<FILE>) {
  chop;
  if(!/2011/) {
  system "cp \"$_\" tmp\n";
  system "piconv -f euc-kr -t utf-8 < tmp > \"$_\"\n";
  }
}

close(FILE);

