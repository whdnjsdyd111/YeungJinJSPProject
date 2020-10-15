package main.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemoDBBean {
	private static MemoDBBean instance = new MemoDBBean();
	
	private MemoDBBean() {}
	
	public static MemoDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public int memoInsert(int admin_id, String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO memo (admin_id, memo_content) VALUES (?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, admin_id);
			pstmt.setString(2, content);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
				try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch(SQLException e) {}
		}
		
		return check;
	}
	
	public int memoDelete(int memo_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM memo WHERE memo_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memo_id);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
				try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch(SQLException e) {}
		}
		
		return check;
	}
}
