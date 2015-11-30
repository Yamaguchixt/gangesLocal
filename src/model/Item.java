package model;

import org.json.simple.JSONObject;
public class Item implements Jsonable{
	public String shop_id;
	public String item_id;
	public String item_image_id;
	public String view_image_path;
	public int type;
	public int rank;
	public String name;
	public String exterior_image_path;
	public int price;
	public String category_id;
  public int size;
  public String info;
  public String date;
  public int stock;
  public int is_alive;


	public String getShop_id()              {return shop_id;}
  public void   setShop_id(String shop_id){this.shop_id = shop_id;}
  public String getItem_id()              {return item_id;}
  public void   setItem_id(String item_id){this.item_id = item_id;}
  public String getName()                 {return name;}
  public void   setName(String name)      {this.name = name;}
  public String getExterior_path()        {return exterior_image_path;}
  public void   setExterior_path(String exterior_path) {this.exterior_image_path = exterior_path;}
  public int    getPrice()                {return price;}
  public void   setPrice(int price)       {this.price = price;}
  public String getCategory_id()          {return category_id;}
  public void   setCategory_id(String category_id) {this.category_id = category_id;}
  public int    getSize()                 {return size;}
  public void   setSize(int size)         {this.size = size;}
  public String getInfo()                 {return info;}
  public void   setInfo(String info)      {this.info = info;}
  public String getDate()                 {return date;}
  public void   setDate(String date)      {this.date = date;}
  public int    getStock()                {return stock;}
  public void   setStock(int stock)       {this.stock = stock;}
  public int    getIs_alive()             {return is_alive;}
  public void   setIs_alive(int is_alive) {this.is_alive = is_alive;}


  public JSONObject toJson(){
		JSONObject obj = new JSONObject();
		obj.put("shop_id",this.shop_id);
		obj.put("item_id", this.item_id);
		obj.put("category_id",this.category_id);
		obj.put("name", this.name);
		obj.put("size", new Integer(this.size));
		obj.put("info",this.info);
		obj.put("register_date", this.date);
		obj.put("exterior_path", this.exterior_image_path);
		obj.put("view_image_path", this.view_image_path);
		obj.put("stock", new Integer(this.stock));
		obj.put("price", new Integer(this.price));

		return obj;
	}

	public Item (){}

  public Item(String item_id, String category_id, String name, int price, int size, String info, int stock,
      String exterior_image_path,String view_image_path, int is_alive, String date) {

    this.item_id             = item_id;
    this.category_id         = category_id;
    this.name                = name;
    this.price               = price;
    this.size                = size;
    this.info                = info;
    this.stock               = stock;
    this.exterior_image_path = exterior_image_path;
    this.view_image_path     = view_image_path;
    this.is_alive            = is_alive;
    this.date                = date;
  }

  public Item(String shop_id, String item_id, String date) {
    this.shop_id = shop_id;
    this.item_id = item_id;
    this.date    = date;

  }
  public Item(String shop_id){
    this.shop_id = shop_id;
  }
  public Item(String item_image_id, String item_id, String date, String view_image_path) {
    this.item_image_id   = item_image_id;
    this.item_id         = item_id;
    this.date            = date;
    this.view_image_path = view_image_path;
  }


}
