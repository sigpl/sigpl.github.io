<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<html>
<head>
<link rel="stylesheet" type="text/css" href="/style.css">
<title>SIGPL 2009 여름학교</title>
<style type="text/css">
   .small { font-size: 10pt; }
   .smallbold { font-size: 10pt; font-weight: bold; }
</style>
</head>
<body>

<h1>
<center>
한국정보과학회 프로그래밍언어연구회 여름학교
<br> (SIGPL Summer School 2009)
</center>
</h1>
<center><table><tr><th align="left">
<li>
   주제: Coq를 이용한 정리증명 및 프로그래밍
<li>
   일시: 2009년 8월 18일(화) ~ 8월 20일(목)
<li>
   장소: 목포대학교 도림캠퍼스 대외협력관 1층 소강의실
</td></tr></table>
</center>
<br>
 <p>
한국정보과학회 프로그래밍언어 연구회(SIGPL)는 매년 여름과 겨울
방학기간에 대학원생과 엔지니어, 교수, 연구자들을 대상으로 계절학교를
개최하고 있습니다. 이번 여름학교에서는 정형 증명 도구 Coq를 이용하여
논리학의 정리 증명 이론을 프로그래밍하고 실습하는 강의를
준비하였습니다. 프로그래밍언어, 정형 기법, 시스템의 검증과 안전성,
그리고 전산학의 기초 이론 분야에 유익한 기회가 될 수 있을
것입니다. 많은 관심과 참여를 부탁드립니다.
</p>
<p>
<b>한국정보과학회 프로그래밍언어연구회 운영위원장 변석우</b>
</p>
<h2> 프로그램 소개</h2>

<p>
SIGPL 2009 여름학교에서는 증명보조기 Coq을 이용한 프로그래밍에 대해서 강좌를
개설합니다. 증명보조기 Coq을 이용해서 실제로 논리식으로 표현된 증명을 Coq
프로그램으로 표현하는 방법을 배우며, 기초적인 명제논리의 증명에서 시작하여 Coq
프로그래밍의 핵심 기법중의 하나인 귀납적 술어논리의 증명까지 다룹니다. 본
강좌는 이론적 배경을 설명하는 강의와 실제 Coq으로 프로그래밍을 해 보는 실습으로
구성되며, 실습시간에는 강사와 조교가 직접 프로그래밍을 도와주게 됩니다.  
</p>

<p>
본 강좌는 논리학에 관심이 있는 학부생, 대학원생을 주 대상으로 하며, 전산학의
기초 지식만 있으면 누구나 수강할 수 있도록 설계하였습니다. 
<ul>
<li> 강사 : 이계식(서울대학교), 박성우(Postech) 
<li> 조교 : 임현승(Postech), 박종현(Postech)
</p>
</ul>
</p>

<h2>프로그램 일정</h2>

<?php

$content = 
  'head | 첫째날 8월 18일 (화) 오후 ##
   13:30 | 개교식 | ##
   14:00-15:20 &nbsp; | class 1 &nbsp; | natural deduction, propositional logic, proof term (강의) ##
   15:30-17:00 | class 2 | Coq 소개, propositional logic, proof term (강의, Coq 실습) ##
   17:30 | 만찬 | ##
   head | 둘째날 8월 19일 (수) 오전 ##
   09:00-10:20 | class 3 | first-order logic (강의, Coq 실습) ##
   10:30-12:00 | class 4 | inductive datatype, inductive predicate (강의)##
   head | 둘째날 8월 19일 (수) 오후 ##
   13:00-14:20 | class 5 | inductive datatype (Coq 실습) ##
   14:30-16:00 | class 6 | inductive predicate (Coq 실습)## 
   head | 셋째날 8월 20일 (목) 오전 ## 
   09:00-10:20 | class 7 | inductive proof (Coq 실습)##
   10:30-12:00 | class 8 | inductive proof (Coq 실습) 
';

$list = explode("##", $content);

echo '
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
      else if($sw > 1) { echo "<th>".$elm."</th>"; }
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
					  
echo "</table></table>";

?>
	
<h2>참가 준비</h2>

<p>참석하는 학생들은 실습을 위해서 노트북에 Coq 소프트웨어를 미리 설치해서
가져와야 합니다. (여름학교에서 노트북을 별도로 준비하지 않습니다.) Coq
소프트웨어는 다음 웹페이지에서 다운로드 받을 수 있으며 현재 웹페이지에서
제공되고 있는 8.2pl1 버전을 설치하면 됩니다.  Coq 실습은 CoqIDE를 이용해서
진행하므로 CoqIDE가 실행되도록 준비하면 됩니다. Emacs 환경을 위한 CoqIDE 설치는 ProofGeneral을 이용하시면 됩니다.

<ul> 
<li>Coq 소프트웨어 설치:
<a href="http://pauillac.inria.fr/coq" target="_blank">http://pauillac.inria.fr/coq</a>
  <li>ProofGeneral 설치:
<a href="http://proofgeneral.inf.ed.ac.uk" target="_blank">http://proofgeneral.inf.ed.ac.uk</a>
  <li>참가 전에 예습:
<a href="http://pauillac.inria.fr/coq/V8.2/doc/html/tutorial.html" target="_blank">http://pauillac.inria.fr/coq/V8.2/doc/html/tutorial.html</a>
</ul>
강의자료 및 숙제자료는 다음과 같습니다.
<ul>
  <li> 강의자료: <a href="sigpl2009.pdf">강의교재</a>,
  <a href="sigpl2009.v">강의자료 Coq 파일</a>,
  <a href="sigpl2009.html">강의자료 Coq 파일 설명서</a> 
  <li> 숙제: <a href="sigpl2009-hw.pdf">숙제</a>,
  <a href="sigpl2009-hw.v">숙제 Coq 파일</a>
</ul>

</p>

				   

<h2> 등록안내 </h2>
<ul>
<li> 등록비 
<table border="1" bordercolor="#a0a0a0" cellspacing="0">
<tr><th>&nbsp;</th><th>학생회원</th><th>일반회원</th><th>비회원</th></tr>
<tr align="center"><th>등록비</th><td>150,000원</td><td>200,000원</td><td>250,000원</td></tr>
</table>
  <li> 등록 방법: <a href="/pay/school.php">등록페이지</a>를 통하여 등록
		    <li> 제한된 예산 내에서 지원이 필요한 학생회원에게 등록비 일부를 지원할 예정입니다. 등록비 지원이 필요하신 분은 이메일 <img src="/mail/jsahn.jpg">로 등록 전에 미리 신청 바랍니다. (이 경우 현금 이체 사전등록만 가능)
</ul>

<h2> 준비위원회 </h2>
<ul>
<li> 학술위원장: 박성우 교수 (포항공과대학교)
  <li> 조직위원장: 최종명 교수 (목포대학교)
  <li> 문의: 안준선 교수 (한국항공대학교, 010-6208-5593, <img src="/mail/jsahn.jpg">)
</ul>

  <h2> 장소안내 </h2>
<h3> 목포대학교 도림캠퍼스 오시는 길</h3>

<center>
<a href="mokpo.jpg"><img border="0" width="400" src="mokpo.jpg"></a>
</center>

<ol>
<li> 승용차
<ul>
<li> 서해안고속도로: 목포방향 -> 무안IC -> 청계면 -> 목포대학교
<li> 호남 고속도로 -> 광주 -> 광주 동림IC -> 광주-무안 고속도로 -> 서해안 고속도로 -> 무안IC -> 청계면 -> 목포대학교  (* 위의 그림은 광주-무안 고속도로 그림이 빠져있습니다. *)
</ul>
<li> 기차 (KTX, 새마을, 무궁화) (KTX 용산역에서 3시간 20분)
<ul><li>
목포행 기차(용산역) -> 목포역 -> 200번 좌석버스(역 앞에서) -> 목포버스터미널 -> 목포대학교 (목포역에서 학교까지 약 40~50분 소요)
</ul>
<li> 버스 (강남역에서 약 4시간 30분)<ul><li>
목포행 버스(강남) -> 목포 버스 터미널 -> 200번 좌석버스 (큰길 맞은편에서) -> 목포대학교 (목포버스 터미널에서 학교까지 약 30분 소요)
</ul>
<li> 비행기<ul><li>
김포(12:00) -> 무안공항(12:55) -> 목포대학교 (TAXI 활용)
김포 -> 광주 공항 -> 광주 버스터미널 -> 목포 버스 터미널 -> 200번 좌석버스 (큰길 맞은편에서) -> 목포대학교 (목포버스 터미널에서 학교까지 약 30분 소요)
</ol>

<h3>
학교내부에서 대외협력관까지 오시는 길</h3>
<center>
<a href="building.jpg"><img width="640" border="0" src="building.jpg"></a>
</center>
<ul>
<li>
				 B24 1층 소강의실: 정문 -> 분수대 -> 분수대 왼쪽길 -> 골프연습장 -> 우측 2번째 건물 (큰 나무가 있는 건물)
</ul>
</ul>

</body>
</html>
