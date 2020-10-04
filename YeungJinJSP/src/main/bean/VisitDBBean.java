package main.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class VisitDBBean {
	private static VisitDBBean instance = new VisitDBBean();
	
	private VisitDBBean() {}
	
	public static VisitDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public void insertUpdateCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO visit(visit_date) VALUES(DATE_FORMAT(now(), '%y-%m-%d')) "
					+ "ON DUPLICATE KEY UPDATE visit_num = visit_num + 1";
			
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
