package sql;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connect {
	public static void main(String[] args) {
		Connection conn = null;
		try {
			String url = "jdbc:mysql://localhost:3306/bankdb?user=root&password=tessera";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url);
			System.out.println("Database connection established");
		} catch (Exception e) {
			System.err.println("Cannot connect to database server");
		} finally {
			if (conn != null) {
				try {
					conn.close();
					System.out.println("Database connection terminated");
				} catch (Exception e) { /* ignore close errors */
				}
			}
		}
	}
}