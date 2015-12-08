var chat_cache = {
		client_id : "",
		websocket : {},
		movement_obj : null,
		avator : null,
		update_interval : 3500,// avatormovementを送信する間隔。
		other_avators : {}, //key -id value - avator オブジェクト(sprite)

		getClientId : function(){
			if (this.client_id == "") {
				this.client_id = getUUID();
			}
			return this.client_id;
		},
		isNewAvator : function(id) {  //送られてきたavator_movementが新規のものか判断。
			var result = false;
			if ( this.other_avators[id] == null)  {
				result = true;
			}
			else {result = false;	}
			return result;
		},
		setOtherAvator : function(id,avator_obj) {
			this.other_avators[id] = avator_obj;
		},
		getOtherAvator : function(id) {
			return this.other_avators[id];
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
	setTimeout(sendAvatorMovement,chat_cache.update_interval);

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
	};
	chat_cache.websocket.onmessage = messageHandle;
};
var messageHandle = function(message) {
	var obj = JSON.parse(message.data);
	if (obj.type == "avator_move") {
		var avator = obj.avator;
		if( avator.id != chat_cache.getClientId() && avator.map.x == global.currentMap.x) { //自分以外の情報でかつマップが同じか

			if ( chat_cache.isNewAvator(avator.id)) {
				console.log("first time avator" + avator.id);
				//描画処理
				//キャッシュ登録処理
				chat_cache.setOtherAvator(avator.id,{id : avator.id});

			}
			else { // avatorがすでに登録(描画済み)だったら
				console.log("already know " + avator.id);
			}
		}
		else { //avatorが自分だったら　又は違うマップだったら
			if ( avator.id == chat_cache.getClientId()) {
				console.log(avator.id + " is myself(" + chat_cache.getClientId() + ")");
			}
			else { //違うマップだったら
				console.log(avator.id + "is not myself(" + chat_cache.getClientId() + ") but other map avator" +
						"x :" + avator.map.x + " y : " + avator.map.y);
			}
		}
	}
	else { //obj.typeがavator_move以外

	}

};
var createAvatorMovementObject = function() {
	var obj,avator;
	if(chat_cache.movement_obj == null) {
		obj = {};
		obj.type = "avator_move";
		avator = {};
		avator.map = {};
		avator.map.x           = global.currentMap.x;
		avator.map.y           = global.currentMap.y;
		avator.id 				     = chat_cache.getClientId();
		avator.x 							 = global.chara.x;
		avator.y 						   = global.chara.y;
		avator.view_image_path = "/ganges/public/images/chara0.png";
		avator.frame = 0 //とりあえずハードコート。

		obj.avator = avator;
		chat_cache.movement_obj = obj;
	}
	else {
		avator = chat_cache.movement_obj.avator;
		avator.x = global.chara.x;
		avator.y = global.chara.y;
		avator.map.x = global.currentMap.x;
		avator.map.y = global.currentMap.y;
	}
	return chat_cache.movement_obj;
};


var chat = function(){
	initiateWebSocket();

}();






