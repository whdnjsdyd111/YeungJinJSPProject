package main.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BookmarkDBBean {
	private static BookmarkDBBean instance = new BookmarkDBBean();
	
	private BookmarkDBBean() {}
	
	public static BookmarkDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public boolean checkBookmark(int board_id, int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean bool = false;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM bookmark WHERE board_id = ? AND mem_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, board_id);
			pstmt.setInt(2, mem_id);
			
			rs = pstmt.executeQuery();

			if(rs.next())
				bool = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)
				try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null )
				try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch(SQLException e) {}
		}
		
		return bool;
	}
	
	public int insertBookmark(int mem_id, int board_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO bookmark VALUES(?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			pstmt.setInt(2, board_id);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null )
				try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch(SQLException e) {}
		}
		
		return check;
	}
	
	public int deleteBookmark(int mem_id, int board_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM bookmark WHERE mem_id = ? AND board_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			pstmt.setInt(2, board_id);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null )
				try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch(SQLException e) {}
		}
		
		return check;
	}
}
