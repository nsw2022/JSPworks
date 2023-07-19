package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCTest {
	// 필드
		static String driverClass = "com.mysql.cj.jdbc.Driver";
		/* 자르에넣은 경로를 뜻함 패키지안에 가보면 해당드라이버가있음 */
		static String url = "jdbc:mysql://localhost:3306/javaweb";
		static String username = "root";
		static String password = "1234";
		
		/*
		 * 
		 * 
		 * 
		 * 
		 * */
		
		public static void main(String[] args) {
			Connection conn = null;
			try {
				Class.forName(driverClass);
				System.out.println("mysql 드라이버 로딩");
				conn = DriverManager.getConnection(url,username,password);
				System.out.println("Connection 객체 생성 " + conn);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

}
