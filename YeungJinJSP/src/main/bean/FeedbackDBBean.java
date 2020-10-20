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

public class FeedbackDBBean {
	private static FeedbackDBBean instance = new FeedbackDBBean();
	
	private FeedbackDBBean() {}
	
	public static FeedbackDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public int insertFeedback(String email, String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO feedback (feed_email, feed_content) VALUES(?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, content);
			
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
	
	public int deleteFeedback(int feed_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM feedback WHERE feed_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, feed_id);
			
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
	
	public List<FeedbackDataBean> getNonProcessedFeedbacks() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FeedbackDataBean> list = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM feedback WHERE feed_pro = 'N'";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<>();
				
				do {
					FeedbackDataBean feedback = new FeedbackDataBean();
					
					feedback.setFeed_id(rs.getInt(1));
					feedback.setFeed_email(rs.getString(2));
					feedback.setFeed_content(rs.getString(3));
					feedback.setFeed_date(rs.getTimestamp(4));
					feedback.setFeed_pro(rs.getByte(5));
					
					list.add(feedback);
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
	
	public List<FeedbackDataBean> getProcessedFeedbacks() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FeedbackDataBean> list = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM feedback WHERE feed_pro = 'Y'";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<>();
				
				do {
					FeedbackDataBean feedback = new FeedbackDataBean();
					
					feedback.setFeed_id(rs.getInt(1));
					feedback.setFeed_email(rs.getString(2));
					feedback.setFeed_content(rs.getString(3));
					feedback.setFeed_date(rs.getTimestamp(4));
					feedback.setFeed_pro(rs.getByte(5));
					
					list.add(feedback);
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
	
	public int changePro(int feed_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "UPDATE feedback SET feed_pro = 'Y' WHERE feed_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, feed_id);
			
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
