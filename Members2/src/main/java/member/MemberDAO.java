package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;

public class MemberDAO {
	// 필드
	private Connection conn = null;
	private PreparedStatement psmt=null;
	private ResultSet rs = null;
	
	// 가입
	public void addMember(Member member) {
		conn = JDBCUtil.getConnection();
		String sql = "INSERT INTO t_member( memberid,passwd,name,gender ) values(?,?,?,?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member.getMemberId());
			psmt.setString(2, member.getPasswd());
			psmt.setString(3, member.getName());
			psmt.setString(4, member.getGender());
			psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, psmt);
		}
		
	}
	
	// 회원목록
	public ArrayList<Member> getMemberList () {
		ArrayList<Member> memberList = new ArrayList<>();
		conn = JDBCUtil.getConnection();
		String sql = "select * from t_member order by joinDate desc";
		try {
			psmt = conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			while (rs.next()) {
				Member member = new Member();
				member.setMemberId(rs.getString("memberid"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setJoinDate(rs.getDate("joinDate"));
				
				memberList.add(member);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, psmt, rs);
		}
		
		
		return memberList;
	}
	
	// 회원 상세보기(정보)
	public Member getMember(String memberId) {
		Member member = new Member();
		conn = JDBCUtil.getConnection();
		String sql = "select * from t_member where memberid = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, memberId);
			rs = psmt.executeQuery();
			if (rs.next()) {
				member.setMemberId(rs.getString("memberid"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setJoinDate(rs.getDate("joinDate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, psmt, rs);
		}
		
		return member;
	}// getMember 회원 상세보기(정보)
	
	// 로그인 체크
	public boolean checkLogin(Member member) {
		conn = JDBCUtil.getConnection();
		String sql = "select * from t_member where memberid = ? and passwd = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member.getMemberId());
			psmt.setString(2, member.getPasswd());
			rs = psmt.executeQuery();
			if (rs.next()) {
				

				
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, psmt, rs);
		}
		return false;
	}// 로그인 체크checkLogin()
	
	// ID 중복확인
	/*
	public boolean checkId(String memberId) {
		boolean result = false;
		
		conn = JDBCUtil.getConnection();
		String sql="select decode(count(*), 1 , 'true','false') as result from t_member where memberid = ?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1,  memberId);
			rs = psmt.executeQuery();
			if (rs.next()) {
				result = rs.getBoolean("result");// 칼럼이 result인값 추출해줌
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, psmt, rs);
		}
		return result;
		*/
	//}// ID 중복확인checkId
	
	public int checkId(String memberId) {
		int result = 0;
		
		conn = JDBCUtil.getConnection();
		String sql="select count(*) as result from t_member where memberid = ?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1,  memberId);
			rs = psmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("result");// 칼럼이 result인값 추출해줌
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, psmt, rs);
		}
		return result;
		
	}// ID 중복확인checkId



	
	
}
