<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="util.Router" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%= Router.getInstance().getServerURL()%>UserLogin" method="POST">
ユーザネーム<input type="text" name="user_name"><br>
パスワード<input type="text" name="user_pass"><br>
<input type="submit" name="送信"value="ログイン"><br>
<<<<<<< HEAD
${ nameErr}<br>
${ passErr}<br>
${ loginErr}<br>
=======
>>>>>>> 9f88f29b548c78837c027f7f6c97357f8e8cea0b

</form>
</body>
</html>