package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
	public static Connection dbConn() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String db_user = "jun";
		String db_password = "database";
		
		Connection con = null;
		
		try {
			Class.forName(driver);
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			con = DriverManager.getConnection(db_url, db_user, db_password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return con;
	}
}
