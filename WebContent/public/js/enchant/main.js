window.onload = function(){
$(function(){
  game = new Game(config.game_width,config.game_height);
  var initialX = config.initial_x; //初期座標
  var initialY = config.initial_y;
  game.fps = 16;
  game.preload("/ganges/public/images/chara0.png","/ganges/public/images/map1.png","/ganges/public/images/chara2.png");
  game.onload = function(){
	  global.setScene(initialX,initialY,game.rootScene);
	  global.chara = createPlayer();
	  var map = createMap(initialX,initialY);
	  global.currentMap = map;
	  global.currentMap.x = initialX;
	  global.currentMap.y = initialY;

	  game.rootScene.on('touchstart',function(e){//画面タッチしたらそこに瞬時に移動させる
		global.chara.x = e.x;
		global.chara.y = e.y;
	  });

	  global.label.onenterframe = function(){
		  global.label.text = "x:"+global.chara.x+ ", y: "+global.chara.y + "   /MAP座標[x: "+global.currentMap.x+" y:"+global.currentMap.y+"]";
	  }
	  global.mapChangeManager.addEventListener('enterframe', function(){
	  	var WIDTH = config.game_width;
	  	var HEIGHT = config.game_height;
		if(global.chara.x > WIDTH || global.chara.x < 0 || global.chara.y > HEIGHT || global.chara.y < 0){//画面端に触れたら
			changeMap(initialX,initialY);
			this.removeEventListener('enterframe',arguments.callee);
		}
	  });

  };
  game.start();

});//$(function()
};//window.onload

