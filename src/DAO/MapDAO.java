package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Map;
import model.Shop;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import util.Util;
public class MapDAO extends AbstractDAO{


	public Map find(int point_x,int point_y){
		Logger logger = LoggerFactory.getLogger(MapDAO.class);

		Map map = new Map();

		String sql = "select point_x,point_y,drawing_data,object_data,collision_data,image_path,map_id from map where point_x = ? AND point_y = ?";

		try( Connection conn = this.getConnection();
			   PreparedStatement pst = conn.prepareStatement( sql )) {
		  pst.setInt(1,point_x);
		  pst.setInt(2,point_y);
		  ResultSet rs = pst.executeQuery();
		  if(rs.next()){
		    map.map_id  = rs.getString("map_id");
		    map.point_x = rs.getInt("point_x");
		    map.point_y = rs.getInt("point_y");
		    map.drawing_data = rs.getString("drawing_data");
		    map.object_data = rs.getString("object_data");
		    map.collision_data = rs.getString("collision_data");
		    map.image_path = rs.getString("image_path");
		  }

		  String sql2 = "select is_alive,point_x,point_y,shop_id,user_id,interior_image_path,interior_draw_data,interior_object_data,interior_collision_data,exterior_image_path,name from shop where map_id like ?";
		  PreparedStatement pst2 = conn.prepareStatement(sql2);
		  pst2.setString(1,map.map_id);
		  ResultSet rs2 = pst2.executeQuery();
		  while(rs2.next()){
		    if ( rs2.getInt("is_alive") == 1){//店が生きてたら
		      Shop shop = new Shop();
		      shop.point_x                  = rs2.getInt("point_x");
		      shop.point_y                  = rs2.getInt("point_y");
		      shop.shop_id                  = rs2.getString("shop_id");
		      shop.user_id                  = rs2.getString("user_id");
		      shop.interior_image_path      = rs2.getString("interior_image_path");
		      shop.interior_draw_data       = rs2.getString("interior_draw_data");
		      shop.interior_object_data     = rs2.getString("interior_object_data");
		      shop.interior_collision_data  = rs2.getString("interior_collision_data");
		      shop.exterior_image_path      = rs2.getString("exterior_image_path");
		      shop.name                     = rs2.getString("name");
		      System.out.println("in MapDAO shop :" + shop);
		      map.add(shop);
		    }
		  }

		} catch(Exception e){
			e.printStackTrace();
			//1.7のautoclosableでfinally書かなくていいらしい。
		}
		if ( map.drawing_data == null ){System.out.println("in MapDAO no map found !");}
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
