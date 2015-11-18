enchant();
var global = {
		isSee:true,
		scene: {},
		currentMap:{},
		server:{
			url  : config.serverURL

		},

		chara: {},
		label: new Label(),
		mapChangeManager  : new Sprite(1,1),
		shopChangeManager : new Sprite(1,1),
		previous :{},

		setScene: function(x,y,scene){
			if(!existy(this.scene[x+":"+y])){this.scene[x+":"+y] = {}; }
			this.scene[x+":"+y].scene = scene;
		},
		getScene: function(x,y){
			return this.scene[x+":"+y].scene;
		},
		setShopList: function(x,y,json){
			if(!existy(this.scene[x+":"+y])){ this.scene[x+":"+y] = {};}
			this.scene[x+":"+y].shopList = json;
		},
		getShopList: function(x,y){
			return global.scene[x+":"+y].shopList;
		},
		getShopObject : function(x,y,shop_id) {
			var list = this.scene[x+":"+y].shopList,
				i;
			for(i=0;i < list.length; i++){
				if ( shop_id === list[i].shop_id) {
					return list[i];
				}
			}
			return 0;
		}
};

function existy(x){return x != null }; // nullとundefinedでないことを保証

var properties = function(obj){
	for(var i in obj){
		console.log(i);
		Object.keys(i).forEach(function(p){
			console.log(p);
		});
	}
}

var log = function(str){
	console.log(str);
}