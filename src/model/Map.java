package model;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.JsonApi;
import util.Util;

public class Map implements Jsonable {
  public String map_id;
	public int point_x;
	public int point_y;
	public String name;
	public String drawing_data;
	public String object_data;
	public String collision_data;
	public String image_path;
	public String shop_puttable_data;
	public ArrayList<Shop> shopList; //shop管理用

	public Map(){
		shopList = new ArrayList<Shop>();
	};
	public String toString(){
	  shopList.forEach( ( shop) -> System.out.println(shop));
		return "point_x:"+this.point_x+" point_y:"+this.point_y+"drawing_data:"+this.drawing_data;
	}

	public void add(Shop shop){
		this.shopList.add(shop);
	}
	//このJsonApiとUtilのメソッドMapクラスのprivatemethodでよくない？ここでしか使ってないし
	@SuppressWarnings("unchecked")
	public JSONObject toJson(){
		JSONObject obj = new JSONObject();
		obj.put("point_x",new Integer(this.point_x));
		obj.put("point_y", new Integer(this.point_y));
		obj.put("drawing_data",JsonApi.int2DArrayToJSONArray(Util.mapStringToInt2DArray(this.drawing_data)));
	   	obj.put("object_data", JsonApi.int2DArrayToJSONArray(Util.mapStringToInt2DArray(this.object_data)));
	   	obj.put("collision_data",JsonApi.int2DArrayToJSONArray(Util.mapStringToInt2DArray(this.collision_data)));
	   	obj.put("image_path",this.image_path);

	   	JSONArray array = new JSONArray();
	   	for(Shop i:this.shopList){
	   		array.add(i.toJson());
	   	}
	   	obj.put("shopList", array);

	   	return obj;
	}


}
