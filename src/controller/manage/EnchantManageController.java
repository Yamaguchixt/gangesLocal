package controller.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MapDAO;
import model.Map;
<<<<<<< HEAD
import util.Router;
=======
>>>>>>> 9f88f29b548c78837c027f7f6c97357f8e8cea0b
import util.Util;

/**
 * Servlet implementation class EnchantManageController
 */
@WebServlet("/EnchantManageController")
public class EnchantManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EnchantManageController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String nextPath = "";

		if(action.equals("mapCreate")){
			Map map = new Map();
			MapDAO mapDao = new MapDAO();

			String strpoint_x = request.getParameter("point_x");
			String strpoint_y = request.getParameter("point_y");
<<<<<<< HEAD
=======
			int point_x = Integer.parseInt(strpoint_x);
			int point_y = Integer.parseInt(strpoint_y);
>>>>>>> 9f88f29b548c78837c027f7f6c97357f8e8cea0b
			String drawing_data = request.getParameter("drawing_data");
			String object_data = request.getParameter("object_data");
			String collision_data = request.getParameter("collision_data");
			String image_path = request.getParameter("image_path");
			String shop_puttable_data = request.getParameter("shop_puttable_data");

<<<<<<< HEAD
			boolean isError = false;

	    if(strpoint_x == null || strpoint_x.isEmpty()){
	      request.setAttribute("xErr", "配置_xを入力してください。");
	      isError = true;
	    }
	   //////////////////////////////////////////////////////


	    if(strpoint_y == null || strpoint_y.isEmpty()){
	      request.setAttribute("yErr", "配置_yを入力してください。");
	      isError = true;
	    }
	   //////////////////////////////////////////////////////

	    if(drawing_data == null || drawing_data.isEmpty()){
	      request.setAttribute("drawingErr", "drawing_dataを入力してください。");
	      isError = true;
	    }
	   //////////////////////////////////////////////////////

	    if(object_data == null || object_data.isEmpty()){
	      request.setAttribute("objectErr", "object_dataを入力してください。");
	      isError = true;
	    }
	   //////////////////////////////////////////////////////

	    if(collision_data == null || collision_data.isEmpty()){
	      request.setAttribute("collisionErr", "collision_dataを入力してください。");
	      isError = true;
	    }
	   //////////////////////////////////////////////////////

	    if(image_path == null || image_path.isEmpty()){
	      request.setAttribute("imageErr", "image_pathを入力してください。");
	      isError = true;
	    }
	   //////////////////////////////////////////////////////
	    if(image_path == null || image_path.isEmpty()){
        request.setAttribute("imageErr", "image_pathを入力してください。");
        isError = true;
      }
     //////////////////////////////////////////////////////


	    if(shop_puttable_data == null || shop_puttable_data.isEmpty()){
	      request.setAttribute("shopErr", "shop_puttable_dataを入力してください。");
	      isError = true;
	    }
	   //////////////////////////////////////////////////////

	    //エラーがあったらもとのページに戻す
	    if(isError == true){
	      request.getRequestDispatcher( Router.getInstance().getURL( "formMapData.jsp" )).forward(request, response);


	    }

			//とりあえず入力不正でもエラーださない処理、適宜はじく処理が必要。
	    try{
	      int point_x = Integer.parseInt(strpoint_x);
	      int point_y = Integer.parseInt(strpoint_y);
=======
			//とりあえず入力不正でもエラーださない処理、適宜はじく処理が必要。
>>>>>>> 9f88f29b548c78837c027f7f6c97357f8e8cea0b
			map.point_x = point_x;
			map.point_y = point_y;
			map.drawing_data = Util.isValid(drawing_data, "int[][]") ? drawing_data:"[[0]]";
			map.object_data = Util.isValid(object_data,"int[][]") ? object_data:"[[0]]";
			map.collision_data = Util.isValid(collision_data,"int[][]") ? collision_data:"[[0]]";
			map.image_path = Util.isValid(image_path,"String") ? image_path:"public/images/map1.png";
	    map.shop_puttable_data = Util.isValid(shop_puttable_data,"int[][]") ? shop_puttable_data:"[[0]]";
			mapDao.create(map);
			nextPath = "/jsp/manage/formMapData.jsp";
<<<<<<< HEAD
	    }catch(NumberFormatException e){
	      e.printStackTrace();
	       request.getRequestDispatcher( Router.getInstance().getURL( "formMapData.jsp" )).forward(request, response);
	    }

=======
>>>>>>> 9f88f29b548c78837c027f7f6c97357f8e8cea0b
		}

		request.getRequestDispatcher(nextPath).forward(request,response);
	}

}
