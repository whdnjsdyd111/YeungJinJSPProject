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

public class NoticeDBBean {
	private static NoticeDBBean instance = new NoticeDBBean();
	
	private NoticeDBBean() {}
	
	public static NoticeDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public List<NoticeDataBean> getNoticeList(int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NoticeDataBean> list = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * FROM notice WHERE mem_id = ? ORDER BY notice_date DESC";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<>();
				
				do {
					NoticeDataBean notice = new NoticeDataBean();
					
					notice.setMem_id(rs.getInt(1));
					notice.setBoard_id(rs.getInt(2));
					notice.setKind_id(rs.getInt(3));
					notice.setNotice_content(rs.getString(4));
					notice.setNotice_number(rs.getInt(5));
					notice.setNotice_date(rs.getTimestamp(6));
					
					list.add(notice);
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
		
		return list;
	}
	
	public int deleteAll(int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM notice WHERE mem_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			
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
	
	public int deleteNotice(int mem_id, int board_id, int kind_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM notice WHERE mem_id = ? AND board_id = ? AND kind_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			pstmt.setInt(2, board_id);
			pstmt.setInt(3, kind_id);
			
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
	
	public int insertCommentNotice(int board_id, int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "SELECT board_userid FROM board WHERE board_id = ? AND board_userid = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			pstmt.setInt(2, mem_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				check = 0;
			} else {
				sql = "UPDATE notice SET notice_number = notice_number + 1, notice_date = CURRENT_TIMESTAMP "
						+ "WHERE mem_id = (SELECT board_userid FROM board WHERE board_id = ?) AND board_id = ? AND kind_id = 100";
				
				pstmt.close();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, board_id);
				pstmt.setInt(2, board_id);
				
				check = pstmt.executeUpdate();

				if(check == 0) {
					sql = "INSERT INTO notice(mem_id, board_id, kind_id, notice_content) VALUES ("
							+ "(SELECT board_userid FROM board WHERE board_id = ?) "
							+ ", ?, 100, "
							+ "(SELECT INSERT(board_title, 14, CHAR_LENGTH(board_title), '..') FROM board WHERE board_id = ?))";
					
					pstmt.close();
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, board_id);
					pstmt.setInt(2, board_id);
					pstmt.setInt(3, board_id);
					
					check = pstmt.executeUpdate();
				}
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
		
		return check;
	}
	
	public int insertNestCommentNotice(int target_mem_id, int board_id, int mem_id, String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = 0;

		if(content.length() > 5) {
			content = content.substring(0, 5) + "..";
		}
		
		content = " " + content;
		
		if(target_mem_id == mem_id)
			return check;
		
		try {
			conn = getConnection();
			String sql = "UPDATE notice SET notice_number = notice_number + 1, notice_date = CURRENT_TIMESTAMP, "
					+ "notice_content = (SELECT CONCAT('[', (SELECT CASE WHEN CHAR_LENGTH(mem_nickname) > 3 "
					+ "THEN CONCAT(SUBSTRING(mem_nickname, 1, 3), '..') ELSE mem_nickname END "
					+ "FROM member WHERE mem_id = ?), ']', ?) AS A) "
					+ "WHERE mem_id = ? AND board_id = ? AND kind_id = 200";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			pstmt.setString(2, content);
			pstmt.setInt(3, target_mem_id);
			pstmt.setInt(4, board_id);
			
			check = pstmt.executeUpdate();
			
			if(check == 0) {
				sql = "INSERT INTO notice(mem_id, board_id, kind_id, notice_content) "
						+ "VALUES(?, ?, 200, "
						+ "(SELECT CONCAT('[', (SELECT CASE WHEN CHAR_LENGTH(mem_nickname) > 3 "
						+ "THEN CONCAT(SUBSTRING(mem_nickname, 1, 3), '..') ELSE mem_nickname END "
						+ "FROM member WHERE mem_id = ?), ']', ?) AS A)"
						+ ")";
				
				pstmt.close();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, target_mem_id);
				pstmt.setInt(2, board_id);
				pstmt.setInt(3, mem_id);
				pstmt.setString(4, content);
				
				check = pstmt.executeUpdate();
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
		
		return check;
	}
}
