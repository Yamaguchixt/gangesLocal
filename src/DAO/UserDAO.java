package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;


public class UserDAO extends AbstractDAO {

	public boolean create(User user){

<<<<<<< HEAD
		String sql =  "insert into user(user_id,account_name,pass,postnumber,prefectures,district,address_building,tell,is_alive)values(?,?,?,?,?,?,?,?,?)";
=======
		String sql =  "insert into user(user_id,account_name,pass,postnumber,prefectures,district,address_building,tell)values(?,?,?,?,?,?,?,?)";
>>>>>>> 9f88f29b548c78837c027f7f6c97357f8e8cea0b
		System.out.println(user.toString() );
		try ( Connection conn = this.getConnection();
		      PreparedStatement pst =conn.prepareStatement(sql)){

			pst.setString(1, user.getUserId());
			pst.setString(2, user.getName()); System.out.println(user.getName());
			pst.setString(3, user.getPass());
			pst.setString(4, user.getPostNumber());
			pst.setString(5, user.getPrefecture());
			pst.setString(6, user.getDistrict());
			pst.setString(7, user.getAddressBuilding());
			pst.setString(8, user.getTell());
<<<<<<< HEAD
			pst.setInt(9, user.getIs_alive());
=======

>>>>>>> 9f88f29b548c78837c027f7f6c97357f8e8cea0b
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

	//ここでboolean返すかユーザオブジェクト返すか要検討。

	public boolean isUser( String name, String pass ) {

	  boolean isExist = false;
	  String sql = "select * from user where account_name like ? AND pass like ? ";
	  System.out.println(sql);
	  try ( Connection conn = this.getConnection();
	        PreparedStatement pst = conn.prepareStatement(sql)){

	    pst.setString(1, name);
	    pst.setString(2, pass);

	    ResultSet rs = pst.executeQuery();
	    if ( rs.next() ){ isExist = true; }

	  } catch (SQLException e) {
      e.printStackTrace();
    }

	  return isExist;
	}

}