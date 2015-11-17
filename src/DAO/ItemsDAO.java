package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import model.Item;

public class ItemsDAO extends AbstractDAO {

	public ArrayList<Item> find(String shopId){

	  Logger logger = LoggerFactory.getLogger(ItemsDAO.class);

		ArrayList<Item> list = new ArrayList<Item>();

		String sql = "select * from item where shopId like ?";
		try(Connection conn = this.getConnection();
		    PreparedStatement pst = conn.prepareStatement(sql)){
				pst.setString(1,shopId);
				ResultSet rs = pst.executeQuery();
				while(rs.next()){
					Item item = new Item();
					item.shop_id = rs.getString("shop_id");
					item.item_id = rs.getString("item_id");
					item.name = rs.getString("name");
					item.exterior_path = rs.getString("exterior_path");
					item.price = rs.getInt("price");
					list.add(item);
				}
			} catch(SQLException e){
				System.out.println("item情報のselectで失敗");e.printStackTrace();
			}

		return list;
	}

	//Item登録


public boolean create(Item item){


  String sql = "insert into item(item_id,category_id,name,price,size,info,register_date,stock,is_alive,exterior_path)values(?,?,?,?,?,?,?,?,?,?)";

  try ( Connection conn = this.getConnection();
      PreparedStatement pst =conn.prepareStatement(sql)){

    pst.setString(1, item.item_id);
    pst.setString(2, item.category_id);
    pst.setString(3, item.name);
    pst.setInt(4, item.price);
    pst.setInt(5, item.size);
    pst.setString(6,  item.info);
    pst.setString(7, item.date);
    pst.setInt(8, item.stock);
    pst.setInt(9, item.is_alive);
    pst.setString(10, item.exterior_path);
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
