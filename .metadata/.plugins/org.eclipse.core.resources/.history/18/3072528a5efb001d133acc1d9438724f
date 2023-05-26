package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// DAO - 데이터베이스 연결 및 연동(입력, 검색, 수정, 삭제)
public class PesonDAO {
	// 필드
	private Connection conn = null;	// 연결 처리 class
	private PreparedStatement pstmt = null; // sql 처리 class
	
	// 자료 삽입
	public void insertPerson(Person person) {
		//연결 - 클래스 작성 호출(JDBCUtill.java)
		conn = JDBCUtill.getConnection();
		//String sql = "INSERT INTO person VALUES('clould','cloud123','구름이',120)";
		
		
	}
	
	// 자료 검색(목록)
	public ArrayList<Person> getPersonList(){
		ArrayList<Person> personList = new ArrayList<>();
		
		try {
			conn = JDBCUtill.getConnection();
			String sql = "SELECT * FROM person";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs =pstmt.executeQuery(); // 검색 - executeQuery
			while (rs.next()) {
				Person person = new Person();// 기본생성자로 객체 생성
				//person 테이블에서 userid를 가져와서 Person 객체의 userid에 저장
				person.setUserId(rs.getString("userId"));
				person.setUserPw(rs.getString("userpw"));
				person.setName(rs.getString("name"));
				person.setAge(rs.getInt("age"));
				
				personList.add(person);// 사람객체 리스트에 저장
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return personList; // 호출하는 쪽으로 반환함(돌려줌)
	}
}
