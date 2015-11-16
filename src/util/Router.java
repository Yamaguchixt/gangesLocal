package util;
/*
 * パスを一か所にまとめるためのクラス。シングルトンパターン
 * 使用例
 * Router router = Router.getInstance();
 * router.getURL("main.jsp") で main.jspへのパスを返す。
 *
 */
public class Router {
  public static Router getInstance() {
    return router;
  }
  private static Router router = new Router();
  private Router() {
    Config config       = Config.getInstance();
    this.serverURL      = config.getServerURL();  // ganges/ が返ってくるので先頭の/いらない
    this.main           =  "jsp/main.jsp";
    this.userLogin      =  "jsp/login/userLogin.jsp";
    this.userRegist     =  "jsp/regist/userRegist.jsp";
    this.formMapData    =  "jsp/manage/formMapData.jsp";
    this.formShopData   =  "jsp/manage/formShopData.jsp";

    this.fault     = this.serverURL + " #### "; //遷移失敗を表すURL
  }

  private String serverURL;
  private String main;
  private String userLogin;
  private String userRegist;
  private String formMapData;
  private String formShopData;

  private String fault;


  public String getURL(String jsp) {
    if ( jsp.equals( "main.jsp" ))          { return this.main;       }
    if ( jsp.equals( "userLogin.jsp" ))     { return this.userLogin;  }
    if ( jsp.equals( "userRegist.jsp" ))    { return this.userRegist; }
    if ( jsp.equals("formMapData.jsp"))     { return this.formMapData;}
    if ( jsp.equals("formShopData.jsp"))    { return this.formShopData;}

    return this.fault;
  }

  public String getServerURL() {
    System.out.println(this.serverURL);
    return this.serverURL;
  }



}
