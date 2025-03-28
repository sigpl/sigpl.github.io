<HTML>
<!-----
  This document is generated by
  'php index.php > index.html'
----->
<HEAD>
<title>SIGPL: 학술대회</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/style.css">
<style type="text/css">
   th, td { vertical-align: middle; font-size: 10pt; }
</style>
</HEAD>
<body>
<h1>학술대회</h1>

<!-- table width="640pt"><tr><td> -->


<p>
연구회는 매년 프로그래밍언어 분야의 논문을 발표하는 학술대회를 갖고
있습니다. 학술대회에서는 한 해 동안 각 분야에서 노력한 연구결과들을
함께 모여서 경청하고 다양한 방향을 제안하는 자리입니다.
학술대회 논문은 프로그래밍언어논문지로 출판됩니다.
</p>

<?php

$list = array(
'2017' =>
  '07.08-11;
  강원대학교 공과대학 사이버랩;
   SIGPL Summer Workshop 2017;
  초청 11편, 기업체 1편, 특허청 1편',
  
'2016' =>
  '02.18-19;
  전북대학교 박물관;
   SIGPL Winter Workshop 2016;
  초청 2편, 기업체 1편, 마일스톤 12편, 라이트 토크 14편',

'2013' =>
  '06.28;
   디오션리조트, 콘도 지하2층 오동도;
   KCC 2013: 분과 워크샵;
   초청강연 4편',
'2012' =>
  '11.02-04;
   제주샤인빌리조트;
   프로그래밍언어연구회 학술대회;
  ',
'2011' =>
  '09.24;
   서울대학교;
   프로그래밍언어연구회 학술대회;
   초청강연 3편 논문 3편 기업체 1편',
'2008' =>
  '12.13;
   성균관대학교;
   프로그래밍언어연구회 추계학술대회;
   논문6편',
'2007' =>
  '04.28;
   동덕여자대학교;
   프로그래밍언어연구회 춘계학술대회;
   논문4편 초청강연2편',
'2006' =>
  '11.18;
   경북대학교;
   프로그래밍언어연구회 추계학술대회;
   논문6편 초청강연1편',
'2005' =>
  '11.19;
   한국항공대학교;
   프로그래밍언어연구회 추계학술대회;
   논문7편 초청강연1편',
'2004' =>
  '11.20;	
   고려대학교;
   프로그래밍언어연구회 추계학술대회;
   논문6편 사례연구1편',
'2003' =>
  '11.22;
   동국대학교; 	
   프로그래밍언어연구회 추계학술대회;
   논문8편 튜토리얼1강좌',
'2002' =>
  '11.09;
   한양대학교;
   프로그래밍언어연구회 학술발표대회;
   논문6편 튜토리얼1강좌',
'2001' =>
  '11.17;
   숙명여자대학교;
   프로그래밍언어연구회 학술대회;
   논문8편 튜토리얼1강좌',
'2000' =>
  '09.22-23;
   숭실대학교;
   전문분과합동추계학술발표회;
   논문41편(9편)',
'1999' =>
  '09.10-11;
   포항공과대학교;
   전문분과합동추계학술발표회;
   논문40편(9편)',
'1998' =>
  '09.25-26;
   부산대학교;
   추계학술논문발표회;
   논문13편',
'1997' =>
  '11.15;
   홍익대학교;
   정기총회 및 추계학술발표회;
   논문6편',
'1996' =>
  '11.23;
   홍익대학교;
   총회 및 학술발표회;
   초청강연2편 논문3편',
'1995' =>
  '10.21;	
   중앙대학교;
   프로그래밍언어 총회 및 학술발표회;
   논문4편',
'1994' =>
  '10.15;
   홍익대학교; 
   정기총회 및 추계학술발표회;
   논문8편',
'1993' =>
  '10.30;
   아주대학교;
   프로그래밍언어 추계학술발표회;
   논문10편',
'1992' =>
  '10.10;
   숭실대학교; 	
   추계 PL 학술 발표회;
   논문10편',
'1991' =>
  '10.12;
   동국대학교;
   프로그래밍언어연구회 추계학술발표회;
   논문3편',
'1989' =>
  '09.23;
   서울대학교;
   정기총회 및 논문 발표회;
   논문3편',
'1988' =>
  '09.10;
   충남대학교;
   제1차 PL 추계학술발표회;
   논문4편',
'1987' =>
  '10.17; 	
   한국과학기술원;
   초청강연 및 특별강좌;
   PL일반'
);

?>
<table width="100%">
<tr><th>년도</th><th>행사명</th><th>날짜</th><th>장소</th><th>비고</th></tr>
<?php

foreach($list as $key => $value) {
  $values = explode(";", $value);
  echo "<tr><th>$key</th>\n";
  echo "  <td>";
  $link = "";
  if(file_exists($key)) { $link = $key; }
  else if(file_exists($key.".html")) { $link = "$key.html"; }
  if($link != "") {
    echo "<a href=\"$link\">$values[2]</a>";
  }
  else {
    echo $values[2];
  }
  echo "</td>\n  <td>$values[0]</td>\n";
  echo "  <td>$values[1]</td>\n";
  echo "  <td>$values[3]</td>\n";
  echo "</tr>\n";
}
echo "</table>";
?>
<hr>
프로그래밍언어연구회
