package controller.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Map;
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
		String action = request.getParameter("action");
		String nextPath = "";

		if(action.equals("mapCreate")){
			Map map = new Map();
			MapDAO mapDao = new MapDAO();
			//setPointメソッド内でmap.x map.yの代入をしているのでpointはsetで格納する。他のsetメソッドも作る。
			map.setPoint(Double.parseDouble(request.getParameter("point")));
			map.drawData = request.getParameter("drawData");
			map.objectData = request.getParameter("objectData");
			map.collisionData = request.getParameter("collisionData");
			map.imagePath = request.getParameter("imagePath");

			mapDao.create(map);
			nextPath = "/jsp/manage/formMapData.jsp";
		}

		request.getRequestDispatcher(nextPath).forward(request,response);
	}

}
