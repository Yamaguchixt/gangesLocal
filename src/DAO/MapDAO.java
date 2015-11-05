package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Map;
import model.Shop;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class MapDAO extends AbstractDAO{


	public Map find(int x,int y){
		Logger logger = LoggerFactory.getLogger(MapDAO.class);

		Map map = new Map();

		String sql = "select x,y,drawData,objectData,collisionData,imagePath from map where x = ? AND y = ?";

		try( Connection conn = this.getConnection();
			   PreparedStatement pst = conn.prepareStatement( sql )) {
		  pst.setInt(1,x);
		  pst.setInt(2,y);
		  ResultSet rs = pst.executeQuery();
		  if(rs.next()){
		    map.x = rs.getInt("x");
		    map.y = rs.getInt("y");
		    map.drawData = rs.getString("drawData");
		    map.objectData = rs.getString("objectData");
		    map.collisionData = rs.getString("collisionData");
		    map.imagePath = rs.getString("imagePath");
		  }

		  String sql2 = "select x,y,shopId,imagePath from shop where mapPointX = ? AND mapPointY = ?";
		  PreparedStatement pst2 = conn.prepareStatement(sql2);
		  pst2.setInt(1,x);
		  pst2.setInt(2,y);
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

		boolean isSuccess = false;
		String sql = "insert into map (x,y,drawData,objectData,collisionData,imagePath) values(?,?,?,?,?,?)";


		try( Connection conn = this.getConnection();
		     PreparedStatement pst = conn.prepareStatement( sql ) ){
		  pst.setInt(2, map.x);
		  pst.setInt(3, map.y);
		  pst.setString(4,map.drawData);
		  pst.setString(5,map.objectData);
		  pst.setString(6, map.collisionData);
		  pst.setString(7, map.imagePath);
		  int result = pst.executeUpdate();
		  if(result == 1){ isSuccess = true; }
		} catch( SQLException  e){
		  isSuccess = false;
		  e.printStackTrace();
		}

		return isSuccess;
	}
}
