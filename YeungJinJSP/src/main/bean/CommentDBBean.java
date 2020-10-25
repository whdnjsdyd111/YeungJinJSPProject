package main.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentDBBean {
	private static CommentDBBean instance = new CommentDBBean();
	
	private CommentDBBean() {}
	
	public static CommentDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public JoinMemberCommentDataBean getCommentContents(int com_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JoinMemberCommentDataBean joinMemCom = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT c.com_id, m.mem_id, m.mem_nickname, m.mem_level, c.com_bd_id, c.com_content, c.com_reco, c.com_date " + 
					"FROM member m JOIN comment c ON m.mem_id = c.com_mem_id " + 
					"WHERE c.com_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				joinMemCom = new JoinMemberCommentDataBean();
					
				joinMemCom.setCom_id(rs.getInt(1));
				joinMemCom.setCom_mem_id(rs.getInt(2));
				joinMemCom.setCom_mem_nickname(rs.getString(3));
				joinMemCom.setCom_mem_level(rs.getInt(4));
				joinMemCom.setCom_db_id(rs.getInt(5));
				joinMemCom.setCom_content(rs.getString(6));
				joinMemCom.setCom_reco(rs.getInt(7));
				joinMemCom.setCom_date(rs.getTimestamp(8));
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
		
		return joinMemCom;
	}
	
	public List<JoinCommentContentsBean> getCommentOrderByTime() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<JoinCommentContentsBean> list = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT m.mem_id, m.mem_nickname, c.com_id, c.com_content FROM member m JOIN comment c ON m.mem_id = c.com_mem_id"
					+ " ORDER BY c.com_date DESC";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<>();
				
				do {
					JoinCommentContentsBean contents = new JoinCommentContentsBean();
					
					contents.setMem_id(rs.getInt(1));
					contents.setMem_nickname(rs.getString(2));
					contents.setCom_id(rs.getInt(3));
					contents.setCom_content(rs.getString(4));
					
					list.add(contents);
				} while (rs.next());
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
		
		return list;
	}
	
	public List<JoinCommentContentsBean> getCommentOrderByReco() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<JoinCommentContentsBean> list = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT m.mem_id, m.mem_nickname, c.com_id, c.com_content FROM member m JOIN comment c ON m.mem_id = c.com_mem_id"
					+ " ORDER BY c.com_reco DESC";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<>();
				
				do {
					JoinCommentContentsBean contents = new JoinCommentContentsBean();
					
					contents.setMem_id(rs.getInt(1));
					contents.setMem_nickname(rs.getString(2));
					contents.setCom_id(rs.getInt(3));
					contents.setCom_content(rs.getString(4));
					
					list.add(contents);
				} while (rs.next());
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
		
		return list;
	}
	
	public List<JoinCommentContentsBean> getCommentOrderByNonReco() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<JoinCommentContentsBean> list = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT m.mem_id, m.mem_nickname, c.com_id, c.com_content FROM member m JOIN comment c ON m.mem_id = c.com_mem_id"
					+ " ORDER BY c.com_reco ASC";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<>();
				
				do {
					JoinCommentContentsBean contents = new JoinCommentContentsBean();
					
					contents.setMem_id(rs.getInt(1));
					contents.setMem_nickname(rs.getString(2));
					contents.setCom_id(rs.getInt(3));
					contents.setCom_content(rs.getString(4));
					
					list.add(contents);
				} while (rs.next());
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
		
		return list;
	}
	
	public Map<JoinMemberCommentDataBean, List<NestCommentDataBean>> getCommentList(int board_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Map<JoinMemberCommentDataBean, List<NestCommentDataBean>> commentMap = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT c.com_id, m.mem_id, m.mem_nickname, m.mem_level, c.com_bd_id, c.com_content, c.com_reco, c.com_date " + 
					"FROM member m JOIN comment c ON m.mem_id = c.com_mem_id " + 
					"WHERE c.com_bd_id = ? ORDER BY c.com_reco DESC";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				NestCommentDBBean nestProcess = NestCommentDBBean.getInstance();
				commentMap = new LinkedHashMap<>();
				
				do {
					JoinMemberCommentDataBean joinMemCom = new JoinMemberCommentDataBean();
					
					joinMemCom.setCom_id(rs.getInt(1));
					joinMemCom.setCom_mem_id(rs.getInt(2));
					joinMemCom.setCom_mem_nickname(rs.getString(3));
					joinMemCom.setCom_mem_level(rs.getInt(4));
					joinMemCom.setCom_db_id(rs.getInt(5));
					joinMemCom.setCom_content(rs.getString(6));
					joinMemCom.setCom_reco(rs.getInt(7));
					joinMemCom.setCom_date(rs.getTimestamp(8));
					
					commentMap.put(joinMemCom, nestProcess.getNestList(joinMemCom.getCom_id()));
				} while(rs.next());
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
		
		return commentMap;
	}
	
	public Map<JoinMemberCommentDataBean, List<NestCommentDataBean>> getCommentRecentList(int board_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Map<JoinMemberCommentDataBean, List<NestCommentDataBean>> commentMap = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT c.com_id, m.mem_id, m.mem_nickname, m.mem_level, c.com_bd_id, c.com_content, c.com_reco, c.com_date " + 
					"FROM member m JOIN comment c ON m.mem_id = c.com_mem_id " + 
					"WHERE c.com_bd_id = ? ORDER BY c.com_date DESC";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				NestCommentDBBean nestProcess = NestCommentDBBean.getInstance();
				commentMap = new LinkedHashMap<>();
				
				do {
					JoinMemberCommentDataBean joinMemCom = new JoinMemberCommentDataBean();
					
					joinMemCom.setCom_id(rs.getInt(1));
					joinMemCom.setCom_mem_id(rs.getInt(2));
					joinMemCom.setCom_mem_nickname(rs.getString(3));
					joinMemCom.setCom_mem_level(rs.getInt(4));
					joinMemCom.setCom_db_id(rs.getInt(5));
					joinMemCom.setCom_content(rs.getString(6));
					joinMemCom.setCom_reco(rs.getInt(7));
					joinMemCom.setCom_date(rs.getTimestamp(8));
					
					commentMap.put(joinMemCom, nestProcess.getNestList(joinMemCom.getCom_id()));
				} while(rs.next());
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
		
		return commentMap;
	}
	
	public JoinMemberCommentDataBean getCom(int com_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JoinMemberCommentDataBean joinMemCom = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT c.com_id, m.mem_id, m.mem_nickname, m.mem_level, c.com_bd_id, c.com_content, c.com_reco, c.com_date " + 
					"FROM member m JOIN comment c ON m.mem_id = c.com_mem_id " + 
					"WHERE c.com_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				joinMemCom = new JoinMemberCommentDataBean();
				
				joinMemCom.setCom_id(rs.getInt(1));
				joinMemCom.setCom_mem_id(rs.getInt(2));
				joinMemCom.setCom_mem_nickname(rs.getString(3));
				joinMemCom.setCom_mem_level(rs.getInt(4));
				joinMemCom.setCom_db_id(rs.getInt(5));
				joinMemCom.setCom_content(rs.getString(6));
				joinMemCom.setCom_reco(rs.getInt(7));
				joinMemCom.setCom_date(rs.getTimestamp(8));
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
		
		return joinMemCom;
	}
	
	public int commentInsert(int mem_id, int board_id, String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO comment(com_mem_id, com_bd_id, com_content) VALUES(?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			pstmt.setInt(2, board_id);
			pstmt.setString(3, content);
			
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
	
	public int updateComReco(int com_id, int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "UPDATE comment SET com_reco = "
					+ "(SELECT * FROM (SELECT com_reco FROM comment WHERE com_id = ?) AS A) + (?) WHERE com_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			pstmt.setInt(2, num);
			pstmt.setInt(3, com_id);
			
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
	
	public int getComReco(int com_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		
		try {
			conn = getConnection();
			String sql = "SELECT com_reco FROM comment WHERE com_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				num = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
		}
		
		return num;
	}
	
	public int commentDelete(int com_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM comment WHERE com_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
				try { pstmt.close(); } catch(SQLException sqle) {}
			if(conn != null)
				try { conn.close(); } catch(SQLException sqle) {}
		}
		
		return check;
	}
	
	public Set<Integer> getCommentIds(int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Set<Integer> set = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT c.com_id FROM member m JOIN comment c ON m.mem_id = c.com_mem_id WHERE m.mem_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				set = new HashSet<>();
				
				do {
					set.add(rs.getInt(1));
				} while (rs.next());
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
		
		return set;
	}
}
