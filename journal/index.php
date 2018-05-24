<html>
<head>
<title>논문지</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="style.css">
</HEAD>
<body>

<h1>논문지</h1>
<p>
   연구회는 1987년도에 연구회 소식지를 발간하기 시작하여, 
   1994년도부터는 분과연구회보로 격상하여 발간하였습니다.
   2000년도부터는 학술논문지로 격상하여 지금의 "프로그래밍언어논문지"
   형태로 발간하고 있습니다.
</p>

<?php

function print_list($start, $end, $exc) {
   echo "<ul>\n";
   while($start >= $end) {
     if($start == 1989) { $start--; continue; }
     echo "<li> ", $start-1986, "권 ($start", "년): \n";
     $count = 1;
     while(1) {
       if(file_exists("$start/$count.html")) {
	 echo "<a href=\"$start/$count.html\">", $count, "호</a> ";
       }
       else if($exc{$start} != 0 && $count <= $exc{$start}) {
	 echo $count, "호 ";
       }
       else break;
       $count++;
     }
     $start--; 
   }
   echo "</ul>\n";
 }
?>

    <table>
    <tr><th>학술논문지</th><th>프로그래밍언어논문지</th></tr>
    <tr><td></td><td>

    <?php
      print_list(2009, 2000, array());
    ?>

    </td>
    <tr><th>분과연구회보</th><th>프로그래밍언어연구회지</th></tr>
    <tr><td></td><td>

    <?php
      print_list(1999, 1994, array("1997" => "1"));
    ?>

    </td>
    <tr><th>분과소식지</th><th>프로그래밍언어소식</th></tr>
    <tr><td></td><td>

    <?php
    print_list(1993, 1987, array("1993" => 3, "1992" => 2, "1991" => 2, "1990" => 2, "1987" => 2));
    ?>
  
    </td>
    </table>
<hr>
프로그래밍언어연구회
</body>
</html>
