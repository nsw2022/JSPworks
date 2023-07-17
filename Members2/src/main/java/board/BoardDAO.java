package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.apache.catalina.tribes.transport.RxTaskPool;

import common.JDBCUtil;
import oracle.net.aso.l;

public class BoardDAO {
	// 필드
	private Connection conn = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;

	// 게시글 총 갯수
	public int getBoardCount() {
	    int total = 0;
	    conn = JDBCUtil.getConnection();
	    String sql = "SELECT COUNT(*) as total FROM t_board";
	    
	    try {
	        psmt = conn.prepareStatement(sql);
	        rs = psmt.executeQuery();
	        
	        if (rs.next()) {
	            total = rs.getInt("total");
	        }
	        
	        return total;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(conn, psmt, rs);
	    }
	    
	    return 0;
	}
	public int getBoardCount(String field, String kw) {
	    int total = 0;
	    conn = JDBCUtil.getConnection();
	    String sql = "SELECT COUNT(*) as total FROM t_board where " + field + " Like ?";
	    
	    try {
	        psmt = conn.prepareStatement(sql);
	        psmt.setString(1, "%"+kw+"%");
	        rs = psmt.executeQuery();
	        
	        if (rs.next()) {
	            total = rs.getInt("total");
	        }
	        
	        return total;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(conn, psmt, rs);
	    }
	    
	    return 0;
	}
	// 자료 검색
	public ArrayList<Board> getBoardList(String field, String kw, int startRow, int pageSize) {
	    ArrayList<Board> boardList = new ArrayList<>();
	    try {
	        conn = JDBCUtil.getConnection();
	        String sql = "SELECT * FROM t_board WHERE " + field + " LIKE ? ORDER BY bnum DESC LIMIT ?, ?";
	        psmt = conn.prepareStatement(sql);
	        psmt.setString(1, "%" + kw + "%");  // 검색어가 포함된 값을 설정
	        psmt.setInt(2, startRow - 1);  // 시작행 (limit는 시작행 0, 10, 20)
	        psmt.setInt(3, pageSize);  // 페이지당 게시글 수 (10)
	        rs = psmt.executeQuery();
	        while (rs.next()) {
	            Board board = new Board();
	            board.setBnum(rs.getInt("bnum"));
	            board.setTitle(rs.getString("title"));
	            board.setContent(rs.getString("content"));
	            board.setRegDate(rs.getTimestamp("regdate"));
	            board.setModifyDate(rs.getTimestamp("modifydate"));
	            board.setHit(rs.getInt("hit"));
	            board.setMemberId(rs.getString("memberid"));
	            
	            boardList.add(board);  // 개별 board 객체를 추가 저장
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(conn, psmt, rs);
	    }
	    return boardList;
	}

	/*
	public ArrayList<Board> getBoardList(int page){
		ArrayList<Board> boardList = new ArrayList<>();
		int pageSize = 10;
		
		
		conn = JDBCUtil.getConnection();
		String sql = "select * from t_board order by bnum desc limit ?, ?;";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, (page-1)*pageSize);  // 시작 행
			psmt.setInt(2, pageSize);  // 페이지당 게시글 수
			rs = psmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBnum(rs.getInt("bnum"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getTimestamp("regdate"));
				board.setModifyDate(rs.getTimestamp("modifydate"));
				board.setHit(rs.getInt("hit"));
				board.setMemberId(rs.getString("memberid"));
				
				boardList.add(board);  //개별 board 객체를 추가 저장
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, psmt, rs);
		}
		return boardList;
	}
	*/
	/*
	 public ArrayList<Board> getBoardList(int page) {
	      ArrayList<Board> boardList = new ArrayList<>();

	      conn = JDBCUtil.getConnection();
	      String sql = "SELECT * "
	            + "FROM (SELECT ROWNUM rn, boards.* "
	            + "FROM boards ORDER BY bid DESC)"
	            + "WHERE rn >= ? AND rn <= ?";
	      
	      int pageSize = 10;

	      try {
	    	  psmt = conn.prepareStatement(sql);
	    	  psmt.setInt(1, (page - 1) * pageSize + 1);   // 시작행
	    	  psmt.setInt(2, page * pageSize);         // 페이지당 게시글 총개수
	         
	         
	         rs = psmt.executeQuery();

	         while (rs.next()) {
	            Board board = new Board();

	            board.setBnum(rs.getInt("bid"));
	            board.setTitle(rs.getString("title"));
	            board.setContent(rs.getString("contents"));
	            board.setRegDate(rs.getTimestamp("regdate"));
	            board.setMemberId(rs.getString("memberid"));
	            board.setModifyDate(rs.getTimestamp("modifydate"));
	            board.setHit(rs.getInt("hit"));
	            board.setFileUpload(rs.getString("fileUploads"));

	            boardList.add(board);

	         }

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         JDBCUtil.close(conn, psmt, rs);
	      }

	      return boardList;

	   }
	*/

	
	// 게시글 목록
	public ArrayList<Board> getBoardList() {
		ArrayList<Board> boardList = new ArrayList<>();
		conn = JDBCUtil.getConnection();
		String sql = "select * from t_board order by bunm desc";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBnum(rs.getInt("bnum"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getTimestamp("regdate"));
				board.setModifyDate(rs.getTimestamp("modifydate"));
				board.setHit(rs.getInt("hit"));
				board.setMemberId(rs.getString("memberid"));
				boardList.add(board); // 개별 Board 객체를 추가
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return boardList;
	}// 게시글 목록 getBoardList()
	
	
	// 강사님버전 3개추출
	public ArrayList<Board> getBoardList(int limt) {
		ArrayList<Board> boardList = new ArrayList<>();
		conn = JDBCUtil.getConnection();
		String sql = "select * from t_board order by bunm desc";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBnum(rs.getInt("bnum"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getTimestamp("regdate"));
				board.setModifyDate(rs.getTimestamp("modifydate"));
				board.setHit(rs.getInt("hit"));
				board.setMemberId(rs.getString("memberid"));
				boardList.add(board); // 개별 Board 객체를 추가
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return boardList;
	}
	// 강사님버전 3개추출

	// 게시글 쓰기
	public void addBoard(Board board) {
		conn = JDBCUtil.getConnection();
		String sql = "INSERT INTO t_board(title, content, memberId, fileupload) " + "VALUES(?, ?, ?, ?)";
		


		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, board.getTitle());
			psmt.setString(2, board.getContent());
			psmt.setString(3, board.getMemberId());
			psmt.setString(4, board.getFileUpload());
			psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, psmt);
		}
	}// 게시글 쓰기 addBoard

	// 게시글 상세보기(1건 자세히보기)
	public Board getBoard(int bnum) {
	      Board board = new Board();
	      conn=JDBCUtil.getConnection();
	      String sql = "SELECT * FROM t_board WHERE bnum = ?";
	      try {
	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1, bnum); // 글 번호 바인딩
	         rs = psmt.executeQuery();
	         if(rs.next()) {
	            board.setBnum(rs.getInt("bnum"));
	            board.setTitle(rs.getString("title"));
	            board.setContent(rs.getString("content"));
	            board.setRegDate(rs.getTimestamp("regdate"));
	            board.setModifyDate(rs.getTimestamp("modifydate"));
	            board.setHit(rs.getInt("hit"));
	            board.setMemberId(rs.getString("memberid"));
	            
	            //조회수 증가
	            int hit = rs.getInt("hit") + 1;
	            sql = "UPDATE t_board SET hit = ? WHERE bnum = ?";
	            psmt = conn.prepareStatement(sql);
	            psmt.setInt(1, hit);
	            psmt.setInt(2, bnum);
	            psmt.executeUpdate();
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         JDBCUtil.close(conn, psmt);
	      }
	      
	      return board;
	   }// 게시글 상세보기
	
	// 게시글 삭제
	public void deleteBoard(int bnum) {
		conn = JDBCUtil.getConnection();
		String sql = "delete from t_board where bnum = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, bnum);
			psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, psmt);
		}
	}
	
	// 회원삭제
	public void deleteMember(String memberId) {
		conn = JDBCUtil.getConnection();
		String sql = "delete from t_member where memberId = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, memberId);
			psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, psmt);
		}
	}// 회원삭제 deleteMember
	
	// 게시글 수정
	public void boardUdate(Board board) {
		// 현재 날짜와 시간 객체 생성
		Timestamp now = new Timestamp(System.currentTimeMillis());
		
		conn=JDBCUtil.getConnection();
		String sql = "update t_board SET title = ?, content = ?, modifydate = ? where bnum = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, board.getTitle());
			psmt.setString(2, board.getContent());
			psmt.setTimestamp(3, now);// 수정날짜를 지금으로함 // setTimestamp()
			psmt.setInt(4, board.getBnum());
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, psmt);
		}
		
	}// 게시글 수정
	
	// 최근 게시글 3개
	public ArrayList<Board> getRecentBoards(int limit) {
	    conn = JDBCUtil.getConnection();
	    String sql = "SELECT * FROM t_board "
	            + "ORDER BY bnum DESC "
	            + "LIMIT ?";

	    ArrayList<Board> recentBoards = new ArrayList<>();

	    try {
	        psmt = conn.prepareStatement(sql);
	        psmt.setInt(1, limit);
	        rs = psmt.executeQuery();

	        while (rs.next()) {
	            Board board = new Board();
	            board.setBnum(rs.getInt("bnum"));
	            board.setTitle(rs.getString("title"));
	            board.setContent(rs.getString("content"));
	            board.setRegDate(rs.getTimestamp("regdate"));
	            board.setModifyDate(rs.getTimestamp("modifydate"));
	            board.setHit(rs.getInt("hit"));
	            board.setMemberId(rs.getString("memberid"));

	            recentBoards.add(board);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(conn, psmt, rs);
	    }

	    return recentBoards;
	}
	
	public ArrayList<Board> getBoardList(String field, String kw) {
		ArrayList<Board> boardList = new ArrayList<>();
		conn = JDBCUtil.getConnection();
		String sql = "SELECT * FROM t_board WHERE " + field + " LIKE ? ORDER BY bnum DESC";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%"+kw+"%");
			rs = psmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBnum(rs.getInt("bnum"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getTimestamp("regdate"));
				board.setModifyDate(rs.getTimestamp("modifydate"));
				board.setHit(rs.getInt("hit"));
				board.setMemberId(rs.getString("memberid"));
				boardList.add(board); // 개별 Board 객체를 추가
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return boardList;
	}

}

	

