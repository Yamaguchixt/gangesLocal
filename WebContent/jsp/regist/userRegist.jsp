<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="util.Router" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
ユーザ登録<br>
<form action="<%= Router.getInstance().getServerURL()%>UserRegist" method="POST">
<p><%= Router.getInstance().getServerURL()%>UserRegist</p>
ユーザ名<input type="text" name="user_name"><br>
ユーザパスワード<input type="text" name="user_pass"><br>
郵便番号<input type="text" name="yubinbango"><br>
都道府県<input type="text" name="todouhuken"><br>
市区町村<input type="text" name="sikutyouson"><br>
番地建物<input type="text" name="bantitatemono"><br>
電話番号<input type="text" name="user_tell"><br>
<input type="submit" name="送信"value="登録"><br>
</form>


${nameErr }<br>
${ passErr}<br>
${yubinbangoErr }<br>
${yubinbangoErr2 }<br>
${yubinbangoErr3 }<br>
${todouhukenErr }<br>
${sikutyousonErr }<br>
${ bantitatemonoErr}<br>
${ tellErr}<br>
${ tellErr2}<br>

</body>
</html>