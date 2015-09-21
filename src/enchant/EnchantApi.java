package enchant;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import util.JsonApi;
import util.Util;
import DAO.MapDAO;

@WebServlet("/EnchantApi")
public class EnchantApi extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EnchantApi() {
        super();
    }

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");

		if(action.equals("getMap")){
		    double mapPoint = Double.parseDouble((request.getParameter("mapPoint") == null ? "1.1": request.getParameter("mapPoint")));
		    MapDAO dao = new MapDAO();
		    model.Map map = dao.find(mapPoint);
		    if(map != null){
		    	JSONObject obj = new JSONObject();
		    	obj.put("mapDrawData",JsonApi.int2DArrayToJSONArray(Util.mapStringToInt2DArray(map.drawData)));
		    	obj.put("mapObjectData", JsonApi.int2DArrayToJSONArray(Util.mapStringToInt2DArray(map.objectData)));
		    	obj.put("mapCollisionData",JsonApi.int2DArrayToJSONArray(Util.mapStringToInt2DArray(map.collisionData)));
		    	obj.put("imagePath",map.imagePath);
		    	obj.writeJSONString(out);
		    }else{
		    	new JSONObject().writeJSONString(out);
		    }
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
