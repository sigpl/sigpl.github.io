<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html>
<head>
<title>SIGPL 여름학교 2016</title>
<link rel="stylesheet" type="text/css" href="/style.css">
</head>
<body>

<h1>
<center>
한국정보과학회 프로그래밍언어연구회 여름학교
<br> (SIGPL Summer School 2016)
</center>
</h1>
<center><table><tr><th align="left">
<ul>
<li>
   일시: 2016년 8월17일(수) ~ 2016년 8월19일(금)
<li>
   장소: 광주과학기술원 오룡관 101호
<li>
   주최: 한국정보과학회 프로그래밍언어연구회
</ul>
</th></tr></table>
</center>

  
<h2>초대의 글</h2>

<p>
프로그래밍언어 연구회 회원, 그리고 프로그래밍언어 분야에 관심이 많으신 분들께, 
안녕하십니까? 프로그래밍언어 연구회는 매년 여름학교를 개최하여, 프로그래밍언어 분야의 근본적인 주제들로부터 최신 연구 주제들에 대한 강의를 해왔습니다. 2016년 여름학교에서는 SMT, Weak Memory, Static analysis & machine learning과 같은 최신 연구 주제들을 강의하고 대학원생들의 포스터 세션을 통해서 최근의 연구동향을 파악할 수 있습니다. 그리고 CS 대학원생들을 위한 팁, 번역의 탄생, 그리고 프로그래밍 교육 플랫폼을 개발한 start-up인 Lablup을 소개합니다. 그리고 최근 활발하게 사용되고 있는 프로그래밍언어인 Rust, Scala, Haskell의 개발자 커뮤니티의 대표들로부터 현장의 목소리를 듣는 시간을 마련했습니다. 이번 여름학교에서도 알찬 프로그램을 준비하였으니 많은 참석과 성원을 부탁드립니다.
</p>

<p>
프로그래밍언어연구회 운영위원장  조장우 드림
</p>

<p align="right">
<br> 조직위원장 이병철(광주과기원) 
<br> 프로그램위원장 오학주(고려대) 
<br> 프로그램위원 류석영(KAIST) 최광훈(연세대) 허충길(서울대)

</p>



  <h2>프로그램</h2>

<?php

$content = 
'
head | 8월 17일 (수요일)  ##


13:00 ~ 14:00| 등록 |##
14:00 ~ 15:00| CS 대학원생을 위한 팁: 빨리 알수록 좋은 것 |한요섭(연세대)##
15:15 ~ 16:15| SMT 기반 소프트웨어 검증 | 배경민(POSTECH)##
16:30 ~ 17:30| 잃어버린 고리를 찾아서: 영한사전의 기원 | 이희재(번역가)##
19:00 ~ 21:00| Poster Session | 대학원생 ##

head|8월 18일 (목요일)##
09:30 ~ 10:30| Rust: 모두를 위한 시스템 프로그래밍  | 서상현(커뮤니티대표)##
10:45 ~ 11:45| shapeless를 활용한 Scala 타입 수준 프로그래밍 | 김흥진(커뮤니티대표)##
13:00 ~ 14:00| Haskell을 이용한 범용 템플릿 엔진 작성 | 서광열(커뮤니티대표)##
14:15 ~ 15:15|느슨한 동시성을 위한 제대로 된 메모리 모델 |허충길(서울대) ##
15:30 ~ | Excursion (무등산등반 및 뱅킷)  |##

head|8월 19일 (금요일)##
09:30 ~ 10:30 | 머신러닝 기반 선별적 정적 분석 |오학주(고려대)##
10:45 ~ 11:45 | Sorna 와 CodeOnWeb : 컨테이너 기반의 오픈소스 코드 분산 실행 프레임워크 및 코딩 교육 시스템|신정규(LabLup 대표)##
12:00 ~  | 사진촬영   | 

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
* 포스터 세션 *<br>

포스터 세션은 회원 여러분의 최근 연구내용을 자유롭게 발표하고 교류하는 장으로 8월 17일(수) 19시~21시에 진행될 예정입니다. <br>
여름학교에서 포스터 발표를 원하시는 분들은 발표제목과 소속을 8월 12일 금요일까지 오학주 교수(hakjoo_oh@korea.ac.kr) 알려주시면 됩니다.
<h2> 등록 </h2>

<ul>
  <li> 사전등록 마감: 8월 12일
  <li> 등록 방법: <a href="http://www.kiise.or.kr/evt/2016/sigpl2016/pay/payform.asp">등록 페이지</a>를 통하여 등록할 수 있습니다.
<table border="1" bordercolor="#a0a0a0" cellspacing="0">
<tr><th>&nbsp;</th><th>학생</th><th>일반</th></tr>
<tr align="center"><th>사전 등록 </th><td>150,000원</td><td>200,000원</td></tr>
<tr align="center"><th>현장 등록 </th><td>170,000원</td><td>230,000원</td></tr>
</table>
</ul>

<h2> 숙박안내 </h2>

<ul>
    여름학교에서 가능한 숙박 안내입니다. 광주과학기술교류협력센터게스트룸은 30실을 여름학교용으로 확보했습니다. 예약을 원하시면 아래 전화번호로 전화하셔서 여름학교라고 말씀하시고 예약하시면 되겠습니다.
    <li> 광주과기원 내빈관: 1인1실, 28,000원/1박, 외부강사 우선 배정 
    <li> 광주과학기술교류협력센터게스트룸: 2인1실, 28,000원/1박, 도보로 30분,  tel: 062-609-0500  (<a href="http://www.gjstec.or.kr/SE_Contents.php?pgKey=79">홈페이지</a>)
    <li> 가까운 모텔: 마이다스관광호텔: 062-973-5000, 글로벌모텔: 062-972-2080, ...
</ul>

</ul>
<h2> 오시는길 </h2>
<ul>
<a href="http://oryong.gist.ac.kr/page/menu02/page05.php">광주과학기술원 오룡관 오시는길</a>
<br><br> 오룡관 위치 :
<br> <a href="gist_campus.png"><img width="640" border="0" src="gist_campus.png"></a>
</ul>
</body>
</html>
