package main.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.commons.collections4.map.HashedMap;

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
	
	public int checkAdminId(int id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int admin_id = 0;
		
		try {
			conn = getConnection();
			String sql = "SELECT admin_id FROM admin WHERE admin_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				admin_id = rs.getInt(1);
			}
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
	
	public JoinMemberAdminDataBean getAdminMember(int admin_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JoinMemberAdminDataBean memAdmin = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT a.admin_name, m.mem_email, DATE(a.admin_reg_date), m.mem_nickname, m.mem_level, a.admin_phone FROM"
					+ " admin a JOIN member m ON a.admin_id = m.mem_id" + 
					" WHERE a.admin_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, admin_id);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memAdmin = new JoinMemberAdminDataBean();
				
				memAdmin.setAdmin_name(rs.getString(1));
				memAdmin.setMem_email(rs.getString(2));
				memAdmin.setAdmin_reg_date(rs.getString(3));
				memAdmin.setMem_nickname(rs.getString(4));
				memAdmin.setMem_level(rs.getInt(5));
				memAdmin.setAdmin_phone(rs.getString(6));
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
		
		return memAdmin;
	}
	
	public Map<Integer, String> getAdminMap() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Map<Integer, String> map = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT admin_id, admin_name FROM admin";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				map = new HashedMap<>();
				
				do {
					map.put(rs.getInt(1), rs.getString(2));
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
		
		return map;
	}
}
