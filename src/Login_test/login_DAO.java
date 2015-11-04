package Login_test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class login_DAO {


  public user select(user user) {

    user user_db = new user();


    try{

      //MySQL接続クラスをロードする
      Class.forName("com.mysql.jdbc.Driver");
    }catch(ClassNotFoundException e){

      //ロードに失敗した場合（jarファイルの設定がだめ）
      e.printStackTrace();
      return null;
    }


    try(
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/gangestest?characterEncoding=utf8","root","hazime");


        PreparedStatement ps = con.prepareStatement("select user_id,account_name,pass from user where account_name = ?AND pass=?");

        ){

      //検索条件を設定(1個目の？を%name%と置き換える)

      ps.setString(1,user.getUser_name());
      ps.setString(2,user.getUser_pass());


    //SQL実行と結果セットの受け取り
      ResultSet rs = ps.executeQuery();
    //結果セットからオブジェクトにデータを入れる　new Product();←これがオブジェクト。クラスはオブジェクトのつくりかた。メモリ上に新しく作る　pは場所 rsで行目見る　　getInt int型でもってこい
      if(rs.next()){

        user_db.setUser_id(rs.getString("user_id"));
        user_db.setUser_name(rs.getString("account_name"));
        user_db.setUser_pass(rs.getString("pass"));

      }

    }catch(SQLException e){
      e.printStackTrace();

    }




    return user_db;
  }



///////////////////////////////////////////////////////////////////////////////////


  public user_account select2(user user) {


    user_account account = null;

    try{

      //MySQL接続クラスをロードする
      Class.forName("com.mysql.jdbc.Driver");
    }catch(ClassNotFoundException e){

      //ロードに失敗した場合（jarファイルの設定がだめ）
      e.printStackTrace();
      return null;
    }


    try(
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/gangestest?characterEncoding=utf8","root","hazime");


        PreparedStatement ps = con.prepareStatement("select user_id,account_name,pass from user where account_name = ?AND pass=?");

        ){

      //検索条件を設定(1個目の？を%name%と置き換える)

      ps.setString(1,user.getUser_name());
      ps.setString(2,user.getUser_pass());


    //SQL実行と結果セットの受け取り
      ResultSet rs = ps.executeQuery();
    //結果セットからオブジェクトにデータを入れる　new Product();←これがオブジェクト。クラスはオブジェクトのつくりかた。メモリ上に新しく作る　pは場所 rsで行目見る　　getInt int型でもってこい
      if(rs.next()){

        String userID =rs.getString("user_id");
        String userNAME=rs.getString("account_name");
        String userPASS=rs.getString("pass");

        account = new user_account(userID, userNAME, userPASS);

      }

    }catch(SQLException e){
      e.printStackTrace();

    }




    return account;
  }






}
