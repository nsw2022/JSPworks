package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// DAO(Data Access Objects) - 데이터베이스 연결 및 연동(입력, 검색, 수정, 삭제)
// DTO 공부하기
// VO 공부하기
public class PersonDAO {
	// 필드
	private Connection conn = null;	// 연결 처리 class
	private PreparedStatement pstmt = null; // sql 처리 class
	// 참고로 rs를 쓰는 경우는 결과를 볼때 즉 select할때 뿐이다
	private ResultSet rs = null; // 검색 - executeQuery 의 결과를 받는 객체 
	
	// 자료 삽입
	public void insertPerson(Person person) {
		//연결 - 클래스 작성 호출(JDBCUtill.java)
		conn = JDBCUtill.getConnection();
		String sql = "INSERT INTO person (userid, userpw, name, age) VALUES(?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, person.getUserId());
			pstmt.setString(2, person.getUserPw());
			pstmt.setString(3, person.getName());
			pstmt.setInt(4, person.getAge());
			
			pstmt.executeUpdate(); // 실행 처리(db에 저장)
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtill.close(conn, pstmt);
		}
		
	}
	
	// 자료 검색(목록)
	public ArrayList<Person> getPersonList(){
		ArrayList<Person> personList = new ArrayList<>();
		
		try {
			conn = JDBCUtill.getConnection(); // conn 연결 객체
			String sql = "SELECT * FROM person";
			pstmt = conn.prepareStatement(sql); // sql처리 객체 생성
			rs =pstmt.executeQuery(); // 검색 - executeQuery
			while (rs.next()) { // 다음데이터가 있다면
				Person person = new Person();// 기본생성자로 객체 생성
				//person 테이블에서 userid를 가져와서 Person 객체의 userid에 저장
				person.setUserId(rs.getString("USERID"));  // uppercase가 들어가있음 대소문자 구문안해도됨..
				person.setUserPw(rs.getString("userpw"));
				person.setName(rs.getString("name"));
				person.setAge(rs.getInt("age"));
				
				personList.add(person);// 사람객체 리스트에 저장
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtill.close(conn, pstmt, rs);
		}
		return personList; // 호출하는 쪽으로 반환함(돌려줌)
	}
	
	// 자료 1개 검색
	public Person getPerson(String userId) {
		Person person = new Person();
		
		conn = JDBCUtill.getConnection();
		String sql = "SELECT * FROM person WHERE userid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				person.setUserId(rs.getString("USERID"));  // uppercase가 들어가있음 대소문자 구문안해도됨..
				person.setUserPw(rs.getString("userpw"));
				person.setName(rs.getString("name"));
				person.setAge(rs.getInt("age"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtill.close(conn, pstmt, rs);
		}
		
		
		return person;
	}
	
}
