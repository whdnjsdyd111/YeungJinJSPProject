package main.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.commons.collections4.map.HashedMap;

public class CommentRecommandDBBean {
	private static CommentRecommandDBBean instance = new CommentRecommandDBBean();
	
	private CommentRecommandDBBean() {}
	
	public static CommentRecommandDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public Map<Integer, String> getComRecoMap(String mem_idEnc, int board_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Map<Integer, String> map = null;
		
		try {
			SHA256 sha = SHA256.getInstance();
			AES256Util aes = new AES256Util(sha.getSha256("random_mem_id_key"));
			int mem_id = Integer.valueOf(aes.aesDecode(mem_idEnc));
			
			conn = getConnection();
			String sql = "SELECT r.com_id, r.nonreco FROM comment c JOIN comment_recommend r "
					+ "ON r.com_id = c.com_id WHERE r.mem_id = ? AND c.com_bd_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			pstmt.setInt(2, board_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				map = new HashedMap<Integer, String>();
				
				do {
					map.put(rs.getInt(1), rs.getString(2));
				} while(rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)
				try { rs.close(); } catch (SQLException e) {}
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
		}
		
		return map;
	}
	
	public int insertComReco(int com_id, int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO comment_recommend(com_id, mem_id) VALUES(?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			pstmt.setInt(2, mem_id);
			
			check = pstmt.executeUpdate();
		} catch(SQLIntegrityConstraintViolationException e) {
			check = 2;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
		}
		
		return check;
	}
	
	public int insertComNonReco(int com_id, int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO comment_recommend VALUES(?, ?, 'Y')";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			pstmt.setInt(2, mem_id);
			
			check = pstmt.executeUpdate();
		} catch(SQLIntegrityConstraintViolationException e) {
			check = 2;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
		}
		
		return check;
	}
	
	public int deleteComReco(int com_id, int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM comment_recommend WHERE com_id = ? AND mem_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			pstmt.setInt(2, mem_id);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
		}
		
		return check;
	}
	
	public int updateNonReco(int com_id, int mem_id, String nonReco) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "UPDATE comment_recommend SET nonreco = ? WHERE com_id = ? AND mem_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nonReco);
			pstmt.setInt(2, com_id);
			pstmt.setInt(3, mem_id);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
		}
		
		return check;
	}
}
