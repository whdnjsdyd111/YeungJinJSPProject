package main.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDBBean {
	private static MemberDBBean instance = new MemberDBBean();
	
	private MemberDBBean() {}
	
	public static MemberDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	// registerForm.jsp 에서 사용할 메소드들
	
	public int checkEmail(String mem_email) {	// 이메일 존재 여부 체크
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "SELECT mem_email FROM member WHERE mem_email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_email);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				check = 1;
			else
				check = 0;
			
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
		
		return check;
	}
	
	public int checkNick(String mem_nickname) {	// 닉네임 존재 여부 체크
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "SELECT mem_nickname FROM member WHERE mem_nickname = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_nickname);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				check = 1;
			else
				check = 0;
			
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
		
		return check;
	}
	
	public int insertMember(String mem_email, String mem_passwd, String mem_nickname) {	// 데이터 인서트
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		// SHA256, BCrypt로 암호화
		SHA256 sha = SHA256.getInstance();
		String shapw = sha.getSha256(mem_passwd);
		String bcpw = BCrypt.hashpw(shapw, BCrypt.gensalt());
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO member(mem_email, mem_passwd, mem_nickname, mem_date) VALUES(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mem_email);
			pstmt.setString(2, bcpw);
			pstmt.setString(3, mem_nickname);
			pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			
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
	
	public int getMem_id(String mem_email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int mem_id = 0;
		try {
			conn = getConnection();
			String sql = "SELECT mem_id FROM member WHERE mem_email = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mem_id = rs.getInt(1);
			} else {
				mem_id = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mem_id;
	}
	
	public int updateAuth(int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		try {
			conn = getConnection();
			String sql = "UPDATE member SET mem_auth = 'Y' WHERE mem_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			
			check = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return check;
	}
}
