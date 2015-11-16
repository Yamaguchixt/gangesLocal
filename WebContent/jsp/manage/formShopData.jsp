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
<div class="container">
<p>URI:<%= request.getRequestURI() %></p>
<p>URL:<%= request.getRequestURL() %></p>
Shop登録
<form method="post" action="<%= request.getContextPath() %>/ShopManageController">
<div class="form-group">
<label for="mapPoint" class="control-label">ユーザid</label><input type="text" name="user_id"><br>
</div>
<div class="form-group">
<label for="mapPoint" class="control-label">ショップ名</label><input type="text" name="name"><br>
</div>
<div class="form-group">
<label for="mapPoint" class="control-label">作成日時</label><input type="text" name="date"><br>
</div><div class="form-group">
<label for="category" class="control-label">外観画像パス</label><input type="text" name="exterior_image_path"><br>
</div><div class="form-group">
<label for="mapPoint" class="control-label">マップid</label><input type="text" name="map_id"><br>
</div><div class="form-group">
<label for="mapPoint" class="control-label">配置ポイントx</label><input type="text" name="point_x"><br>
</div><div class="form-group">
<label for="mapPoint" class="control-label">配置ポイントy</label><input type="text" name="point_y"><br>
</div><div class="form-group">
<label for="mapPoint" class="control-label">インテリア画像パス</label><input type="text" name="interior_image_path"><br>
</div><div class="form-group">
<label for="drawData" class="control-label">インテリアドローデータ</label><br>
<textarea class="form-control textarea" name="interior_draw_data" id="collisionData"></textarea>
	</div>
<div class="form-group">
<label for="drawData" class="control-label">インテリアオブジェクトデータ</label><br>
<textarea class="form-control textarea" name="interior_object_data" id="collisionData"></textarea>
</div>
<div class="form-group">
<label for="drawData" class="control-label">インテリアコリジョンデータ</label><br>
<textarea class="form-control textarea" name="interior_collision_data" id="collisionData"></textarea>
</div>
</div>
<input type="submit" value="登録">




</form>
<script>
$(".textarea").height(30);//init
$(".textarea").css("lineHeight","20px");//init

$(".textarea").on("input",function(evt){
    if(evt.target.scrollHeight > evt.target.offsetHeight){
        $(evt.target).height(evt.target.scrollHeight);
    }else{
        var lineHeight = Number($(evt.target).css("lineHeight").split("px")[0]);
        while (true){
            $(evt.target).height($(evt.target).height() - lineHeight);
            if(evt.target.scrollHeight > evt.target.offsetHeight){
                $(evt.target).height(evt.target.scrollHeight);
                break;
            }
        }
    }
});
</script>

</body>
</html>