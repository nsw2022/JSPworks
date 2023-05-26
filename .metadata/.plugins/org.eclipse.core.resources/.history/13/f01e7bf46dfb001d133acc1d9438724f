package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
			return DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	// DB연결 종료 메서드
	public static void close(Connection conn, PreparedStatement pstmt) {
		if (pstmt != null) {// sql 처리가 되고있다면
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				pstmt = null;
			}

			if (conn != null) { // db가 연결이 되어 있다면
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					conn = null;
				}
			}
		}
	}
	
	//DB연결 종료 메서드(ResultSet이 있는 경우) 파라미터로 추가됨!
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		
		if (rs != null) {// 가져올 자료가 잇으면 
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				rs = null;
			}
		}
		
		if (pstmt != null) {// sql 처리가 되고있다면
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				pstmt = null;
			}

			if (conn != null) { // db가 연결이 되어 있다면
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					conn = null;
				}
			}
		}
	}

}
