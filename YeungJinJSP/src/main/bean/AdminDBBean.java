package main.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminDBBean {
	private static AdminDBBean instance = new AdminDBBean();
	
	private AdminDBBean() {}
	
	public static AdminDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public int getAdminId(String email, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int admin_id = 0;
		
		try {
			conn = getConnection();
			String sql = "SELECT a.admin_id, m.mem_passwd FROM admin a JOIN member m ON m.mem_id = a.admin_id "
					+ "WHERE m.mem_email = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(BCrypt.checkpw(SHA256.getInstance().getSha256(passwd), rs.getString(2)))
					admin_id = rs.getInt(1);
			} else
				admin_id = 0;
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
		
		return admin_id;
	}
}
