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
	  int is_alive =1;

	  boolean isError = false;

	  if(user_name == null || user_name.isEmpty()){
      request.setAttribute("nameErr", "ユーザ名を入力してください。");
      isError = true;
    }
	 //////////////////////////////////////////////////////


    if(user_pass == null || user_pass.isEmpty()){
      request.setAttribute("passErr", "パスワードを入力してください。");
      isError = true;
    }
   //////////////////////////////////////////////////////

    if(yubinbango == null || yubinbango.isEmpty()){
      request.setAttribute("yubinbangoErr", "郵便番号を入力してください。");
      isError = true;
    }
   //////////////////////////////////////////////////////

    if(todouhuken == null || todouhuken.isEmpty()){
      request.setAttribute("todouhukenErr", "都道府県を入力してください。");
      isError = true;
    }
   //////////////////////////////////////////////////////

    if(sikutyouson == null || sikutyouson.isEmpty()){
      request.setAttribute("sikutyousonErr", "市区町村を入力してください。");
      isError = true;
    }
   //////////////////////////////////////////////////////

    if(bantitatemono == null || bantitatemono.isEmpty()){
      request.setAttribute("bantitatemonoErr", "番地建物を入力してください。");
      isError = true;
    }
   //////////////////////////////////////////////////////

    if(user_tell == null || user_tell.isEmpty()){
      request.setAttribute("tellErr", "電話番号を入力してください。");
      isError = true;
    }
   //////////////////////////////////////////////////////

    //郵便番号、電話番号の入力チェック。DBにはStringで入力するからチェックする用にintにする
    int post =0;
    try{
     post = Integer.parseInt(yubinbango);
    }catch(NumberFormatException e){
      request.setAttribute("yubinbangoErr2", "郵便番号には７桁の数字をハイフン無しで入力してください。");
      isError= true;
    }
    int tell =0;
    try{
     tell = Integer.parseInt(user_tell);
    }catch(NumberFormatException e){
      request.setAttribute("tellErr2", "電話番号には数字をハイフン無しで入力してください。");
      isError= true;
    }
////郵便番号長さチェック
    int n =0;
    n = yubinbango.length();

    if(n != 7){
      request.setAttribute("yubinbangoErr3", "郵便番号には数字をハイフン無しで7桁で入力してください。");
      isError= true;
    }

    //エラーがあったらもとのページに戻す
    if(isError == true){
      request.getRequestDispatcher( Router.getInstance().getURL( "userRegist.jsp" )).forward(request, response);

    }

	  User user = new User(uuid,user_name, user_pass,yubinbango, todouhuken, sikutyouson,bantitatemono,user_tell,is_alive);



	  System.out.println(" in UserRegist : " + user.toString());

	  UserDAO dao = new UserDAO();
	  dao.create(user);
	  request.getRequestDispatcher( Router.getInstance().getURL( "userLogin.jsp" )).forward(request, response);
	}
}
