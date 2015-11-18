package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Item;

public class ItemsDAO extends AbstractDAO {

	public ArrayList<Item> find(String shop_id){
	  ArrayList<Item> list = new ArrayList<Item>();

    String sql =  "select item. * from shop_item,item where shop_item.item_id = item.item_id;";

    try ( Connection conn = this.getConnection();
        PreparedStatement pst =conn.prepareStatement(sql)){

   ResultSet rs = pst.executeQuery();

   while(rs.next()){

     Item i = new Item();
     i.item_id       = rs.getString("item_id");
     i.category_id   = rs.getString("category_id");
     i.name          = rs.getString("name");
     i.price         = rs.getInt("price");
     i.size          = rs.getInt("size");
     i.info          = rs.getString("info");
     i.date          = rs.getString("register_date");
     i.stock         = rs.getInt("stock");
     i.is_alive      = rs.getInt("is_alive");
     i.exterior_image_path = rs.getString("exterior_image_path");
     i.view_image_path = rs.getString("view_image_path");
     list.add(i);
     System.out.println(i.name);
   }
  }catch(SQLException e){
    e.printStackTrace();
    return null;
  }
    return list;
	}

	//Item登録


public boolean create(Item item){


  String sql = "insert into item(item_id,category_id,name,price,size,info,register_date,stock,is_alive,exterior_image_path,view_image_path)values(?,?,?,?,?,?,?,?,?,?,?)";

  try ( Connection conn = this.getConnection();
      PreparedStatement pst =conn.prepareStatement(sql)){

    pst.setString(1,  item.item_id);
    pst.setString(2,  item.category_id);
    pst.setString(3,  item.name);
    pst.setInt   (4,  item.price);
    pst.setInt   (5,  item.size);
    pst.setString(6,  item.info);
    pst.setString(7,  item.date);
    pst.setInt   (8,  item.stock);
    pst.setInt   (9,  item.is_alive);
    pst.setString(10, item.exterior_image_path);
    pst.setString(11, item.view_image_path);
    int result = pst.executeUpdate();

    if(result != 1){
      return false;
    }

  }catch(SQLException e){
    e.printStackTrace();
    return false;
  }

  return true;
}

///////////////////////
//shop_item用DAO

public boolean createShopItem(Item item){

  String sql = "insert into shop_item(shop_id,item_id,register_date)values(?,?,?)";

  try ( Connection conn = this.getConnection();
      PreparedStatement pst =conn.prepareStatement(sql)){

    pst.setString(1, item.shop_id);
    pst.setString(2, item.item_id);
    pst.setString(3, item.date);
    int result = pst.executeUpdate();

    if(result != 1){
      return false;
    }

  }catch(SQLException e){
    e.printStackTrace();
    return false;
  }

  return true;
}



}






