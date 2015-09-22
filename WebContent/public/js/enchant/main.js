window.onload = function(){
	alert("test");
$(function(){
  game = new Game(WIDTH,HEIGHT);
  global.mapChangeManager = new Sprite(1,1);
  var stage = new Group();
  game.fps = 16;
  game.preload("/ganges/public/images/chara0.png","/ganges/public/images/map1.png","/ganges/public/images/chara2.png");
  game.onload = function(){
	  global.map = createMap(1.1);
	  global.chara = createPlayer(global);
	  stage.addChild(global.map);
	  stage.addChild(global.chara);
	  game.rootScene.addChild(stage);
	  game.rootScene.on('touchstart',function(e){//画面タッチしたらそこに瞬時に移動させる
		global.chara.x = e.x;
		global.chara.y = e.y;
	  });

	  global.label = new Label();
	  global.label.onenterframe = function(){
		  global.label.text = "x:"+global.chara.x+ ", y: "+global.chara.y + "   /MAP座標: "+global.map.mapPoint;
	  }
	  global.mapChangeManager.addEventListener('enterframe', function(){
		if(global.chara.x > WIDTH || global.chara.x < 0 || global.chara.y > HEIGHT || global.chara.y < 0){//画面端に触れたら
			changeMap(global.map.mapPoint);
			this.removeEventListener('enterframe',arguments.callee);
		}
	  });
	  game.rootScene.addChild(global.mapChangeManager);
	  game.rootScene.addChild(global.label);
  };//game.onload
  game.start();

});//$(function()
};//window.onload

