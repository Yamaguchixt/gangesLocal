var game;
var newChara;



var createPlayer = function(){
	var DIR_LEFT  = 0;
	var DIR_RIGHT = 1;
	var DIR_UP    = 2;
	var DIR_DOWN  = 3;
	var player = new Sprite(32,32)
    player.image = game.assets['/ganges/public/images/chara0.png'];
    player.x = 160;
    player.y = 160;
    player.dir   = DIR_DOWN;
    player.anim  = [
         9, 10, 11, 10, //左
        18, 19, 20, 19, //右
        27, 28, 29, 28, //上
         0,  1,  2,  1];//下

    //プレイヤーの定期処理
  player.tick = 0;
    player.addEventListener(Event.ENTER_FRAME, function() {
        //上へ移動
        if (game.input.up) {
            player.dir = DIR_UP;
            player.y -= 4;
            if (global.currentMap.hitTest(player.x + 16, player.y + 32)) player.y += 4;
        }
        //下へ移動
        else if (game.input.down) {
            player.dir = DIR_DOWN;
            player.y += 4;
            if (global.currentMap.hitTest(player.x + 16, player.y + 32)) player.y -= 4;
        }
        //左へ移動
        else if (game.input.left) {
            player.dir = DIR_LEFT;
            player.x -= 4;
            if (global.currentMap.hitTest(player.x + 16, player.y + 32)) player.x += 4;
        }
        //右へ移動
        else if (game.input.right) {
            player.dir = DIR_RIGHT;
            player.x += 4;
            if (global.currentMap.hitTest(player.x + 16, player.y + 32)) player.x -= 4;
        }

        //フレームの指定
        player.tick++;
        if (!game.input.up && !game.input.down &&
            !game.input.left && !game.input.right) player.tick = 1;//静止
        player.frame = player.anim[player.dir * 4 + (player.tick % 4)];

    });
    return player;
};

var createMap = function(x,y){
	var map = new ExMap(16,16);
	var path = global.server.url+'EnchantApi?action=getMap&x='+x+'&y='+y;
	$.getJSON(path,function(json){
		map.x = json.point_x;
		map.y = json.point_y;
		map.image = game.assets['/ganges' +json.image_path];// /public/images/map1.png が返ってくる
		map.loadData(json.drawing_data,json.object_data);
		map.collisionData = json.collision_data;
		global.setShopList(x,y,JSON.parse(JSON.stringify(json.shopList)));
		createShops(x,y,map);
	});
	return map;
};

var createShops = function(x,y,map){//createMapから呼ぶこと
global.scene[x+":"+y].scene.addChild(map);
	global.scene[x+":"+y].scene.addChild(global.chara);
	global.scene[x+":"+y].scene.addChild(global.label);
	global.scene[x+":"+y].scene.addChild(global.mapChangeManager);
	var shop_exterior_frame = 22;//shopのframeに使用 本来はサーバから取得。
	var array = global.getShopList(x,y);
	for(var i = 0;i < array.length;i++){
		var shop = new Sprite(32,32);
		shop.image = game.assets['/ganges'+array[i].exterior_image_path];
		shop.frame = shop_exterior_frame;
		shop.x = array[i].point_x;
		shop.y = array[i].point_y;
		shop.shop_id = array[i].shop_id;
		shop.user_id = array[i].user_id;
		shop.interior_image_path = array[i].interior_image_path;

		shop.on('enterframe',function(){
			if(global.chara.intersect(this)){
				goInShop(x,y,this.shop_id);
				global.chara.next = {};
				global.chara.next.x = this.x + 50; //shopからでるときにcharaが出現する位置。細かく制御するか検討。店にもたせるかx,yみてアルゴリズムで判断するか。
				global.chara.next.y = this.y;
				//this.removeEventListener('enterframe',arguments.callee); //このイベントりむると2回目に入れない
			}
		});
		global.scene[x+":"+y].scene.addChild(shop);
	}
};

var changeMap = function(x,y){
	var WIDTH  = config.game_width;
	var HEIGHT = config.game_height;
	if(global.chara.x >= WIDTH){
		global.chara.x = 0;
		global.setScene((x+1),y,new Scene());
		global.currentMap = createMap((global.currentMap.x+1),global.currentMap.y);
		global.currentMap.x = x+1;
		global.currentMap.y = y;
	}
	if(global.chara.x <= -10){
		global.chara.x = WIDTH - 30;
		global.setScene((x-1),y,new Scene());
		global.currentMap = createMap((global.currentMap.x-1),global.currentMap.y);
		global.currentMap.x = x-1;
		global.currentMap.y = y;
	}
	//mapをさきに加える。 chara mapとすると上書きされてしまう

	global.mapChangeManager.addEventListener('enterframe', function(){
		if(global.chara.x > WIDTH || global.chara.x < -10 || global.chara.y > HEIGHT || global.chara.y < 0){//画面端に触れたら
			changeMap(global.currentMap.x,global.currentMap.y);
			//this.removeEventListener('enterframe',arguments.callee); 消しちゃいけないと思われる。
		}
	 });

	setTouchMoveEvent(global.scene[global.currentMap.x+":"+global.currentMap.y].scene);

	game.pushScene(global.scene[global.currentMap.x+":"+global.currentMap.y].scene);
};

var goInShop = function( currentMap_x, currentMap_y, shop_id){
	//現在地保存しておく
	global.previous.x = global.chara.x;
	global.previous.y = global.chara.y;
	var scene 				= new Scene();
	var shopInterior 	= createShopInterior(currentMap_x, currentMap_y, shop_id);

	global.shopChangeManager.on('enterframe',function(){
		if ( global.chara.y > config.game_height){
			game.popScene();
			var nextScene = global.scene[currentMap_x+":"+currentMap_y].scene;
			nextScene.addChild(global.chara);
			nextScene.addChild(global.label);
			global.chara.x = global.chara.next.x;
			global.chara.y = global.chara.next.y;
		}
	});
	//item追加する前にシーンに追加しておく
	scene.addChild(shopInterior);
	scene.addChild(global.chara);
	scene.addChild(global.label);
	scene.addChild(global.shopChangeManager);
	setTouchMoveEvent(scene);

	global.chara.x = 50;
	global.chara.y = config.game_height - 30;

	var path = global.server.url + 'EnchantApi?action=getItems&shopId='+shop_id;
	$.getJSON(path,function(json){
	//jsonにitem配列があるので店に描画する
		var item;
		var	x = 80;
		var	y = 180;

		global.setItemList(shop_id,json);
		for(item in json) {
			var _item = new Sprite(16,16);
			_item.image = game.assets['/ganges'+json[item].exterior_path];
			_item.frame = 28; //frame情報がないのできめうち。
			_item.x     = x;
			_item.y     = y;
			_item.item_id    = json[item].item_id;
			_item.shop_id = json[item].shop_id;
			setItemEvent(_item);

			scene.addChild(_item);

			var _nextPoint = nextPoint(x,y);
			x = _nextPoint.x;
			y = _nextPoint.y;
		}

		game.pushScene(scene);
	})



};

var createShopInterior = function(currentMap_x, currentMap_y, shop_id){
	var shop  					= global.getShopObject(currentMap_x, currentMap_y, shop_id);
	var interiorMap		  = new ExMap(16,16);
	var tmp = '/ganges'+shop.interior_image_path;
	interiorMap.image 	= game.assets['/ganges' + shop.interior_image_path];
	interiorMap.loadData(shop.interior_draw_data, shop.interior_object_data);
	interiorMap.collisionData = shop.interior_collision_data;

	return interiorMap
};

var setTouchMoveEvent = function(scene){
	scene.on('touchstart',function(e){
		global.chara.x = e.x;
		global.chara.y = e.y;
	});
};

//itemをお店のどこにおくかを決定する関数
var nextPoint = function(x,y) {
	if ( y + 40 >  (config.game_height - 50) ) {
		y = 180;
		x = x + 40;
	}
	else { y = y + 40;}
	return {x : x,
					y : y};
};

var setItemEvent = function(_item) {
	//_itemはSpriteで　itemはオブジェクト
	var item = global.getItem(_item.shop_id,_item.item_id);
	_item.on('enterframe',function(){
			if (global.chara.intersect(_item)){
				if (global.current[item] != item.item_id) {
					global.current[item] = item.item_id;
					var style = ' style="max-width:50%;height:auto; "'
					var html = 	'<div class="item" data-item_id="' + item.item_id + '">'
											+	'<div class="item_name">' +item.name+ '</div>'
											+	'<div class="item_price">' +item.price+ '</div>'
											+ '<div class="item_image"><img' + style+ ' src="/ganges' + item.view_image_path + '"></div>'

											+ '<form>'
											+ 	'<input type="button" class="into_cart_button" value="カートに入れる" >'
											+ '</form>'
										+ '</div>';
					$('#item_target').empty().append(html);
					$('.into_cart_button').on('click',{item:item},function(event){ //event.data.name でアクセスできる。
						//cart状態の更新
						global.shoppingCart.item_num += 1;
						global.shoppingCart.sum      += event.data.item.price;
						var _item  = event.data.item;
						var _html = '<div data-cart-item="'+_item.item_id +'">'
												+	'<span>'+ _item.name +' : '+ _item.price + '</span>'
												+ '<form><input type="button" class="outof_cart_button" value="カートから削除"></form>'
												+ '</div>'
												;
						var sum_html = '<div id="cart_sum">合計金額 : '+ global.shoppingCart.sum + '</div>';
						var paypal_html =
								'<form id="paypal_button" action="'+global.server.url+'SetExpress" METHOD="GET" target="_blank">'
							+	'<input type="hidden" name="paymentAmount" value="' +global.shoppingCart.sum+ '">'
							+	'<input type="image" name="submit" src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" border="0" align="top"/>'
							+	'</form>'
						$('#cart_sum').remove();
						$('#paypal_button').remove();
						$('#shopping_cart').append(_html).append(sum_html).append(paypal_html);

						//カートから削除ボタンのイベント設定
						$('.outof_cart_button').on('click',{item:_item},function(event) {
							global.shoppingCart.item_num -= 1;
							global.shoppingCart.sum -= event.data.item.price;
							console.log("remove item :" + event.data.item.item_id);
							$('div[data-cart-item='+event.data.item.item_id+']').remove();
							var sum_html = '<div id="cart_sum">合計金額 : '+ global.shoppingCart.sum + '</div>';
							var paypal_html =
									'<form id="paypal_button" action="'+global.server.url+'SetExpress" METHOD="GET" target="_blank">'
								+	'<input type="hidden" name="paymentAmount" value="' +global.shoppingCart.sum+ '">'
								+	'<input type="image" name="submit" src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" border="0" align="top"/>'
								+	'</form>'
							$('#cart_sum').remove();
							$('#paypal_button').remove();
							$('#shopping_cart').append(sum_html).append(paypal_html);

						})
					});
				}
			}
	});
}

