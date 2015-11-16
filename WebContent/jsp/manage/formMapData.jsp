<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=request.getContextPath() %>/public/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/public/css/common.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/public/js/jquery-1.11.3.min.js"></script>
<script src="<%=request.getContextPath() %>/public/js/bootstrap.js"></script>
<title>MAPデータ入力</title>
<%

%>
</head>
<body>
<div class="container">
<p>URI:<%= request.getRequestURI() %></p>
<p>URL:<%= request.getRequestURL() %></p>
<p>2</p>

<form method="post" action="<%= request.getContextPath() %>/EnchantManageController">
	<input type="hidden" value="mapCreate" name="action">
	<div class="form-group">
		<label for="mapPoint" class="control-label">配置_x</label>
		<input  class="form-control" type="text" name="point_x" id="point" placeholder="例: 2">
	</div>
		<div class="form-group">
		<label for="mapPoint" class="control-label">配置_y</label>
		<input  class="form-control" type="text" name="point_y" id="point" placeholder="例: 3">
	</div>
	<div class="form-group">
		<label for="category" class="control-label">image_path</label>
		<input class="form-control" type="text" name="image_path" id="imagePath" placeholder="例(絶対pathで):　/pubic/images/map1.png">
	</div>
	<div class="form-group">
		<label for="drawData" class="control-label">drawing_data</label>
		<textarea class="form-control textarea" name="drawing_data" id="drawData" placeholder="[[1,1,3],[1,2,3]]"></textarea>
	<div class="form-group">
		<label for="objectData" class="control-label">object_data</label>
		<textarea class="form-control textarea" name="object_data" id="objectData"></textarea>
	</div><div class="form-group">
		<label for="collisionData" class="control-label">collision_data</label>
		<textarea class="form-control textarea" name="collision_data" id="collisionData"></textarea>
	</div>
		</div><div class="form-group">
		<label for="collisionData" class="control-label">shop_puttable_data</label>
		<textarea class="form-control textarea" name="shop_puttable_data" id="collisionData"></textarea>
	</div></div>
<<<<<<< HEAD
		<input type="submit" value="登録" class="btn btn-primary">
</form>
${xErr }<br>
${ yErr}<br>
${ imageErr}<br>
${ drawingErr}<br>
${ objectErr}<br>
${ collisionErr}<br>
${ shopErr}<br>

		<input type="submit" value="送信" class="btn btn-primary">
</form>

</div>
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