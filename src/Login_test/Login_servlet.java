package Login_test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login_servlet
 */
@WebServlet("/login_servlet")
public class login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public login_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//文字コードの設定
    request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
String pass = request.getParameter("pass");
String id ="";

  user user = new user(name,pass);



  login_logic bo = new login_logic();



//ログインサーブレットではboolean　resultでログインロジックのDAOを実行するから、ユーザの情報はとれない。
//成功するかしないかだけを判断。


  boolean result = bo.execute(user);

  if(result){


  HttpSession session = request.getSession();
  session.setAttribute("user_name", name);

  user user_db = new user(id,name,pass);

  login_DAO dao = new login_DAO();

  user_db = dao.select(user);
  request.setAttribute("login_user", user_db);



  request.setAttribute("user", user);
  request.setAttribute("name", name);
  request.setAttribute("pass", pass);

  request.getRequestDispatcher("login_result.jsp").forward(request, response);

  }
else{
  response.sendRedirect("login.jsp");

}
	}

}
