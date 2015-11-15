package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Item;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
					item.shopId = rs.getString("shopId");
					item.itemId = rs.getString("itemId");
					item.name = rs.getString("name");
					item.imagePath = rs.getString("imagePath");
					item.price = rs.getInt("price");
					list.add(item);
				}
			} catch(SQLException e){
				System.out.println("item情報のselectで失敗");e.printStackTrace();
			}

		return list;
	}
}
