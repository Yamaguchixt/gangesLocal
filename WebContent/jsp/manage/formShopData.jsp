<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="util.Router" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath() %>/public/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/public/css/common.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/public/js/jquery-1.11.3.min.js"></script>
<script src="<%=request.getContextPath() %>/public/js/bootstrap.js"></script>
<title>Insert title here</title>
</head>
<body>
<p>URI:<%= request.getRequestURI() %></p>
<p>URL:<%= request.getRequestURL() %></p>
Shop登録
<form method="post" action="<%= request.getContextPath() %>/ShopManageController">
ユーザid<input type="text" name="user_id"><br>
ショップ名<input type="text" name="name"><br>
作成日時<input type="text" name="date"><br>
外観画像パス<input type="text" name="exterior_image_path"><br>
マップid<input type="text" name="map_id"><br>
配置ポイントx<input type="text" name="point_x"><br>
配置ポイントy<input type="text" name="point_y"><br>
インテリア画像パス<input type="text" name="interior_image_path"><br>
インテリアドローデータ<input type="text" name="interior_draw_data"><br>
インテリアオブジェクトデータ<input type="text" name="interior_object_data"><br>
インテリアコリジョンデータ<input type="text" name="interior_collision_data"><br>
<input type="submit" value="登録">




</form>


</body>
</html>