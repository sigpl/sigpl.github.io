
<?php

$volume = 12;
$number = 1;
$year = 1998;
$month = 4;

  $list = array(

array(
  num => '01',
  title => "함수형 프로그램들이 사용된 예",
  author => "이광근 (KAIST)",
  abstract => '

프로그래밍 언어의 인기도는 분명 "성적순"은 아니다. 현재 인기를 누리고
있는 언어들(C, C++, Java등)은 프로그래밍 언어 분야의 중요한
연구성과들을 충실히 구현한 언어들은 아니기 때문이다. 프로그램의
실행(evaluation, dynamic semantics), 기획(type, static semantics),
프로그램 명시와 증명(specification and proof)등에 대해서 수학적으로
모델을 만들고 엄밀하게 찾아낸 해결방안들은 실제의 프로그래밍 언어로
최대한 담아낸 것들이 여럿 있음에도 불구하고 많은 사람들은 알지 못하거나
아직은 실용적이지 않을 것이라고 짐작하고 있다. 사실은 중요한
소프트웨어의 개발에 이러한 튼튼한 기초를 가진 언어들이 그 장점을 살려
이용되고 있는 경향이 점점 빈번해지고 있다. Pill Wadler(<a
href="http://cm.bell-labs.com/cm/cs/who/wadler">http://cm.bell-labs.com/cm/cs/who/wadler</a>)는
최근에 함수형 언어(functional language)가 실제 문제에 성공적으로 적용된
여섯가지 예를 정리한 기사를 [ACM SIGPLAN Notice 33(2), 1998]에
실었다. 이 기사의 내용과 다른 예들을 첨가해서 정리해 보았다.

'),
array(
  num => '02',
  title =>'함수 언어 Haskell과 Clean의 상용화 동향',
  author => '변석우, 최광훈',
  abstract => '

함수형 언어는 견고한 이론을 기반으로 설계 구현되고 있으므로, 다른
부류의 언어들이 갖지 못하는 많은 장점을 가지고 있다. 그러나 함수 언어는
실용적으로 아직 활발하게 사용되지 못하고 있는 실정이다. 함수 언어의
\'이론적 장점\'과 \'비실용성\' 사이의 괴리를 해소하기 위해서 극복해야
할 주요 난관은 함수언어 \'컴파일러의 저성능\'과
\'side-effect프로그래밍의 부적합성\'의 문제였다. 최근 하드웨어의 빠른
성장과 함수 언어 컴파일러 기법의 발전으로 함수 언어 컴파일러의 저성능의
문제는 많이 완화되었다고 본다. 예를 들어, 함수언어 Clean의 성능은 C와
견줄 수 있을 정도로 빠르다. 함수 언어를 이용한 side-effect 프로그래밍
연구의 핵심은 함수 프로그래밍 고유의 수학적 순수성(예를 들어,
equational reasoning과 referential transparency 특성 등)을 유지하면서
입출력 및 인터페이스에 대한 이론적 기반을 정립하고 이것을 구현하는데
있다. 최근 category 이론을 응용한 Monad와 선형 논리의 개념을 응용한
Clean의 Unique 타입의 각각 함수 언어 Haskell과 Clean에서 구현되었다. 이
기능들 덕택으로 함수 프로그래밍에서 side-effect가 쉽게 표현할 수 있게
되었다. 한편, 컴퓨터 및 관련 시스템 환경이 급격히 바꾸고 있다. 하드웨어
가격대비 소프트웨어의 가격이 상승하고 있으며, 인터넷을 이용하는 응용
프로그램이 등장함에 따라 시스템의 안전성 및 보안 등이 중요한 이슈로서
등장하고 있다.이러한 환경의 변화는 함수 프로그래밍 언어의 장점들을 더욱
부각시키고 있으며, 함수 언어 상용화에 대한 관심을 고조시키고 있다. 함수
언어의 상용화가 성공된다며 이것은 컴퓨터 분야에서 \'학문\'과 \'실용\'
사이의 거리를 단축시키는 중요한 공헌을 하는 셈이며, 산업과 연구 전반에
걸쳐 큰 영향을 미칠 것으로 예상한다. 함수 언어 상용화에 대한 여러
연구들 중에서, 본 고에서는 함수언어 Haskell을 일반 대중이 사용할 수
있도록 상용화하기 위한 연구와, Clean 의 상품화에 대하여 소개하려
한다. 좀 더 구체적으로 관심이 있는 독자들은 제시된 참고문헌들을
참고하기 바라며, 본 고에서는 기본적인 사항들에 대해서만 언급하기로
한다.'),


);

$tlist = array(
array(
  num => 'T01',
  title => "힙 메모리 분석 및 검증의 연구 동향",
  etitle => "A Survey of Heap-Memory Analyses and Verifications",
  author => "이욱세 (한양대학교)",
  abstract => '

힙 메모리에 대한 프로그램 분석은 그 난해성으로 인해 오랫동안 뚜렷한
연구 성과가 없다가 최근 독보적인 연구들로 다시 관심이 집중되기
시작했다. 본 동향 분석은 현존하는 힙 메모리 분석들을 메모리 객체들을
요약하는 방법들로 분류하여 설명한다. 특히, 출생지 기반 분석, 접근경로
기반 분석, 모양분석, 분리논리의 루프불변식 유추 엔진 등을 설명한다. 본
조사를 통하여 연구자들이 새로이 힙 메모리 연구를 시작하는데 도움이
되고자 한다. 

')
);
function show($elm) {
  global $volume, $number;
  echo '<li>';
  echo '<span class="number">', $volume, '-', $number, '-';
  echo $elm['num'];
  echo "</span>\n<br>";
  echo '<span class="title">';
  echo $elm['title'];
  echo "</span>\n<br>";
  echo $elm['etitle'];
  echo "\n<br>";
  echo $elm['author'];
  echo "\n<br>";
  echo '<span class="link">';
  echo '[ <a href="#', $elm['num'], '">요약</a> | ', "\n";
  echo '<a href="', $elm['num'], '.pdf">PDF</a> ]</span>';
}

/* 문서의 시작부분 */

?>
<html>
<head>
<title>프로그래밍언어논문지 제<?php echo $volume; ?>권 제<?php echo $number; ?>호</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<table border="0" width="605">

<tr><td>

<h1>프로그래밍언어논문지 제<?php echo $volume; ?>권 제<?php echo $number; ?>호 
    (<?php echo $year;?>년 <?php echo $month; ?>월)</h1>
<h2>목차 (Table of Contents)</h2>
<ul>
<li> <span class="content">편집사 (Preface)</span> <span class="link">[ <a href="preface.pdf">PDF</a> ]</span>
<li> <span class="content">연구논문 (Technical Papers)</span>
<ul>
<?php
foreach($list as $elm) show($elm);
?>


</ul>

<li> <span class="content">튜토리얼 (Tutorial)</span>
<ul><?php

foreach($tlist as $elm) show($elm);


?>
</ul></ul>
<h2>요약 (Abstracts)</h2>
<?php

foreach((array_merge ($list, $tlist)) as $elm) {
  echo '<h3>';
  echo $elm['title'];
  echo '</h3>';
  echo $elm['abstract'];
}


?>
</td></tr></table>