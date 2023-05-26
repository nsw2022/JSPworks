package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// db 연결 및 종료
public class JDBCUtill {
	// 필드
	static String driverClass = "oracle.jdbc.OracleDriver";
	static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	static String username = "c##mydb";
	static String password = "mydb";
	
	// DB연결 매서드
	public static Connection getConnection() {
		try {
			Class.forName(driverClass);
			return DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
