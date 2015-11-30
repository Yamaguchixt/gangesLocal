<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="util.Router" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
商品登録<br>
<form action="<%= Router.getInstance().getServerURL()%>ItemManageController"method="POST" enctype="multipart/form-data">
カテゴリid<input type="text" name="category_id"><br>
商品名<input type="text" name="name"><br>
価格<input type="text" name="price"><br>
サイズ<input type ="text" name="size"><br>
商品説明<input type="text" name="info"><br>
在庫<input type="text" name="stock"><br>
外観画像パス<input type="text" name="exterior_image_path"><br>
商品画像パス<input type="file" name="view_imege_path"><br>
<input type="submit" name="送信"value="登録"><br>
</form>
${MS }<br>
 <P><img src=${img }></p>


</body>
</html>