package Login_test;

public class user {


  private String user_name;
  private String user_pass;
  private String user_id;



  public String getUser_id() {
    return user_id;
  }
  public void setUser_id(String user_id) {
    this.user_id = user_id;
  }
  public user(){}
  public user(String user_name,String user_pass){
    this.user_name = user_name;
    this.user_pass = user_pass;


  }

  public user(String user_id,String user_name,String user_pass){
    this.user_id = user_id;
    this.user_name = user_name;
    this.user_pass = user_pass;
  }


  public String getUser_name() {
    return user_name;
  }
  public void setUser_name(String user_name) {
    this.user_name = user_name;
  }
  public String getUser_pass() {
    return user_pass;
  }
  public void setUser_pass(String user_pass) {
    this.user_pass = user_pass;
  }



}
