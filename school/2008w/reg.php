<html>
<head>
<title> 등록 </title>
<link rel="stylesheet" type="text/css" href="style1.css">
</head>
<body>

<table width="660"><tr><td>

<h1>
정보과학회 프로그래밍언어연구회 (SIGPL)
<br>2008 겨울학교
</h1>
<center><table><tr><th align="left">
<li>일시: 2008년 1월 30일(수) - 2월 1일(금)
<li>장소: KAIST 전산학동
</td></tr></table>
</center>
<?php

$action = $_POST["action"];
$admin = "elee@dongduk.ac.kr";

$entry = array ('name' => '이름', 'org' => '소속', 'tel' => '(이동)전화번호', 'email' => '이메일');

if($action == "submit") {
  if($_POST["name"] == "" || $_POST["org"] == "" || $_POST["tel"] == "" ||
     $_POST["email"] == "") 
     $action = "error";
}
function showif($action, $name) {
  global $_POST, $entry;
  echo "<tr><th>";
  if($action == "error" && $_POST[$name] == "") {
     echo "<font color=\"red\">";
     echo $entry[$name];
     echo "</font>";
  }
  else
     echo $entry[$name];
  echo "</th><td><input type=\"text\" name=\"$name\" value=\"";
  echo $_POST[$name];
  echo "\" size=\"30\"></td></tr>\n";
}
function showhidden($name, $value) {
  echo "<input type=\"hidden\" name=\"$name\" value=\"$value\">\n";
}
function postredirect($fields) {
  global $_POST;
  foreach($fields as $field) 
    showhidden ($field, $_POST[$field]);
}
function sendmail($recv) {
  global $_POST, $entry;
  $subject = "SIGPL Registration";
  $m = "다음과 같이 등록이 완료되었습니다.\n\n- 등록비: $_POST[price] 원\n";
  foreach($entry as $key => $value)
    $m = $m . "- ". $value . ": ".$_POST[$key]."\n";
  $m = $m . "- 결제방법: ";
  if($_POST['method'] == 'card') $m = $m . "신용카드\n";
  else {
    $m = $m . "계좌이체 (신한(조흥)은행 313-03-002919 (사)한국정보과학회)\n";
    if($_POST['tax'] == 'yes') 
      $m = $m . "- 세금계산서 발급요청: 사업자등록증 사본을 " . 
           $admin . "로 송부요망\n";
      $m = $m . "  또는 단체명, 대표자, 법인등록번호, 소재지, 등록번호, 업태, 종목 정보 송부요망\n"; 
  }
  $m = $m . "\nSIGPL 사전등록 페이지 마법사\n";
  mail($recv, $subject, $m);
}

if($action != "submit" && $action != "finish" && $action != "finishcard") {
?>
  <h2> 등록 페이지</h2>

<center>
다음 테이블의 모든 항목을 채워 주십시오.
<?php if($action == "error") echo "빨간 색 항목을 모두 채워 주세요."; ?>
<form action="reg.php" method="post">
<input type="hidden" name="action" value="submit">
<table>
<?php
foreach($entry as $key => $value) showif($action, $key);
?>
<tr><th>
등록비 
</th>
<td>
<input type="radio" name="price" value="150000" checked>학생 150,000원
<br><input type="radio" name="price" value="200000"
  <?php if($_POST['price'] == 200000) echo "checked" ?>
>일반회원 200,000원
<br><input type="radio" name="price" value="250000"
  <?php if($_POST['price'] == 250000) echo "checked" ?>
>비회원 250,000원
</td>
</tr>
<tr><th>
결제방법
</th>
</th><td><input type="radio" name="method" value="card" checked> 신용카드
<br><input type="radio" name="method" value="transfer"
  <?php if($_POST['method'] == "transfer") echo "checked" ?>
> 계좌이체
</td></tr>
<tr><th>
  세금계산서
</th><td><input type="checkbox" name="tax" value="yes" 
  <?php if($_POST['tax'] == "yes") echo "checked"; ?>> 
  발급을 요청합니다 (계좌이체시만 가능)
</td></tr>
<tr><td></td><td><input type="submit" value="등록합니다"></td></tr>
</table>
</center>
</form>
<?php
}
else if($action == "submit" || $action == "finish") {
  if($action == "submit") 
    echo "<h2> 등록 확인 </h2><center>다음과 같이 등록을 요청하셨습니다.";
  else {
    sendmail($admin);
    sendmail($_POST['email']);
    echo "<h2> 등록 완료 </h2><center>요청하신 등록을 접수하였습니다. 겨울학교에서 만납시다.";
  }
?>
<table>
<?php
  foreach($entry as $key => $value) 
    echo "<tr><th>$value</th><td>$_POST[$key]</td></tr>";
  echo "<tr><th>등록비</th><td>";
  if($_POST["price"] == "150000") echo "학생 150,000원";
  else if($_POST["price"] == "200000") echo "일반회원 200,000원";
  else echo "비회원 250,000원";
  echo "</td></tr>";
  echo "<tr><th>결제</th><td>";
  if($_POST["method"] == "card") echo "신용카드"; 
  else {
    echo "계좌이체 (조흥은행 313-03-002919, (사)한국정보과학회)</td></tr>";
    echo "<tr><th>세금계산서 발급</th><td>";
    if($_POST['tax'] == "yes") { 
      echo "요청 (사업자등록증 복사본을 ";
      echo $admin;
      echo "로 송부요망)";
    }
    else
      echo "요청하지 않음";
  }
  echo "</td></tr>";
  echo "</table>";
  if($_POST["method"] == "transfer" && $action == "submit") {
?>
  <br>
  <form action="reg.php" method="post">
  <?php 
    postredirect(array ('name', 'org', 'tel', 'email', 'price',
    'method', 'tax')); 
    showhidden("action", "finish");
  ?> 
  <input type="submit" value="계좌이체를 완료하였으며 등록을 원합니다.">
  </form>
  <form action="reg.php" method="post">
  <?php 
    postredirect(array ('name', 'org', 'tel', 'email', 'price',
    'method', 'tax')); 
  ?>
  <input type="submit" value="정보가 틀렸습니다. 다시 시작하겠습니다.">
  </form>
<?php
  }
  else if($_POST['method'] == "card") {
?>
  <br>
  <form action="reg.php" method="post">
  <?php 
    postredirect(array ('name', 'org', 'tel', 'email', 'price', 'method'));
    showhidden("action", "finishcard"); 
  ?> 
  <input type="submit" value="정보를 확인하였습니다. 카드결제를 원합니다.">
  </form>
  <form action="reg.php" method="post">
  <?php 
    postredirect(array ('name', 'org', 'tel', 'email', 'price', 'method')); 
  ?>
  <input type="submit" value="정보가 틀렸습니다. 다시 시작하겠습니다.">
  </form>


<?php
  }
?>
</table>
</center>
<?php
}
else if($action == "finishcard") {
  sendmail($admin);
  sendmail($_POST['email']);
?>
<form name=way_INI action="pay/check.php" method="post">
<?php postredirect(array('name', 'email', 'price', 'tel')); ?>
</form>
<script language=javascript>
document.way_INI.submit(); 
</script>

<?php
}

?>
</td></tr></table>
</body>
</html>
