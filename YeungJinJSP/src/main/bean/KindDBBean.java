package main.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class KindDBBean {
	private static KindDBBean instance = new KindDBBean();
	
	private KindDBBean() {}
	
	public static KindDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public String getKind_name(int kind_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String kind_name = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT kind_name FROM kind WHERE kind_id = ?");
			pstmt.setInt(1, kind_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				kind_name = rs.getString(1);
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
		
		return kind_name;
	}
}
