package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import util.Router;
import util.Util;
import DAO.UserDAO;



/**
 * Servlet implementation class User_Registration
 */
@WebServlet("/UserRegist")
public class UserRegist extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserRegist() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	  String user_name = request.getParameter("user_name");
	  String user_pass = request.getParameter("user_pass");
	  String yubinbango = request.getParameter("yubinbango");
	  String todouhuken = request.getParameter("todouhuken");
	  String sikutyouson = request.getParameter("sikutyouson");
	  String bantitatemono = request.getParameter("bantitatemono");
	  String user_tell = request.getParameter("user_tell");
	  String uuid =  Util.getUUID();

	  User user = new User(uuid,user_name, user_pass,yubinbango, todouhuken, sikutyouson,bantitatemono,user_tell);
	  System.out.println(" in UserRegist : " + user.toString());

	  UserDAO dao = new UserDAO();
	  dao.create(user);
	  request.getRequestDispatcher( Router.getInstance().getURL( "userLogin.jsp" )).forward(request, response);
	}
}
