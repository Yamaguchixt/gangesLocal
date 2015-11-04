package saugatest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class User_RegistrationDAO {

	public boolean create(User user){

		try{

			//MySQL接続クラスをロードする
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){

			//ロードに失敗した場合（jarファイルの設定がだめ）
			e.printStackTrace();
			return false;
		}

		Connection conn = null;

		try{

			conn = DriverManager.getConnection("jdbc:mysql://localhost/gangestest?characterEncoding=utf8","root","hazime");


			String sql =  "insert into user(user_id,account_name,pass,postnumber,prefectures,district,address_building,tell)values(?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt =conn.prepareStatement(sql);

			pStmt.setString(1, user.getUser_id());
			pStmt.setString(2, user.getUser_name());
			pStmt.setString(3, user.getUser_pass());
			pStmt.setString(4, user.getYubinbango());
			pStmt.setString(5, user.getTodouhuken());
			pStmt.setString(6, user.getSikutyouson());
			pStmt.setString(7, user.getBantitatemono());
			pStmt.setString(8, user.getTell());

			int result = pStmt.executeUpdate();

			if(result != 1){
				return false;
			}

		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}finally{
			if(conn != null){
				try{
					conn.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
		return true;

}

}