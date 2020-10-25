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

public class AdminNoticeDBBean {
	private static AdminNoticeDBBean instance = new AdminNoticeDBBean();
	
	private AdminNoticeDBBean() {}
	
	public static AdminNoticeDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public int insertAdminNotice(int mem_id, String notice_content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO admin_notice(mem_id, notice_content) VALUES(?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			pstmt.setString(2, notice_content);
			
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
	
	public List<AdminNoticeDataBean> getNoticeList(int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<AdminNoticeDataBean> list = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM admin_notice WHERE mem_id = ? ORDER BY notice_id ASC ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<>();
				
				do {
					AdminNoticeDataBean notice = new AdminNoticeDataBean();
					
					notice.setNotice_id(rs.getInt(1));
					notice.setMem_id(rs.getInt(2));
					notice.setNotice_content(rs.getString(3));
					notice.setNotice_date(rs.getTimestamp(4));
					
					list.add(notice);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)
				try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null)
				try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch(SQLException e) {}
		}
		
		return list;
	}
	
	public int deleteNotice(int notice_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM admin_notice WHERE notice_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_id);
			
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
	
	public int deleteAllNotice(int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM admin_notice WHERE mem_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			
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
