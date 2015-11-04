package util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;



public class Config {

	//イニシャライザ。クラスロード時に一度だけよばれる。
	//存在しないキーを指定するとnullが返る。
	static {
			try{
				Properties properties = new Properties();
				InputStream is = Config.class.getResourceAsStream("ganges.properties");
				properties.load(is);
				isRemote   = properties.getProperty("isRemote").equals("true") ? true : false;

				driverName = properties.getProperty("driverName");
				connection = properties.getProperty("connection");
				user       = properties.getProperty("user");
				pass       = properties.getProperty("pass");
				serverURL  = properties.getProperty("serverURL");

				remoteDriverName = properties.getProperty("remoteDriver");
				remoteConnection = properties.getProperty("remoteConnection");
				remoteUser = properties.getProperty("remoteUser");
				remotePass = properties.getProperty("remotePass");
				remoteServerURL = properties.getProperty("remoteServerURL");

		} catch (IOException e) {
			e.printStackTrace();
		} finally{

		}
	}
	//driverNameだけstaticイニシャライザで初期化されずにnull 参照してしまうので事前定義　用検証(山口)
	public static  String driverName="com.mysql.jdbc.Driver";
	public static  String connection;
	//DBで使うusernameとpass
	public static  String user;
	public static  String pass;
	public static  String serverURL;

	//remote用
	public static boolean isRemote;
	public static String  remoteDriverName;
	public static String  remoteConnection;
	public static String  remoteUser;
	public static String  remotePass;
	public static String  remoteServerURL;

}
