package model;

import org.json.simple.JSONObject;
public class Item implements Jsonable{
	public String shop_id;
	public String item_id;
	public String name;
	public String exterior_path;
	public int price;
	public String category_id;
  public int size;
  public String info;
  public String date;
  public int stock;
  public int is_alive;

	public JSONObject toJson(){
		JSONObject obj = new JSONObject();
		obj.put("shop_id",this.shop_id);
		obj.put("item_id", this.item_id);
		obj.put("name", this.name);
		obj.put("exterior_path", this.exterior_path);
		obj.put("price", new Integer(this.price));
		return obj;
	}

	public Item (){}

  public Item(String item_id, String category_id, String name, int price, int size, String info, int stock,
      String ex_image, int is_alive, String date) {

    this.item_id = item_id;
    this.category_id = category_id;
    this.name = name;
    this.price = price;
    this.size = size;
    this.info = info;
    this.stock = stock;
    this.exterior_path = exterior_path;
    this.is_alive = is_alive;
    this.date = date;
  }

  public Item(String shop_id, String item_id, String date) {
    // TODO 自動生成されたコンストラクター・スタブ
    this.shop_id = shop_id;
    this.item_id = item_id;
    this.date = date;

  }


}
