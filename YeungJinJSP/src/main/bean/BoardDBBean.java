package main.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean();
	
	private BoardDBBean() {}
	
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public int insertBoard(int mem_id, int kind_id, String title, String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO board (board_userid, board_kind, board_title, board_content) " +
					"VALUES (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			pstmt.setInt(2, kind_id);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			
			check = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
		}
		
		return check;
	}
	
	public List<JoinBoardMemberKindDataBean> getJoinBdMemKindOrderByReco(int page) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<JoinBoardMemberKindDataBean> boardList = new ArrayList<JoinBoardMemberKindDataBean>();
		
		try {
			conn = getConnection();
			String sql = "SELECT b.board_id, b.board_title, b.board_date, b.board_reco, b.board_readcount, "
					+ "m.mem_nickname, m.mem_level, k.kind_name from board b, member m, kind k "
					+ "WHERE b.board_userid = m.mem_id AND b.board_kind = k.kind_id "
					+ "ORDER BY b.board_reco DESC limit ?, ?;";
			
			pstmt = conn.prepareStatement(sql);
			if(page == 1)
				pstmt.setInt(1, 0);
			else
				pstmt.setInt(1, (page - 1) * 30);
			
			pstmt.setInt(2, 30);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JoinBoardMemberKindDataBean board = new JoinBoardMemberKindDataBean();
				
				board.setBoard_id(rs.getInt(1));
				board.setBoard_title(rs.getString(2));
				board.setBoard_date(rs.getTimestamp(3));
				board.setBoard_reco(rs.getInt(4));
				board.setBoard_readcount(rs.getInt(5));
				board.setMem_nickname(rs.getString(6));
				board.setMem_level(rs.getInt(7));
				board.setKind_name(rs.getString(8));
				
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)
				try { rs.close(); } catch (SQLException e) {}
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
		}
		
		return boardList;
	}
	
	public List<JoinBoardMemberKindDataBean> getJoinBdMemKindOrderByReco(int page, int kind_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<JoinBoardMemberKindDataBean> boardList = new ArrayList<JoinBoardMemberKindDataBean>();
		
		try {
			conn = getConnection();
			String sql = "SELECT b.board_id, b.board_title, b.board_date, b.board_reco, b.board_readcount, "
					+ "m.mem_nickname, m.mem_level, k.kind_name from board b, member m, kind k "
					+ "WHERE b.board_userid = m.mem_id AND b.board_kind = k.kind_id AND k.kind= ? "
					+ "ORDER BY b.board_reco DESC limit ?, ?;";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, kind_id);
			
			if(page == 1)
				pstmt.setInt(2, 0);
			else
				pstmt.setInt(2, (page - 1) * 30);
			
			pstmt.setInt(3, 30);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JoinBoardMemberKindDataBean board = new JoinBoardMemberKindDataBean();
				
				board.setBoard_id(rs.getInt(1));
				board.setBoard_title(rs.getString(2));
				board.setBoard_date(rs.getTimestamp(3));
				board.setBoard_reco(rs.getInt(4));
				board.setBoard_readcount(rs.getInt(5));
				board.setMem_nickname(rs.getString(6));
				board.setMem_level(rs.getInt(7));
				board.setKind_name(rs.getString(8));
				
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)
				try { rs.close(); } catch (SQLException e) {}
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
		}
		
		return boardList;
	}
	
	public List<JoinBoardMemberKindDataBean> getJoinBdMemKindOrderByTime(int page) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<JoinBoardMemberKindDataBean> boardList = new ArrayList<JoinBoardMemberKindDataBean>();
		
		try {
			conn = getConnection();
			String sql = "SELECT b.board_id, b.board_title, b.board_date, b.board_reco, b.board_readcount, "
					+ "m.mem_nickname, m.mem_level, k.kind_name from board b, member m, kind k "
					+ "WHERE b.board_userid = m.mem_id AND b.board_kind = k.kind_id "
					+ "ORDER BY b.board_date DESC limit ?, ?;";
			
			pstmt = conn.prepareStatement(sql);
			if(page == 1)
				pstmt.setInt(1, 0);
			else
				pstmt.setInt(1, (page - 1) * 30);
			
			pstmt.setInt(2, 30);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JoinBoardMemberKindDataBean board = new JoinBoardMemberKindDataBean();
				
				board.setBoard_id(rs.getInt(1));
				board.setBoard_title(rs.getString(2));
				board.setBoard_date(rs.getTimestamp(3));
				board.setBoard_reco(rs.getInt(4));
				board.setBoard_readcount(rs.getInt(5));
				board.setMem_nickname(rs.getString(6));
				board.setMem_level(rs.getInt(7));
				board.setKind_name(rs.getString(8));
				
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)
				try { rs.close(); } catch (SQLException e) {}
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
		}
		
		return boardList;
	}
	
	public List<JoinBoardMemberKindDataBean> getJoinBdMemKindOrderByTime(int page, int kind_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<JoinBoardMemberKindDataBean> boardList = new ArrayList<JoinBoardMemberKindDataBean>();
		
		try {
			conn = getConnection();
			String sql = "SELECT b.board_id, b.board_title, b.board_date, b.board_reco, b.board_readcount, "
					+ "m.mem_nickname, m.mem_level, k.kind_name from board b, member m, kind k "
					+ "WHERE b.board_userid = m.mem_id AND b.board_kind = k.kind_id AND k.kind= ? "
					+ "ORDER BY b.board_date DESC limit ?, ?;";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, kind_id);
			
			if(page == 1)
				pstmt.setInt(2, 0);
			else
				pstmt.setInt(2, (page - 1) * 30);
			
			pstmt.setInt(3, 30);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JoinBoardMemberKindDataBean board = new JoinBoardMemberKindDataBean();
				
				board.setBoard_id(rs.getInt(1));
				board.setBoard_title(rs.getString(2));
				board.setBoard_date(rs.getTimestamp(3));
				board.setBoard_reco(rs.getInt(4));
				board.setBoard_readcount(rs.getInt(5));
				board.setMem_nickname(rs.getString(6));
				board.setMem_level(rs.getInt(7));
				board.setKind_name(rs.getString(8));
				
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)
				try { rs.close(); } catch (SQLException e) {}
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
		}
		
		return boardList;
	}
}
