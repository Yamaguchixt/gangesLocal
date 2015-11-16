package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Shop;

public class shopDAO extends AbstractDAO {

  public boolean create(Shop shop){

    String sql =  "insert into shop(shop_id,user_id,name,made_date,exterior_image_path,map_id,point_x,point_y,is_alive,interior_image_path,interior_draw_data,interior_object_data,interior_collision_data)values(?,?,?,?,?,?,?,?,?,?,?,?,?)";

    try ( Connection conn = this.getConnection();
          PreparedStatement pst =conn.prepareStatement(sql)){

      pst.setString(1, shop.getShop_id()); System.out.println("aaa" + shop.getShop_id());
      pst.setString(2, shop.getUser_id());
      pst.setString(3, shop.getName());
      pst.setString(4, shop.getMade_date());
      pst.setString(5, shop.getExterior_image_path());
      pst.setString(6, shop.getMap_id());
      pst.setInt(7, shop.getPoint_x());
      pst.setInt(8, shop.getPoint_y());
      pst.setInt(9, shop.getIs_alive());
      pst.setString(10,  shop.getInterior_image_path());
      pst.setString(11,  shop.getInterior_draw_data());
      pst.setString(12,  shop.getInterior_object_data());
      pst.setString(13,  shop.getInterior_collision_data());
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
