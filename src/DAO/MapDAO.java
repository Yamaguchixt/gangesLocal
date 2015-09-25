package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Map;
import model.Shop;
import util.Config;
public class MapDAO {
	public Map find(int x,int y){
		Connection conn = null;
		Map map = new Map();

		try{
			Class.forName(Config.driverName);
			conn = DriverManager.getConnection(Config.connection,Config.user,Config.pass);

			String sql = "select x,y,drawData,objectData,collisionData,imagePath from map where x = ? AND y = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1,x);
			pst.setInt(2,y);
			ResultSet rs = pst.executeQuery();

			if(rs.next()){
				map.x = rs.getInt("x");
				map.y = rs.getInt("y");
				map.drawData = rs.getString("drawData"); //文字列の"[[1,2,3],[1,1,1]]"をint配列に変換
				map.objectData = rs.getString("objectData");
				map.collisionData = rs.getString("collisionData");
				map.imagePath = rs.getString("imagePath");
			}
			//mapにshopを追加していく
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
		} finally{
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e){
					e.printStackTrace();
				}
			}
		}
		return map;
	}

	public boolean create(Map map){
		Connection conn = null;
		boolean isSuccess = false;

		try{
			Class.forName(Config.driverName);
			conn = DriverManager.getConnection(Config.connection,Config.user,Config.pass);

			String sql = "insert into map (x,y,drawData,objectData,collisionData,imagePath) values(?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(2, map.x);
			pst.setInt(3, map.y);
			pst.setString(4,map.drawData);
			pst.setString(5,map.objectData);
			pst.setString(6, map.collisionData);
			pst.setString(7, map.imagePath);
			int result = pst.executeUpdate();
			if(result == 1){ isSuccess = true; }

		} catch(Exception e){
			isSuccess = false;
			e.printStackTrace();
		} finally{
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e){
					e.printStackTrace();
				}
			}
		}
		return isSuccess;
	}
}
