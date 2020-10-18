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

public class ChatLogDBBean {
	private static ChatLogDBBean instance = new ChatLogDBBean();
	
	private ChatLogDBBean() {}
	
	public static ChatLogDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public void insertChatLog(int id, String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO chat_log (chat_content, admin_id) VALUES (?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, id);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
				try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch(SQLException e) {}
		}
	}
	
	public List<ChatLogDataBean> getChats() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ChatLogDataBean> chats = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT chat_id, chat_content, chat_time, a.admin_id, admin_name FROM chat_log c JOIN admin a ON c.admin_id = a.admin_id "
					+ "ORDER BY chat_id";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				chats = new ArrayList<ChatLogDataBean>();
				
				do {
					ChatLogDataBean chat = new ChatLogDataBean();
					chat.setChat_id(rs.getInt(1));
					chat.setChat_content(rs.getString(2));
					chat.setChat_time(rs.getTimestamp(3));
					chat.setAdmin_id(rs.getInt(4));
					chat.setAdmin_name(rs.getString(5));
					
					chats.add(chat);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)
				try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null)
				try { rs.close(); } catch(SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch(SQLException e) {}
		}
		
		return chats;
	}
}
