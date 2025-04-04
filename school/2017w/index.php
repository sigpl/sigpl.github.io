<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html>
<head>
<title>SIGPL 겨울학교 2017</title>
<link rel="stylesheet" type="text/css" href="/style.css">
</head>
<body>

<h1>
<center>
한국정보과학회 프로그래밍언어연구회 겨울학교
<br> (SIGPL Winter School 2017)
</center>
</h1>
<center><table><tr><th align="left">
<ul>
<li>
    일시: 2017년 2월8일(수) ~ 2017년 2월10일(금)
<li>
    장소: KAIST 정보전자공학동(E3-1) 1층 제1공동강의실 (1501호)
<li>
    주최: 한국정보과학회 프로그래밍언어연구회
<li>
    주관: KAIST SW 중심 대학
</ul>
</th></tr></table>
</center>

  
<h2>초대의 글</h2>

<p>
프로그래밍언어 연구회 회원, 그리고 프로그래밍언어 분야에 관심이 많으신 분들께, 안녕하십니까? 프로그래밍언어 연구회는 매년 여름과 겨울 방학 기간에 계절학교를 개최하여, 프로그래밍언어 분야의 근본적인 주제들로부터 최신 연구 주제들에 대한 강의를 해왔습니다. 2017년 겨울학교에서는 정형 증명 도구 Coq를 이용하여 논리학의 정리 증명 이론을 프로그래밍하고 실습하는 강의를 준비하였습니다. 프로그래밍언어, 정형 기법, 시스템의 검증과 안전성, 그리고 전산학의 기초 이론 분야에 유익한 기회가 될 수 있을 것입니다. 이번 겨울학교에 많은 참석과 성원을 부탁드립니다.
</p>

<p>
프로그래밍언어연구회 운영위원장  조장우 드림
</p>

<p align="right">
<br> 조직위원장 류석영(KAIST)
<br> 프로그램위원장 이계식(한경대)

</p>



  <h2>프로그램</h2>

<?php

$content = 
'
head | 2월 8일 (수요일)  ##

13:00 ~ 14:00| 등록 | ##
14:00 ~ 15:00| Coq 강의 (1) Functional Programming in Coq | 허충길 (서울대학교) ##
15:00 ~ 16:30| Coq 실습 (1) Functional Programming in Coq | 허충길 (서울대학교) ##
16:30 ~ 17:30| Coq 강의 (2) Proof by Induction | 허충길 (서울대학교) ##
17:30 ~ 18:00| 휴식|##
18:00 ~ 19:00| 저녁 식사 | ##
19:00 ~ 21:00| Coq 실습 (2) Proof by Induction | 허충길 (서울대학교) ##

head|2월 9일 (목요일)##
09:30 ~ 10:30 | Logic 강의 (1)| Martin Ziegler (KAIST) ##
10:30 ~ 10:45 | 휴식 |##
10:45 ~ 11:45 | Logic 강의 (2)| Martin Ziegler (KAIST) ##
12:30 ~ 13:30 | 점심 식사| ##
13:30 ~ 14:30 | Coq 강의 (3) Polymorphism and Higher-Order Functions | 허충길 (서울대학교) ##
14:30 ~ 16:00 | Coq 실습 (3) Polymorphism and Higher-Order Functions | 허충길 (서울대학교) ##
16:00 ~ 17:00 | Coq 강의 (4) Logic and Inductively Defined Propositions | 허충길 (서울대학교) ##
17:00 ~ 18:00 | Coq 실습 (4) Logic and Inductively Defined Propositions | 허충길 (서울대학교) ##
18:00 ~ 21:00 | 뱅킷 |##

head|2월 10일 (금요일)##
10:00 ~ 11:30| Coq 강의 (5) Coq Type Theory |허충길 (서울대학교)##
11:30 ~ 12:00| Coq 실습 (5) Coq Type Theory | 허충길 (서울대학교) ##
12:00 ~ | 사진 촬영 |

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
* Coq 강의와 실습의 구체적인 일정은 진행 상황에 따라 변경 가능합니다.  Coq 실습 중심으로 진행하므로, 개인 랩탑을 꼭 지참하셔야 합니다.
<h2> 등록 </h2>

<ul>
  <li> 사전등록 마감: 2월 5일
  <li> 등록 방법: <a href="http://www.kiise.or.kr/evt/2017/sigpl2017w/pay/payform.asp">등록  페이지</a>를 통하여 등록할 수 있습니다.
<table border="1" bordercolor="#a0a0a0" cellspacing="0">
<tr><th>&nbsp;</th><th>학생</th><th>일반</th></tr>
<tr align="center"><th>사전 등록 </th><td>100,000원</td><td>150,000원</td></tr>
<tr align="center"><th>현장 등록 </th><td>120,000원</td><td>170,000원</td></tr>
</table>
</ul>

<h2> 숙박안내 </h2>

<ul>
  KAIST 주변 숙박 안내입니다.  아래에 안내해 드린 가격은 혹시 변동이 있을수 있으니 확인하시고 예약하시기 바랍니다.
    <li> 대덕특구 게스트하우스 (042-865-2500)
        <br>갑천변 TJB 대전방송국 옆에 위치
        <br>1인실: 40,000원, 2인실: 55,000원, 4인실: 75,000원
 <br> 예약된 방(1인실: 13개, 2인실: 3개)이 조기 소진될 수 있으니 
  예약이 필요하신 분께서는 되도록 빠른 시간안에 류석영 (sukyoung.ryu@gmail.com)에게 연락주시기 바랍니다. 
    <li> 호텔B스테이션 (042-719-8000) <a href="http://www.bstation.kr/">홈페이지 </a>
  <br>유성 계룡스파텔 근처 위치
  <br>2인1실: 77,000원
    <li> 토요코인 (042-545-1045)  <a href="http://www.toyoko-inn.kr/k_hotel/00234/"> 홈페이지 </a>
 <br>지하철 정부청사역 4번 출구에서 도보10분
</ul>

</ul>
<h2> 오시는길 </h2>
<ul>
<a href="https://cs.kaist.ac.kr/content?menu=4">한국과학기술원 본교 찾아오시는 길</a>
</ul>
</body>
</html>
