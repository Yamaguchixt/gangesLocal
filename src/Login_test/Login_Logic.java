package Login_test;

public class login_logic {

  public boolean execute(user user){

    login_DAO dao = new login_DAO();

    user_account account = dao.select2(user);



    return account != null;


}
}
