package main.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RecommendDBBean {
	private static RecommendDBBean instance = new RecommendDBBean();
	
	private RecommendDBBean() {}
	
	public static RecommendDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public String getCheckReco(int board_id, int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String nonReco = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT nonreco FROM recommend WHERE board_id = ? AND mem_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			pstmt.setInt(2, mem_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				nonReco = rs.getString(1);
			
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
		
		return nonReco;
	}
	
	public int updateNonRecoN(int board_id, int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "UPDATE recommend SET nonreco = 'N' WHERE board_id = ? AND mem_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
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
	
	public int updateNonRecoY(int board_id, int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "UPDATE recommend SET nonreco = 'Y' WHERE board_id = ? AND mem_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
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
	
	public int deleteReco(int board_id, int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM recommend WHERE board_id = ? AND mem_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
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
	
	public int insertReco(int board_id, int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO recommend(board_id, mem_id) VALUES(?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
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
	
	public int insertNonReco(int board_id, int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO recommend(board_id, mem_id, nonreco) VALUES(?, ?, 'Y')";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
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
