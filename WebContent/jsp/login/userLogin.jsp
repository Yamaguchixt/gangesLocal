<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="util.Router" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta name="keywords" content="ぷれふり,フリーマーケット,フリーマーケットサイト " />
<meta name="description" content="どうみてもフリーマーケットサイトです。本当にありがとうございました。" />
<meta name="robots" content="INDEX,FOLLOW" />
<script language="javascript1.2" src="top.js"></script>
<title>トップページ</title>
<link rel="stylesheet" media="all" type="text/css" href="<%=request.getContextPath() %>/public/css/common.css" />
<!-- ※共通のスタイル（./css/common.css） -->
<link rel="stylesheet" media="all" type="text/css" href="<%=request.getContextPath() %>/public/css/login.css" />
<!-- ※このページのスタイル（./css/login.css） -->
</head>
<body>
<form action="<%= Router.getInstance().getServerURL()%>UserLogin" method="POST">
	${ nameErr}<br>
	${ passErr}<br>
	${ loginErr}<br>
	<div id="wrapper">
		<div id="header">
			<div id="logo">
				<p><img src="./images/logo.gif"></p>
			</div> <!-- logoのdiv閉じ -->
		</div> <!-- headerのdiv閉じ -->

		<div id="main">
			<div id="login">
				<div id="loginform">
					<h2>新規会員登録</h2>
					<h3>ログイン</h3>
					<input type="text"name="user_name" style="color: rgb(128, 128, 128); width: 90%;" onBlur="ShowFormGuide(this);" onFocus="HideFormGuide(this);" value="ユーザ名を入力" size="30" />
					<input type="text"name="user_pass" style="color: rgb(128, 128, 128); width: 90%;" onBlur="ShowFormGuide2(this);" onFocus="HideFormGuide2(this);" value="パスワードを入力" style="color: #808080;">
					<input type="submit"name="送信"value="ログイン">
				</div> <!-- loginformのdiv閉じ -->
			</div> <!-- loginのdiv閉じ -->
		</div> <!-- mainのdiv閉じ --->

		<p id="password_forget">パスワードを忘れた方はこちら</p>

		<div id="footer">
			<p>Copyright 2015 Purefuri All rights reserved.</p>
		</div>	<!-- footerのdiv閉じ -->

	</div>	<!-- wrapperのdiv閉じ -->


</form>
</body>

<script type="text/javascript">
	   var GuideSentence = 'ユーザ名を入力';
	   function ShowFormGuide(obj) {
	      // 入力案内を表示
	      if( obj.value == '' ) {
	         obj.value = GuideSentence;
	         obj.style.color = '#808080';
	      }
	   }
	   function HideFormGuide(obj) {
	      // 入力案内を消す
	      if( obj.value == GuideSentence ) {
	         obj.value='';
	         obj.style.color = '#000000';
	      }
	   }

	   var GuideSentence2 = 'パスワードを入力';
	   function ShowFormGuide2(obj) {
	      // 入力案内を表示
	      if( obj.value == '' ) {
	         obj.value = GuideSentence2;
	         obj.style.color = '#808080';
	      }
	   }
	   function HideFormGuide2(obj) {
	      // 入力案内を消す
	      if( obj.value == GuideSentence2 ) {
	         obj.value='';
	         obj.style.color = '#000000';
	      }
	   }
	</script>
</html>