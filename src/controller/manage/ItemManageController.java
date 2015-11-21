package controller.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ItemsDAO;
import model.Item;
import util.Router;
import util.Util;

/**
 * Servlet implementation class ItemManageController
 */
@WebServlet("/ItemManageController")
public class ItemManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemManageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	//String item_image_id       = Util.getUUID();
	  String item_id             = Util.getUUID();
	  String category_id         = request.getParameter("category_id");
	  String name                = request.getParameter("name");
	  String strprice            = request.getParameter("price");
	  String strsize             = request.getParameter("size");
	  String info                = request.getParameter("info");
	  String strstock            = request.getParameter("stock");
	  String exterior_image_path = request.getParameter("exterior_image_path");
	  String view_image_path     = request.getParameter("view_image_path");
	  int is_alive               = 1;
	  int price                  = 0;
	  int size                   = 0;
	  int stock                  = 0;
	  String nextJsp             = "";
	  boolean isError            = false;

	    //////////////////////////////////
	    //////////////////////////////////
	    //ログイン→ショップ管理画面→ここで自動取得したい
	  String shop_id = "9e64ca309b2743fd83d3c7aff2f5a55f";

	    /////////////////////////////////////
	    //////////////////////////////////////
	    //////////////////////////////////
	  String date = Util.getCurrentDateString();
	  System.out.println(date);

	  try{
	    price = Integer.parseInt(strprice);
	    size = Integer.parseInt(strsize);
	    stock = Integer.parseInt(strstock);


	  }catch(NumberFormatException e){
	    request.setAttribute("numErr", "価格、サイズ、在庫は数値で入力してください。");
	    nextJsp = "formShopData.jsp";
	    isError = true;
	  }

	  Item item      = new Item(item_id,category_id,name,price,size,info,stock,exterior_image_path,view_image_path,is_alive,date);
	  Item shop_item = new Item(shop_id,item_id,date);
	  ItemsDAO dao   = new ItemsDAO();

	  dao.create(item);
	  dao.createShopItem(shop_item);
	  if ( isError ) { nextJsp = "formShopData.jsp";  }
	  else { nextJsp = "ItemRegist.jsp";
	         request.setAttribute("MS","ok。");
	  }

	  request.getRequestDispatcher( Router.getInstance().getURL( nextJsp )).forward(request, response);
	}
}
