<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<center>
<table><tr><td>

<h2>등록</h2>


<ul>
<li> 등록비
<table bgcolor="#aaaaaa" cellpadding="1" cellspacing="0"><tr><td>
<table cellspacing="1" cellpadding="2">
<tr>
<td bgcolor="#ffffcc"></td>
<th bgcolor="#ffffcc" colspan="4">KCC2006 참가등록시</th>
<th bgcolor="#ffffcc" colspan="4">KCC2006 참가 미등록시</th>
</tr>

<?php

function tables($hcolor, $head, $color, $arr) {
  echo "<tr>";
  echo "<td bgcolor=\"$hcolor\">";
  echo $head;
  echo "</td>";
  foreach($arr as $t) {
    echo "<td bgcolor=\"$color\" align=\"center\">";
    echo $t;
    echo "</td>";
  }
  echo "</tr>";
}

$x = array("학생회원", "&nbsp; 정회원 &nbsp; ", "&nbsp; 비회원 &nbsp; ", "비회원(학생)");
$x = array_merge($x, $x);
tables("#dddddd", "회원구분", "#dddddd", $x);
tables("#dddddd", "사전등록", "white",
  array("30,000", "50,000", "60,000", "35,000",
	"40,000", "80,000", "90,000", "45,000"));
tables("#dddddd", "현장등록", "white",
  array("40,000", "60,000", "70,000", "45,000",
	"50,000", "90,000", "100,000", "55,000"));

?>
</table></td></tr></table>

<li> 등록방법
<ul>
<li> 사전등록: <a href="http://www.kiss.or.kr/conference/regist/default.asp" target="_new">KCC2006 사전등록 사이트</a>
<li> 현장등록: 용평리조트 타워콘도
</ul>
</ul>

<h2>오시는 길</h2>
<center><a href="http://www.yongpyong.co.kr/customer/traffic02.asp" target="_new">
<img border="0" src="map_img.gif"></a></center>

</td></tr></table>
