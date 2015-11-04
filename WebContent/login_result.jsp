<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">




<title>Insert title here</title>
</head>
<body>
入力名前${name }1111<br>
入力パス${pass }1111<br>

User.javaクラスの型の中に入ってる名前・パス
${user.user_name }9999<br>
${user.user_pass }9999<br>

DAO selectメソッドでもってきた値
${login_user.user_id }DAOID<br>
${login_user.user_name }DAONAME<br>
${login_user.user_pass }DAOPASS<br>

セッションログイン中の名前（入力した名前になる<c:out value="${ user_name}"/>
</body>
</html>