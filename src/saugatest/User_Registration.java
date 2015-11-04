package saugatest;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class User_Registration
 */
@WebServlet("/User_Registration")
public class User_Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("user.jsp").forward(request, response);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//文字コードの設定
				request.setCharacterEncoding("utf-8");

				String user_name = request.getParameter("user_name");
				String user_pass = request.getParameter("user_pass");
				String yubinbango = request.getParameter("yubinbango");
				String todouhuken = request.getParameter("todouhuken");
				String sikutyouson = request.getParameter("sikutyouson");
				String bantitatemono = request.getParameter("bantitatemono");
				String user_tell = request.getParameter("user_tell");
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");

				User user = new User(uuid,user_name, user_pass,yubinbango, todouhuken, sikutyouson,bantitatemono,user_tell);

				PostUserLogic postUserLogic = new PostUserLogic();

				postUserLogic.execute(user);

				request.getRequestDispatcher("user_result.jsp").forward(request, response);




	}

}
