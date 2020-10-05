package main.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PageViewDBBean {
	private static PageViewDBBean instance = new PageViewDBBean();
	
	private PageViewDBBean() {}
	
	public static PageViewDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public void insertUpdatePageView() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO page_view(view_date) VALUES(DATE_FORMAT(now(), '%y-%m-%d')) "
					+ "ON DUPLICATE KEY UPDATE view_num = view_num + 1";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null)
				try { conn.close(); } catch(SQLException e) {}
			if(pstmt != null)
				try { pstmt.close(); } catch(SQLException e) {}
		}
		
		
	}
}
