<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset=UTF-8>
    <title>Chat Sample</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    $(function(){
    	console.log(window.location.host);
    	var url = "ws://" + window.location.host + '/ganges/WsChatServlet';
      var ws = new WebSocket(url);
      console.log(url)
      ws.onopen = function() {
        console.log("ws.onopen invked");
      };
      ws.onmessage = function(message) {
    	   var tmp = document.getElementById("chatlog");
         $("#chatlog").prepend(message.data + "<br/>");
      };

      function postToServer() {
    	   ws.send(document.getElementById("msg").value);
    	   document.getElementById("msg").value = "";
      }
      function closeConnect() {
    	   ws.close();
      }
      $("#sendButton").on("click",postToServer);
    });
    </script>
  </head>
  <body>
    <textarea id="chatlog" readonly></textarea><br>
    <input id="msg" type="text">
    <button type="submit" id="sendButton">send</button>
    <button type="submit" id="sendButton">end</button>
  </body>
</html>
