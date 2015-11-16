package controller.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.shopDAO;
import model.Shop;
import util.Router;
import util.Util;

/**
 * Servlet implementation class ShopController
 */
@WebServlet("/ShopManageController")
public class ShopManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopManageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

String shop_id =  Util.getUUID();
System.out.println(shop_id + "bbbb");
String user_id = request.getParameter("user_id");
String name = request.getParameter("name");
String made_date = request.getParameter("date");
String exterior_image_path = request.getParameter("exterior_image_path");
String map_id = request.getParameter("map_id");
String strpoint_x = request.getParameter("point_x");
String strpoint_y = request.getParameter("point_y");
int is_alive = 1;
String interior_image_path = request.getParameter("interior_image_path");
String interior_draw_data = request.getParameter("interior_draw_data");
String interior_object_data = request.getParameter("interior_object_data");
String interior_collision_data = request.getParameter("interior_collision_data");

int point_x=0;
int point_y=0;
try{

  point_x = Integer.parseInt(strpoint_x);
  point_y = Integer.parseInt(strpoint_y);


}catch(NumberFormatException e){
  request.setAttribute("pointErr", "point_x,yは数値で入力してください。");
  request.getRequestDispatcher( Router.getInstance().getURL( "formShopData.jsp" )).forward(request, response);
}

Shop shop1 = new Shop(shop_id,user_id,name,made_date,exterior_image_path,map_id,point_x,point_y,is_alive,interior_image_path,interior_draw_data,interior_object_data,interior_collision_data);
System.out.println(shop1.getShop_id());
shopDAO dao = new shopDAO();

    dao.create(shop1);



    request.getRequestDispatcher( Router.getInstance().getURL( "formShopData.jsp" )).forward(request, response);
	}

}
