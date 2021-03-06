<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="util.Config" %>
<!DOCTYPE html>
<html lang="ja">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <script src="<%=request.getContextPath() %>/public/js/underscore.js"></script>
    <script src="<%=request.getContextPath() %>/public/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/public/js/enchant/lib/enchant.js"></script>
    <script src="<%=request.getContextPath() %>/public/js/enchant/lib/extendMap.enchant.js"></script>
    <script>
    //gameの初期設定
      var config = {
      	serverURL   : '<%=Config.getInstance().getServerURL()%>',
    	  initial_x   : 2,
    	  initial_y   : 3,
    	  game_width  : 320,
    	  game_height : 320,
    	}
    </script>
    <script src="<%=request.getContextPath() %>/public/js/enchant/global.js"></script>
    <script src="<%=request.getContextPath() %>/public/js/enchant/purchase.js"></script>
    <script src="<%=request.getContextPath() %>/public/js/enchant/util.js"></script>
    <script src="<%=request.getContextPath() %>/public/js/enchant/main.js"></script>
    <script src="<%=request.getContextPath() %>/public/js/chat.js"></script>

    <script src=""></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/public/css/main.css">
    <title>ぷれふり</title>
</head>
<body>
  <div id="chat">
    <div id="chat_log"></div>
    <div id="chat_message"></div>
  </div>
	<div id="game_window">
    	<div id="enchant-stage"></div>
  </div>

  <div style="border:3px solid #ddd;" id="shopping_cart"></div><!--itemのカートにいれるボタンを押したときに追加されるカートを表示する領域  -->
  <div id="item_target"></div><!-- shop内のitemを踏んだときにitemの詳細を表示する領域 -->


	<script>
		$(function(){

		});
	</script>
</body>

</html>