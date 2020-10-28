package main.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DeletedContentsDBBean {
	private static DeletedContentsDBBean instance = new DeletedContentsDBBean();
	
	private DeletedContentsDBBean() {}
	
	public static DeletedContentsDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public int deleteBoard(int board_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			
			String sql = "INSERT admin_notice(mem_id, notice_content) SELECT * FROM (SELECT board_userid FROM board "
					+ "WHERE board_id = ?) AS A, (SELECT '관리자에 의해 콘텐츠가 삭제되었습니다. [게시판 # " + board_id + "]') AS B";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "INSERT deleted_nestComment SELECT * FROM" + 
				" (SELECT * FROM nestcomment WHERE com_id IN (SELECT com_id FROM comment WHERE com_bd_id = ?)) AS A," + 
				" (SELECT 'N') AS N";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "INSERT deleted_comment" + 
				" SELECT * FROM (SELECT * FROM comment WHERE com_bd_id = ?) AS A, (SELECT 'N') AS N";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "INSERT deleted_board " + 
				" SELECT * FROM board WHERE board_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "DELETE FROM nestcomment WHERE com_id IN (SELECT com_id FROM comment WHERE com_bd_id = ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "DELETE FROM comment WHERE com_bd_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "DELETE FROM board WHERE board_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
		}
		
		check = check > 0 ? 1 : 0;
		
		return check;
	}
	
	public int deleteComment(int com_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			
			String sql = "INSERT admin_notice(mem_id, notice_content) SELECT * FROM (SELECT com_mem_id FROM comment "
					+ "WHERE com_id = ?) AS A, (SELECT '관리자에 의해 콘텐츠가 삭제되었습니다. [댓글 # " + com_id + "]') AS B";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "INSERT deleted_nestcomment" + 
				" SELECT * FROM (SELECT * FROM nestcomment WHERE com_id = ?) AS A, (SELECT 'N') AS N";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, com_id);
			pstmt.executeUpdate();
			
			pstmt.close();
			sql = "INSERT deleted_comment" + 
				" SELECT * FROM (SELECT * FROM comment WHERE com_id = ?) AS A, (SELECT 'Y') AS Y";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, com_id);
			pstmt.executeUpdate();
			
			pstmt.close();
			sql = "DELETE FROM nestcomment WHERE com_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,com_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "DELETE FROM comment WHERE com_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			
			check = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
		}
		
		check = check > 0 ? 1 : 0;
		
		return check;
	}
	
	public int deleteNestComment(int neCom_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();

			String sql = "INSERT admin_notice(mem_id, notice_content) SELECT * FROM (SELECT mem_id FROM nestcomment "
					+ "WHERE necom_id = ?) AS A, (SELECT '관리자에 의해 콘텐츠가 삭제되었습니다. [리댓 # " + neCom_id + "]') AS B";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, neCom_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "INSERT deleted_nestcomment" + 
				" SELECT * FROM (SELECT * FROM nestcomment WHERE necom_id = ?) AS A, (SELECT 'Y') AS Y";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, neCom_id);
			pstmt.executeUpdate();
			
			pstmt.close();
			sql = "DELETE FROM nestcomment WHERE necom_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, neCom_id);
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
	
	public List<DeletedContentsDataBean> getDeletedBoard() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<DeletedContentsDataBean> list = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT b.board_id, b.board_title, b.board_content, m.mem_id, m.mem_nickname "
					+ "FROM deleted_board b JOIN member m ON b.board_userid = m.mem_id";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<>();
				
				do {
					DeletedContentsDataBean contents = new DeletedContentsDataBean();
					
					contents.setCont_id(rs.getInt(1));
					contents.setCont_title(rs.getString(2));
					contents.setCont_content(rs.getString(3));
					contents.setMem_id(rs.getInt(4));
					contents.setMem_nickname(rs.getString(5));
					
					list.add(contents);
				} while (rs.next());
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
	
	public List<DeletedContentsDataBean> getDeletedComment() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<DeletedContentsDataBean> list = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT c.com_id, c.com_content, m.mem_id, m.mem_nickname "
					+ "FROM deleted_comment c JOIN member m ON c.com_mem_id = m.mem_id WHERE check_wether = 'Y'";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<>();
				
				do {
					DeletedContentsDataBean contents = new DeletedContentsDataBean();
					
					contents.setCont_id(rs.getInt(1));
					contents.setCont_content(rs.getString(2));
					contents.setMem_id(rs.getInt(3));
					contents.setMem_nickname(rs.getString(4));
					
					list.add(contents);
				} while (rs.next());
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
	
	public List<DeletedContentsDataBean> getDeletedNestComment() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<DeletedContentsDataBean> list = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT c.neCom_id, c.reCom_content, m.mem_id, m.mem_nickname "
					+ "FROM deleted_nestcomment c JOIN member m ON c.mem_id = m.mem_id WHERE check_wether = 'Y'";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<>();
				
				do {
					DeletedContentsDataBean contents = new DeletedContentsDataBean();
					
					contents.setCont_id(rs.getInt(1));
					contents.setCont_content(rs.getString(2));
					contents.setMem_id(rs.getInt(3));
					contents.setMem_nickname(rs.getString(4));
					
					list.add(contents);
				} while (rs.next());
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
	
	public int restoreBoard(int board_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			
			String sql = "INSERT admin_notice(mem_id, notice_content) SELECT * FROM (SELECT board_userid FROM deleted_board "
					+ "WHERE board_id = ?) AS A, (SELECT '관리자에 의해 콘텐츠가 복구되었습니다. [게시판 # " + board_id + "]') AS B";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "INSERT board SELECT * FROM deleted_board WHERE board_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "INSERT comment " + 
				"SELECT com_id, com_mem_id, com_bd_id, com_content, " + 
				"com_reco, com_date FROM deleted_comment WHERE com_bd_id = ? AND check_wether = 'N'";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "INSERT nestComment " + 
				"SELECT necom_id, com_id, mem_id, recom_content, recom_date " + 
				"FROM deleted_nestcomment WHERE com_id IN " + 
				"(SELECT com_id FROM comment WHERE com_bd_id = ? AND check_wether = 'N')";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "DELETE FROM deleted_nestcomment WHERE com_id IN (SELECT com_id FROM deleted_comment WHERE com_bd_id = ?) "
					+ "AND check_wether = 'N'";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "DELETE FROM deleted_comment WHERE com_bd_id = ? AND check_wether = 'N'";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "DELETE FROM deleted_board WHERE board_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
		}
		
		check = check > 0 ? 1 : 0;
		
		return check;
	}
	
	public int restoreComment(int com_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			
			String sql = "INSERT admin_notice(mem_id, notice_content) SELECT * FROM (SELECT com_mem_id FROM deleted_comment "
					+ "WHERE com_id = ?) AS A, (SELECT '관리자에 의해 콘텐츠가 복구되었습니다. [댓글 # " + com_id + "]') AS B";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "INSERT comment " + 
				"SELECT com_id, com_mem_id, com_bd_id, com_content, " + 
				"com_reco, com_date FROM deleted_comment WHERE com_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, com_id);
			pstmt.executeUpdate();
			
			pstmt.close();
			
			sql = "INSERT nestcomment " + 
					"SELECT necom_id, com_id, mem_id, recom_content, recom_date " + 
					"FROM deleted_nestcomment WHERE com_id = ? AND check_wether = 'N'";
				
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, com_id);
			pstmt.executeUpdate();
			
			pstmt.close();
			sql = "DELETE FROM deleted_nestcomment WHERE com_id = ? AND check_wether = 'N'";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "DELETE FROM deleted_comment WHERE com_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			
			check = pstmt.executeUpdate();
			check = check > 0 ? 1 : 0;
			
		} catch (SQLIntegrityConstraintViolationException e) {
			ResultSet rs = null;
			
			try {	
				String sql = "SELECT com_bd_id FROM deleted_comment WHERE com_id = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, com_id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next())
					check = rs.getInt(1);
			} catch (Exception e2) {
				e2.printStackTrace();
			} finally {
				if(rs != null)
					try { rs.close(); } catch(SQLException e2) {}
			}
			
		}  catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
		}
		
		return check;
	}
	
	public int restoreNestComment(int neCom_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			
			String sql = "INSERT admin_notice(mem_id, notice_content) SELECT * FROM (SELECT mem_id FROM deleted_nestcomment "
					+ "WHERE necom_id = ?) AS A, (SELECT '관리자에 의해 콘텐츠가 복구되었습니다. [리댓 # " + neCom_id + "]') AS B";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, neCom_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "INSERT nestcomment " + 
					"SELECT necom_id, com_id, mem_id, recom_content, recom_date " + 
					"FROM deleted_nestcomment WHERE necom_id = ?";
				
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, neCom_id);
			pstmt.executeUpdate();
			
			pstmt.close();
			
			sql = "DELETE FROM deleted_nestcomment WHERE necom_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, neCom_id);
			
			check = pstmt.executeUpdate();
			
		} catch (SQLIntegrityConstraintViolationException e) {

			ResultSet rs = null;
			
			try {	
				String sql = "SELECT com_id FROM deleted_nestcomment WHERE necom_id = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, neCom_id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next())
					check = rs.getInt(1);
			} catch (Exception e2) {
				e2.printStackTrace();
			} finally {
				if(rs != null)
					try { rs.close(); } catch(SQLException e2) {}
			}
			
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
	
	public int compleDeleteBoard(int board_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM deleted_nestcomment WHERE com_id IN (SELECT com_id FROM deleted_comment WHERE com_bd_id = ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "DELETE FROM deleted_comment WHERE com_bd_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "DELETE FROM deleted_board WHERE board_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			
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
	
	public int compleDeleteComment(int com_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM deleted_nestcomment WHERE com_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "DELETE FROM deleted_comment WHERE com_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, com_id);
			
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
	
	public int compleDeleteNestComment(int neCom_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM deleted_nestcomment WHERE necom_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, neCom_id);
			
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
