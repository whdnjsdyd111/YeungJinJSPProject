package main.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	public int userCheck(String mem_email, String mem_passwd) {	// 유저 체크
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SHA256 sha = SHA256.getInstance();
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "SELECT mem_passwd, mem_auth FROM member WHERE mem_email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(BCrypt.checkpw(sha.getSha256(mem_passwd), rs.getString("mem_passwd"))) {
					if(rs.getString("mem_auth").equals("Y")) {
						check = 1;
					} else {
						check = 2;
					}
				} else {
					check = 0;
				}
			} else {
				check = 0;
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
		
		return check;
	}
	
	public int userCheck(int mem_id, String mem_passwd) {	// 유저 체크
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SHA256 sha = SHA256.getInstance();
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "SELECT mem_passwd FROM member WHERE mem_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(BCrypt.checkpw(sha.getSha256(mem_passwd), rs.getString("mem_passwd"))) {
					check = 1;
				} else {
					check = 2;
				}
			} else {
				check = 0;
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
			String sql = "INSERT INTO member(mem_email, mem_passwd, mem_nickname) VALUES(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mem_email);
			pstmt.setString(2, bcpw);
			pstmt.setString(3, mem_nickname);
			
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
	
	public int getMem_id(String mem_email) {	// 이메일로 유저 번호 얻기
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
		} finally {
			if(rs != null)
				try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null )
				try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch(SQLException e) {}
		}
		
		return mem_id;
	}
	
	public int updateAuth(int mem_id) {	// 권한 부여
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
		} finally {
			if(pstmt != null )
				try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch(SQLException e) {}
		}
		
		return check;
	}
	
	public int updatePassword(int mem_id, String passwd) {	// 비번 변경
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		try {
			conn = getConnection();
			String sql = "UPDATE member SET mem_passwd = ? WHERE mem_id = ?";
			
			SHA256 sha = SHA256.getInstance();
			
			String shaPw = sha.getSha256(passwd);
			String encPw = BCrypt.hashpw(shaPw, BCrypt.gensalt());
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, encPw);
			pstmt.setInt(2, mem_id);
			
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
	
	public MemberDataBean getMember(String email) {	// 이메일로 빈 얻기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDataBean mem = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM member WHERE mem_email = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mem = new MemberDataBean();
				mem.setMem_id(rs.getInt(1));
				mem.setMem_email(rs.getString(2));
				mem.setMem_passwd(rs.getString(3));
				mem.setMem_nickname(rs.getString(4));
				mem.setMem_auth(rs.getByte(5));
				mem.setMem_ex(rs.getInt(6));
				mem.setMem_level(rs.getInt(7));
				mem.setMem_date(rs.getTimestamp(8));
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
		
		return mem;
	}
	
	public MemberDataBean getMember(int mem_id) {	// 유저 번호로 빈 얻기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDataBean mem = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM member WHERE mem_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mem = new MemberDataBean();
				mem.setMem_id(rs.getInt(1));
				mem.setMem_email(rs.getString(2));
				mem.setMem_passwd(rs.getString(3));
				mem.setMem_nickname(rs.getString(4));
				mem.setMem_auth(rs.getByte(5));
				mem.setMem_ex(rs.getInt(6));
				mem.setMem_level(rs.getInt(7));
				mem.setMem_date(rs.getTimestamp(8));
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
		
		return mem;
	}
	
	public int updateNickname(int mem_id, String nickname) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "UPDATE member SET mem_nickname = ? WHERE mem_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.setInt(2, mem_id);
			
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
}
