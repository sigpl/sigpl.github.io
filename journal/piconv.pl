#!/usr/bin/perl

open(FILE, "find . -name \"*.data\" -print|");

foreach(<FILE>) {
  chop;
  system "cp \"$_\" tmp.data\n";
  system "piconv -f euc-kr -t utf-8 < tmp.data > \"$_\"\n";
}

close(FILE);

