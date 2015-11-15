package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import util.Router;


@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserLogin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.getRequestDispatcher("userLogin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	  String name = request.getParameter("user_name");
	  String pass = request.getParameter("user_pass");

	  boolean isError = false;

    if(name == null || name.isEmpty()){
      request.setAttribute("nameErr", "ユーザ名を入力してください。");
      isError = true;
    }
   //////////////////////////////////////////////////////


    if(pass == null || pass.isEmpty()){
      request.setAttribute("passErr", "パスワードを入力してください。");
      isError = true;
    }
   //////////////////////////////////////////////////////

    //エラーがあったらもとのページに戻す
    if(isError == true){
      request.getRequestDispatcher( Router.getInstance().getURL( "userLogin.jsp" )).forward(request, response);

    }


	  boolean isUser;
	  String nextPath;
	  Router r = Router.getInstance();

	  isUser = new UserDAO().isUser( name, pass );

	  if ( isUser ){ nextPath = r.getURL( "main.jsp" ); }
	  else         {
	    request.setAttribute("loginErr", "ユーザ名かパスワードが違います。");
	                nextPath = r.getURL( "userLogin.jsp" );
	                }

	  System.out.println(nextPath);
	  System.out.println(isUser);

	  request.getRequestDispatcher( nextPath ).forward(request, response );

	}
}
