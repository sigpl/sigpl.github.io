#!/usr/bin/perl

$cover = "cover.jpg";
$cover_thumb = "cover_thumb.jpg";

unless(-e $ARGV[0]) {
    print "no such file: $ARGV[0]\n";
    print "usage: journal_one_volume.pl <year>/<num>.data\n";
    exit(0);
}
open(FILE, $ARGV[0]) || error("cannot open $ARGV[0]");

$year = <FILE>; chop $year;
$month = <FILE>; chop $month;
$vol = <FILE>; chop $vol;
$num = <FILE>; chop $num;

if($ARGV[0] =~ /^(.+\/|)([^\/]+)\/([^\/]+)\.data$/) {
    $dir = $1;
    if ($year != $2) {
	error("years $1 and $year are not matched");
    }
    if ($num != $3) {
        error("numbers $num and $2 are not matched");
    }
}
else {
    error("invalid data filename");
}
if($year - 1986 != $vol) {
    error("year $year and vol $vol are not matched");
}


$ofile = "$dir$year/$num.html";
$deposit = "$dir$year/$num";

open(OFILE, ">$ofile") || error("cannot open $ofile");

print OFILE 
'<html>
  <head>
    <link rel="stylesheet" type="text/css" href="../style.css">
  </head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <body>
';

print OFILE "<h1>";
if($year < 2000) {
    print OFILE "프로그래밍언어연구회지";
}
else {
    print OFILE "프로그래밍언어논문지";
}

print OFILE " 제$vol권 제$num호 ($year년";
if($month ne "") { print OFILE " $month월"; }
print OFILE ")</h1><br>\n";

if(-e "$deposit/$cover" || -e "$deposit/$cover_thumb") {
    if(! (-e "$deposit/$cover_thumb")) {
	$cover_thumb = $cover;
    }
    print OFILE "<table><tr><td width=\"200\" align=\"center\">\n";
    if(-e "$deposit/$cover") { print OFILE "<a href=\"$num/$cover\">\n";}
    print OFILE "<img border=\"0\" width=\"150\" src=\"$num/$cover_thumb\">";
    if(-e "$deposit/$cover") { print OFILE "</a>"; }
    print OFILE "&nbsp;</td><td>";
    $cover_sw = 1;
}

while(1) {
  last if eof(FILE);
  $_ = <FILE>;
  if(/^{$/) {
     $label = <FILE>; chop $label;
     %tmp = ();
     $tmp{title} = <FILE>; chop $tmp{title};
     $tmp{author} = <FILE>; chop $tmp{author};
     $tmp{pages} = <FILE>; chop $tmp{pages};
     $abs = "";
     while(1) {
       $_ = <FILE>;
       last if(/^}$/);
       $abs = $abs . $_;
     }
     $tmp{abs} = $abs;
     $papers{$label} = join("$;", %tmp);
  }
  else {
    chop;
    if(/^X\s+(.*\S)\s*$/) {
	print OFILE "<h2>$1</h2>\n";
    }
    elsif(/^X<\s+(.*\S)\s*$/) {
	print OFILE "<h2>$1:\n";
    }
    elsif(/^X>/) {
        print OFILE "</h2>";
    }
    elsif(/^</) {
	print OFILE "  <ul>\n";
    }
    elsif(/^>/) {
        print OFILE "  </ul>\n";
    }
    elsif(/^\*\s+(.*)$/) {
        print OFILE "    <li><b>$1</b>\n";
    }
    elsif(/^\.\s+(.*)$/) {
        print OFILE "    <span class=\"normal\">$1</span>\n";
    }
    elsif(/^\|\s+(.*)$/) {
        print OFILE "    <br>$1\n";
    }
    elsif(/^!\s+(\S+)\s*$/) {
        show_file($1);
    }
    elsif(/^-\s+(\S+)/) {
        %tmp = split("$;", $papers{$1});
        print OFILE "    <li><b><a href=\"#$1\">$tmp{title}</a></b>\n";
        print OFILE "<br>$tmp{author}\n";
    }
    elsif(/^C</) {
    }
    elsif(/^C>/) {
    }
    else {
      print OFILE $_;
    }
  }
}
close(FILE);

if($cover_sw == 1) { print OFILE "</td></tr></table>\n"; }

if(scalar %papers != 0) {
print OFILE "<hr>\n";
print OFILE "<h1>본문</h1>\n";

foreach(sort keys %papers) {
  $label = $_;
  %tmp = split("$;", $papers{$label});
  print OFILE "<a name=\"$label\"></a>\n";
  print OFILE "<h2>$tmp{title}";
  show_file($label);
  print OFILE "</h2>\n";
  print OFILE "  <ul>\n";
  print OFILE "    <li>저자:  $tmp{author}\n";
  if($tmp{pages} ne "") {
      print OFILE "    <li>쪽: $tmp{pages}\n";
  }
  print OFILE "    <li>요약:\n    <br>\n";
  print OFILE $tmp{abs};
  print OFILE "  </ul>";
}
}

print OFILE "<hr>프로그래밍언어 연구회\n</body></html>\n";

close(OFILE);

sub show_file {
  local ($fname) = @_;
  use integer;
  @exts = ("pdf", "hwp", "jpg");
  @results = ();
  foreach(@exts) {
      $ext = $_;
      $name = "$deposit/$fname.$ext";
      $link = "$num/$fname.$ext";
      if(-e $name) {
	  @stat = stat($name);
	  $size = $stat[7] / 1024; 
          $s = "<a href=\"$link\">." . uc($ext). "</a> " . $size . "KB";
          @results = (@results, $s);
      }
  }
  if(length (@results) != 0) {
    print OFILE "    <span class=\"small\">[";
    print OFILE join(" | ", @results);
    print OFILE "]</span>\n";
  }
  else {
      print "$ARGV[0]: warning - link $fname is missed.\n";
  }
}

sub error {
    local ($msg) = @_;
    print "$ARGV[0]: error - $msg.\n";
    exit(0);
}
