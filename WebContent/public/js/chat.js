var chat_cache = {
		client_id : "",
		websocket : {},
		movement_obj : null,
		avator : null,
		update_interval : 2000, // avatormovementを送信する間隔。

		getCliendId : function(){
			if (this.client_id == "") {
				this.cliend_id = getUUID();
			}
			return this.cliend_id;
		}

};
var getUUID = function(){
	var result="",i;
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  for(i = 0; i < 8; i++){
  	result += s4();
  }
  return result;
};
var sendAvatorMovement = function() {
	var json = JSON.stringify(createAvatorMovementObject());
	chat_cache.websocket.send(json);
	setTimeout(sendAvatorMovement,1500);

};
var processChat = function() {
	var json = JSON.stringify(createAvatorMovementObject());
	sendAvatorMovement()
};
var initiateWebSocket = function(){
	var url = "ws://" + window.location.host + '/ganges/WsChatServlet';
	chat_cache.websocket = new WebSocket(url);
	chat_cache.websocket.onopen = function(){
		processChat();
		console.log("onopen");
	}
	/*
	ws.onmessage = function(message){}
	ws.send(message);
	//どっかでws.close()処理。ブラウザが閉じられるイベント調べる。
	 */
};
var createAvatorMovementObject = function() {
	if(chat_cache.movement_obj == null) {
		var obj,avator;
		obj = {};
		obj.type = "avator_move";
		avator = {};
		avator.id 				     = chat_cache.getCliendId();
		avator.point_x 							 = global.chara.x;
		avator.point_y 						   = global.chara.y;
		avator.view_image_path = "/ganges/public/images/chara0.png";
		avator.frame = 0 //とりあえずハードコート。

		obj.avator = avator;
		chat_cache.movement_obj = obj;
	}
	else {
		chat_cache.movement_obj.avator.x = global.chara.x;
		chat_cache.movement_obj.avator.y = global.chara.y;
	}
	return chat_cache.movement_obj;
};


var chat = function(){
	initiateWebSocket();

}();





