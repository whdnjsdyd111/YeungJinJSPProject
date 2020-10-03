package main.bean;

import java.sql.Connection;
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
		Statement stmt = null;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO visit(visit_date) VALUES(DATE_FORMAT(now(), '%y-%m-%d')) "
					+ "ON DUPLICATE KEY UPDATE visit_num = visit_num + 1";
			
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null)
				try { conn.close(); } catch(SQLException e) {}
			if(stmt != null)
				try { stmt.close(); } catch(SQLException e) {}
		}
	}
}
