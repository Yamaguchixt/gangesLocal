package controller.manage;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Map;
import util.Util;
import DAO.MapDAO;

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
		String action = Optional.ofNullable(request.getParameter("action")).orElse("none");
		String nextPath = "";
		

		if(action.equals("mapCreate")){
			Map map = new Map();
			MapDAO mapDao = new MapDAO();

			String strpoint_x = request.getParameter("point_x");
			String strpoint_y = request.getParameter("point_y");
			int point_x = Integer.parseInt(strpoint_x);
			int point_y = Integer.parseInt(strpoint_y);
			String drawing_data = request.getParameter("drawing_data");
			String object_data = request.getParameter("object_data");
			String collision_data = request.getParameter("collision_data");
			String image_path = request.getParameter("image_path");
			String shop_puttable_data = request.getParameter("shop_puttable_data");

			//とりあえず入力不正でもエラーださない処理、適宜はじく処理が必要。
			map.point_x = point_x;
			map.point_y = point_y;
			map.drawing_data = Util.isValid(drawing_data, "int[][]") ? drawing_data:"[[0]]";
			map.object_data = Util.isValid(object_data,"int[][]") ? object_data:"[[0]]";
			map.collision_data = Util.isValid(collision_data,"int[][]") ? collision_data:"[[0]]";
			map.image_path = Util.isValid(image_path,"String") ? image_path:"public/images/map1.png";
	    map.shop_puttable_data = Util.isValid(shop_puttable_data,"int[][]") ? shop_puttable_data:"[[0]]";
			mapDao.create(map);
			nextPath = "/jsp/manage/formMapData.jsp";
		}

		request.getRequestDispatcher(nextPath).forward(request,response);
	}

}
