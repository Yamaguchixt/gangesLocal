package util;

import java.io.IOException;
import java.util.Properties;


/*シングルトンパターン。コンストラクタをプライベートにして唯一のインタンスのみを返す。
 *使い方は
 * Config config = Config.getInstance();
 * Class.forName( config.getDriverName() );
 */

public class Config {

  private static final String propertiesFile = "ganges.properties";

  private static Config config = new Config();

  private Config() {

    try {
      Properties prop = new Properties();
      prop.load(Config.class.getResourceAsStream(propertiesFile));

      isRemote = prop.getProperty("isRemote") == null ||
                 prop.getProperty("isRemote").equals("false")
                 ? false : true;
      if ( isRemote ) {
        driverName = prop.getProperty("remoteDriverName");
        connection = prop.getProperty("remoteConnection");
        user       = prop.getProperty("remoteUser");
        pass       = prop.getProperty("remotePass");
        serverURL  = prop.getProperty("remoteServerURL");
      }
      else {
        driverName = prop.getProperty("driverName");
        connection = prop.getProperty("connection");
        user       = prop.getProperty("user");
        pass       = prop.getProperty("pass");
        serverURL  = prop.getProperty("serverURL");
      }
    } catch(IOException e ){

    }finally{

    }
  }
  public static Config getInstance() {
    return config;
  }

  private boolean isRemote;
  private String driverName;
  private String connection;
  private String user;
  private String pass;
  private String serverURL;


  public boolean isRemote() {
    return this.isRemote;
  }
  public String getDriverName() {
    return this.driverName;
  }
  //jdbc:mysql://localhost/ganges?characterEncoding=utf8のようにかえってくる
  public String getConnectionName() {
    return this.connection;
  }
  public String getUserName() {
    return this.user;
  }
  public String getPass() {
    return this.pass;
  }
  public String getServerURL() {
    return this.serverURL;
  }

}
