package helper;

import java.sql.*;

public class ConnectionProvider {

	public static Connection con;

	public static Connection main() {
		try {
			if (con == null) {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tech_blog", "root", "root");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}

}
