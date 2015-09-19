package enchant;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


@WebServlet("/EnchantApi")
public class EnchantApi extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EnchantApi() {
        super();
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
	    PrintWriter out = response.getWriter();
	    int mapID = Integer.parseInt((request.getParameter("mapID") == null ? "1": request.getParameter("mapID")));
	    //MapObject mapObject = DBinterface.getMap(mapID);
	    TmpDB db = new TmpDB();
	    JSONObject obj = new JSONObject();
	    obj.put("mapDrawData",JsonApi.int2DArrayToJSONArray(db.map.get("mapDrawData").get(mapID)));
	    obj.put("mapObjectData",JsonApi.int2DArrayToJSONArray(db.map.get("mapObjectData").get(mapID)));
	    obj.put("mapCollisionData",JsonApi.int2DArrayToJSONArray(db.map.get("mapCollisionData").get(mapID)));
	    obj.put("mapImagePath",db.mapImagePath);

	    obj.writeJSONString(out);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
