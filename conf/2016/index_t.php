<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html>
<head>
<title>SIGPL 여름학교 2015</title>
<link rel="stylesheet" type="text/css" href="/style.css">
</head>
<body>

<h1>
<center>
한국정보과학회 프로그래밍언어연구회 여름학교
<br> (SIGPL Summer School 2015)
</center>
</h1>
<center><table><tr><th align="left">
<ul>
<li>
   일시: 2015년 8월 19일(수) ~ 2015년 8월 22일(토)
<li>
   장소: 부산 동아대학교(부민캠퍼스)
<li>
   주최: 한국정보과학회 프로그래밍언어연구회
</ul>
</th></tr></table>
</center>

  
<h2>초대의 글</h2>

<p>
회원 여러분, 안녕하십니까?

프로그래밍언어연구회 여름학교는 지난 2003년부터 시작되어 그동안 이 분야의 최신 연구를 소개하고 서로 교류하는 장이 되어 왔습니다. 최근 들어 새로운 컴퓨팅 환경을 위한 다양한 프로그래밍 언어들이 소개되고 있습니다. 이번 여름학교에서는 각 분야를 대표하는 최신의 프로그래밍 언어로 Java 8, Haskell, Scala, C, Coq 등을 이 분야의 대표적인 연구자를 강사로 초청하여 함께 공부합니다. 이번 여름학교에 많은 분들이 참가하셔서 함께 공부하고 교류하는 장이 되기를 바랍니다.  
</p>
<p>
회원 여러분의 많은 참석과 성원을 부탁드립니다.  Let’s go together !
</p>
<p>
프로그래밍언어연구회 운영위원장 창병모 드림
</p>

<p align="right">
<br>  조직위원장     조장우(동아대)
<br>  프로그램위원장  허충길(서울대)
<br>  프로그램위원    류석영(KAIST) 오학주(고려대) 최광훈(연세대)
</p>



  <h2>프로그램</h2>

<?php

$content = 
'
head | 8월 19일 (수요일) ##

14:00 ~ 15:15| Java 8에 관해 |박성우 교수님##
15:15 ~ 15:30| 휴식 |##
15:30 ~ 16:45| Java 8에 관해 | 박성우 교수님##
16:45 ~ 17:00| 휴식 | ##
17:00 ~ 18:00| 컴퓨터 과학이 여는 세계 | 이광근 교수님##

head|8월 20일 (목요일)##
 9:00 ~ 10:15|Haskell에 관해| 변석우 교수님##
10:15 ~ 10:30| 휴식 |##
10:30 ~ 11:45| Haskell에 관해| 변석우 교수님##
11:45 ~ 12:00| 휴식 (혹은 수업 계속) |##
12:00 ~ 14:00| 점심 |##
14:00 ~ 15:50| Scala에 관해|류석영 교수님##
15:50 ~ 16:10| 휴식|##
16:10 ~ 18:00| Scala에 관해|임현승 교수님##

head|8월 21일 (금요일)##
9:00 ~ 10:15 | Coq에 관해|허충길 교수님##
10:15 ~ 10:30 | 휴식|##
10:30 ~ 11:45 | C의 어두운 면모에 관해|허충길 교수님##
11:45 ~ 12:00 | 휴식 (혹은 수업 계속)|##
12:00 ~ 14:00 | 점심|##
14:00 ~ 15:15 | Sparrow에 관해 (실제 사례 중심)|정영범 박사님##
15:15 ~ 15:30 | 휴식|##
15:30 ~ 16:45 | Sparrow에 관해 (실제 사례 중심)|정영범 박사님##
16:45 ~ 17:00 | 휴식|##
17:00 ~ 18:00 | 비는 시간 (토의 ?)|##

head|8월 22일 (토요일)##
 | 익스커션 투어 | 운영위원회
';

$list = explode("##", $content);

echo '<ul>
  <table border="0" cellspacing="0">
  <tr><td bgcolor="#cccccc">
  <table border="0" cellspacing="1pt">
';

$size = array ("0", "0", "0", "0");
	
foreach($list as $elm) {
  $value = explode("|", $elm);
  echo "<tr>";
  
  if(trim($value[0]) == "head") {
    $sw = 0;
    foreach($value as $elm) {
      if($sw == 1) { echo "<th colspan=\"3\" align=\"left\">".$elm."</th>"; }
      else if($sw > 1) { echo "<th align=\"left\">".$elm."</th>"; }
      $sw++; 
    }
  }
  else {
    $sw = 0;
    foreach($value as $elm) {
      if($size[$sw] != 0) echo '<td bgcolor="white" width="'.$size[$sw].'">'.$elm."</td>";
      else echo '<td bgcolor="white">'.$elm."</td>";
      $sw++;
    }
  }
  
  echo "</tr>";
}
					  
echo "</table></table></ul>";

?>

<h2> 등록 </h2>

<ul>
  <li> 사전등록 마감: 8월 14일
  <li> 등록비: 교육 기간 중의 숙박비 및 식비가 모두 포함됩니다.
<table border="1" bordercolor="#a0a0a0" cellspacing="0">
<tr><th>&nbsp;</th><th>학생</th><th>일반</th></tr>
<tr align="center"><th>사전 등록 </th><td>200,000원</td><td>300,000원</td></tr>
<tr align="center"><th>현장 등록 </th><td>250,000원</td><td>350,000원</td></tr>
</table>
</ul>
</ul>

</body>
</html>
