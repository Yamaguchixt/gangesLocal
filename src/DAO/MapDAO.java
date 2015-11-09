package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import model.Map;
import model.Shop;
import util.Util;
public class MapDAO extends AbstractDAO{


	public Map find(int point_x,int point_y){
		Logger logger = LoggerFactory.getLogger(MapDAO.class);

		Map map = new Map();

		String sql = "select point_x,point_y,drawing_data,object_data,collision_data,image_path from map where point_x = ? AND point_y = ?";

		try( Connection conn = this.getConnection();
			   PreparedStatement pst = conn.prepareStatement( sql )) {
		  pst.setInt(1,point_x);
		  pst.setInt(2,point_y);
		  ResultSet rs = pst.executeQuery();
		  if(rs.next()){
		    map.point_x = rs.getInt("point_x");
		    map.point_y = rs.getInt("point_y");
		    map.drawing_data = rs.getString("drawing_data");
		    map.object_data = rs.getString("object_data");
		    map.collision_data = rs.getString("collision_data");
		    map.image_path = rs.getString("image_path");
		  }

		  String sql2 = "select point_x,point_y,shop_id,interior_image_path from shop where point_x = ? AND point_y = ?";
		  PreparedStatement pst2 = conn.prepareStatement(sql2);
		  pst2.setInt(1,point_x);
		  pst2.setInt(2,point_y);
		  ResultSet rs2 = pst2.executeQuery();
		  while(rs2.next()){
		    Shop shop = new Shop();
		    shop.x = rs2.getInt("x");
		    shop.y = rs2.getInt("y");
		    shop.shopId = rs2.getString("shopId");
		    shop.imagePath = rs2.getString("imagePath");
		    map.add(shop);
		  }

		} catch(Exception e){
			e.printStackTrace();
			//1.7のautoclosableでfinally書かなくていいらしい。
		}
		return map;
	}

	public boolean create(Map map){

	  System.out.println(map.drawing_data);
	  String uuid =  Util.getUUID();

		boolean isSuccess = false;
		String sql = "insert into map (map_id,point_x,point_y,drawing_data,object_data,collision_data,image_path,shop_puttable_data) values(?,?,?,?,?,?,?,?)";


		try( Connection conn = this.getConnection();
		     PreparedStatement pst = conn.prepareStatement( sql ) ){
		  pst.setString(1, uuid);
		  pst.setInt(2, map.point_x);
		  pst.setInt(3, map.point_y);
		  pst.setString(4,map.drawing_data);
		  pst.setString(5,map.object_data);
		  pst.setString(6, map.collision_data);
		  pst.setString(7, map.image_path);
		  pst.setString(8, map.shop_puttable_data);
		  int result = pst.executeUpdate();
		  if(result == 1){ isSuccess = true; }
		} catch( SQLException  e){
		  isSuccess = false;
		  e.printStackTrace();
		}

		return isSuccess;
	}
}
