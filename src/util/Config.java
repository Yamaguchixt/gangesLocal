package util;

public class Config {
	public static final String driverName = "com.mysql.jdbc.Driver";
	//public static String driverName = "org.mariadb.jdbc.Driver";

	public static final String connection ="jdbc:mysql://localhost/ganges?characterEncoding=utf8";
	//public static final String connection = "jdbc:mariadb://localhost:3306/ganges";

	//DBで使うusernameとpass
	public static final String user="root";
	public static final String pass ="";

	public static final String serverURL = "http://localhost:8080/ganges/";
	//public static final String serverURL = "http://hew2015.com/tomcat/ganges/";

}
