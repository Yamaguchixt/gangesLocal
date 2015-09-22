enchant();
var game;
var WIDTH = 784;
var HEIGHT = 640;
var newScene;
var newChara;

var global = {};


var createPlayer = function(global){
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
            if (global.map.hitTest(player.x + 16, player.y + 32)) player.y += 4;
        }
        //下へ移動
        else if (game.input.down) {
            player.dir = DIR_DOWN;
            player.y += 4;
            if (global.map.hitTest(player.x + 16, player.y + 32)) player.y -= 4;
        }
        //左へ移動
        else if (game.input.left) {
            player.dir = DIR_LEFT;
            player.x -= 4;
            if (global.map.hitTest(player.x + 16, player.y + 32)) player.x += 4;
        }
        //右へ移動
        else if (game.input.right) {
            player.dir = DIR_RIGHT;
            player.x += 4;
            if (global.map.hitTest(player.x + 16, player.y + 32)) player.x -= 4;
        }

        //フレームの指定
        player.tick++;
        if (!game.input.up && !game.input.down &&
            !game.input.left && !game.input.right) player.tick = 1;//静止
        player.frame = player.anim[player.dir * 4 + (player.tick % 4)];

    });
    return player;

};

var createMap = function(mapPoint){
	var map = new ExMap(16,16);
	var mapDrawData;
	var shops;
	var collisionData;
	var path = "http://localhost:8080/ganges/EnchantApi?action=getMap&mapPoint="+mapPoint;
	$.getJSON(path,function(json){
		 map.mapPoint = json.mapPoint;
		 map.image = game.assets[json.imagePath];
		 mapDrawData = json.mapDrawData;
		// shops = json.shops;
		 collisionData = json.mapCollisionData;
		// createShops();
		map.loadData(mapDrawData,json.mapObjectData);
		map.collisionData = collisionData;
	});
	//map event設定

	var createShops = function(){
		var shopObjectImage = 26;
		for(var i in shops){
			var shop = new Sprite(32,32);
			shop.image = game.assets["/ganges/public/images/chara2.png"];
			shop.frame = shopObjectImage;
			shop.x = shops[i].x * 16;
			shop.y = shops[i].y * 16;

			shop.onenterframe = function(){
				if(this.within(chara,5)){
					console.log("chara:"+chara.x+","+chara.y+"  /  shop"+this.x+","+this.y);
					stage.removeChild(this);
				}
			};
			stage.addChild(shop);
		}
	}

	return map;
};
var changeMap = function(mapPoint){
	 newScene = new Scene();
	 //newChara = createPlayer();
	if(global.chara.x >= WIDTH){
		global.chara.x = 0;
		global.chara.y = global.chara.y;
		global.map = createMap(mapPoint+1.0);//上書きする前にmap管理オブジェクトに渡す
	}
	//mapをさきに加える。 chara mapとすると上書きされてしまう


	  newScene.on('touchstart',function(e){//画面タッチしたらそこに瞬時に移動させる
			global.chara.x = e.x;
			global.chara.y = e.y;
	 });
	 newScene.on('enterframe',function(){
			if(global.chara.x > WIDTH || global.chara.x < 0 || global.chara.y > HEIGHT || global.chara.y < 0){//画面端に触れたら
				changeMap(global.map.mapPoint);
			}
	});
	newScene.addChild(global.map);
	newScene.addChild(global.label);
	newScene.addChild(global.chara);
	game.pushScene(newScene);
};
