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
}
