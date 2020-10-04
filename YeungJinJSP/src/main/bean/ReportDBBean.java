package main.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReportDBBean {
	private static ReportDBBean instance = new ReportDBBean();
	
	private ReportDBBean() {}
	
	public static ReportDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public int insertReport(String rep_content, int cont_id, String cont_kind, int rep_kind, int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO report(rep_content, cont_id, cont_kind, rep_kind_id, mem_id) VALUES(?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rep_content);
			pstmt.setInt(2, cont_id);
			pstmt.setString(3, cont_kind);
			pstmt.setInt(4, rep_kind);
			pstmt.setInt(5, mem_id);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
		}
		
		return check;
	}
}
