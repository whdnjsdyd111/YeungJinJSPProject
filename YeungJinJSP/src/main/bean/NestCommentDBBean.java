package main.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NestCommentDBBean {
	private static NestCommentDBBean instance = new NestCommentDBBean();
	
	private NestCommentDBBean() {}
	
	public static NestCommentDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public List<NestCommentDataBean> getNestList(int com_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NestCommentDataBean> nestList = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT n.neCom_id, n.com_id, m.mem_id, m.mem_nickname, m.mem_level, n.recom_content, n.recom_date"
					+ " FROM nestcomment n JOIN member m ON n.mem_id = m.mem_id"
					+ " WHERE n.com_id = ? ORDER BY n.recom_date ASC";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				nestList = new ArrayList<>();
				
				do {
					NestCommentDataBean nestCom = new NestCommentDataBean();
					
					nestCom.setNeCom_id(rs.getInt(1));
					nestCom.setCom_id(rs.getInt(2));
					nestCom.setMem_id(rs.getInt(3));
					nestCom.setMem_nickname(rs.getString(4));
					nestCom.setMem_level(rs.getInt(5));
					nestCom.setReCom_content(rs.getString(6));
					nestCom.setReCom_date(rs.getTimestamp(7));
					
					nestList.add(nestCom);
				} while(rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)
				try { rs.close(); } catch(SQLException sqle) {}
			if(pstmt != null)
				try { pstmt.close(); } catch(SQLException sqle) {}
			if(conn != null)
				try { conn.close(); } catch(SQLException sqle) {}
		}
		
		return nestList;
	}
	
	public JoinNestCommentContentsBean getNestCom(int neCom_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JoinNestCommentContentsBean nestCom = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT n.neCom_id, c.com_id, m.mem_id, m.mem_nickname, m.mem_level, c.com_bd_id, n.reCom_content, n.reCom_date"
					+ " FROM member m JOIN comment c JOIN nestcomment n ON m.mem_id = n.mem_id AND c.com_id = n.com_id"
					+ " WHERE n.neCom_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, neCom_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				nestCom = new JoinNestCommentContentsBean();
				
				nestCom.setNeCom_id(rs.getInt(1));
				nestCom.setCom_id(rs.getInt(2));
				nestCom.setCom_mem_id(rs.getInt(3));
				nestCom.setCom_mem_nickname(rs.getString(4));
				nestCom.setCom_mem_level(rs.getInt(5));
				nestCom.setCom_db_id(rs.getInt(6));
				nestCom.setCom_content(rs.getString(7));
				nestCom.setCom_date(rs.getTimestamp(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)
				try { rs.close(); } catch(SQLException sqle) {}
			if(pstmt != null)
				try { pstmt.close(); } catch(SQLException sqle) {}
			if(conn != null)
				try { conn.close(); } catch(SQLException sqle) {}
		}
		
		return nestCom;
	}
	
	public int insertNestComment(int com_id, int mem_id, String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO nestcomment(com_id, mem_id, recom_content) VALUES(?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			pstmt.setInt(2, mem_id);
			pstmt.setString(3, content);
			
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
	
	public int deleteNestComment(int nest_com_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM nestcomment WHERE necom_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nest_com_id);
			
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
	
	public Set<Integer> getNestCommentIds(int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Set<Integer> set = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT n.neCom_id FROM member m JOIN nestcomment n ON m.mem_id = n.mem_id WHERE m.mem_id = ?";
			
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
