<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jdbc연동</title>
</head>
<body>
<%
/*
	Mysql
	
	String driverClass = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/mydb";
	String username = "root";
	String password = "1234"; 
	
	아래는 오라클
*/
	
	
	String driverClass = "oracle.jdbc.OracleDriver";
	/* 자르에넣은 경로를 뜻함 패키지안에 가보면 해당드라이버가있음 */
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String username = "c##mydb";
	String password = "mydb";
	
	Connection conn = null;
	try{
		Class.forName(driverClass);
		conn = DriverManager.getConnection(url,username,password);
		//out.println("연결 객체가 생성 됐다." + conn);
	}catch(Exception e){
		out.println(e.getMessage());
	}

%>
</body>
</html>