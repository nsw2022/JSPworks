package dao;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import common.JDBCUtil;

import vo.*;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 회원 목록 보기
	public List<vo.Member> getMemberList() {
		List<vo.Member> memberList = new ArrayList<>();
		conn = JDBCUtil.getConnection();
		String sql = "select * from member order by regdate desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo.Member member = new vo.Member();
				member.setMid(rs.getString("mid"));
				member.setPasswd(rs.getString("passwd"));
				member.setMname(rs.getString("mname"));
				member.setGender(rs.getString("gender"));
				member.setBirth(rs.getString("birth"));
				member.setPhone(rs.getString("phone"));
				member.setEmail(rs.getString("email"));
				member.setAddress(rs.getString("address"));
				member.setRegDate(rs.getTimestamp("regdate"));
				memberList.add((vo.Member) member);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}

		return memberList;
	}

	// 회원 가입
	public void addMember(vo.Member newMember) {
		conn = JDBCUtil.getConnection();
		String sql = "INSERT INTO member(mid, passwd, mname, gender, birth, phone, "
				+ "email, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ((vo.Member) newMember).getMid());
			pstmt.setString(2, ((vo.Member) newMember).getPasswd());
			pstmt.setString(3, ((vo.Member) newMember).getMname());
			pstmt.setString(4, ((vo.Member) newMember).getGender());
			pstmt.setString(5, ((vo.Member) newMember).getBirth());
			pstmt.setString(6, ((vo.Member) newMember).getPhone());
			pstmt.setString(7, ((vo.Member) newMember).getEmail());
			pstmt.setString(8, ((vo.Member) newMember).getAddress());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}

	// 회원 정보
	public vo.Member getMember(String mid) {
		vo.Member member = new vo.Member();
		conn = JDBCUtil.getConnection();
		String sql = "SELECT * FROM member WHERE mid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 자료가 있으면
				member.setMid(rs.getString("mid"));
				member.setPasswd(rs.getString("passwd"));
				member.setMname(rs.getString("mname"));
				member.setGender(rs.getString("gender"));
				member.setBirth(rs.getString("birth"));
				member.setPhone(rs.getString("phone"));
				member.setEmail(rs.getString("email"));
				member.setAddress(rs.getString("address"));
				member.setRegDate(rs.getTimestamp("regdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return (vo.Member) member;
	}

	// 로그인 체크
	public boolean checkLogin(vo.Member member) {
		conn = JDBCUtil.getConnection();
		String sql = "SELECT * FROM member WHERE mid = ? and passwd = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ((vo.Member) member).getMid());
			pstmt.setString(2, ((vo.Member) member).getPasswd());
			rs = pstmt.executeQuery();
			if (rs.next())
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return false;
	}

	// ID 중복 체크
	public int duplicatedID(String mid) {
		int result = 0;
		conn = JDBCUtil.getConnection();
		String sql = "SELECT COUNT(*) AS result FROM member WHERE mid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("result");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return result;
	}
	
	// 멤버 삭제
	public void delectProduct(String mid) {
		conn = JDBCUtil.getConnection();
		String sql = "delete from member where mid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt);
		}

	} // 멤버 삭제 끝
}
