window.onload = function(){
$(function(){
  game = new Game(800,640);
  stage = new Group();
  game.fps = 16;
  game.preload("images/chara0.png","images/map1.png","images/chara2.png");
  game.onload = function(){
	  map = createMap(1);
	  chara = createPlayer();
	  stage.addChild(map);
	  stage.addChild(chara);
	  game.rootScene.addChild(stage);
  };//game.onload
  game.start();

});//$(function()
};//window.onload

