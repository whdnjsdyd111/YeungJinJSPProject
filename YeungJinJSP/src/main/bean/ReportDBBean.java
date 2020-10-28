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

public class ReportDBBean {
	private static ReportDBBean instance = new ReportDBBean();
	
	private ReportDBBean() {}
	
	public static ReportDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/yjfb"); 
		return ds.getConnection();
	}
	
	public int insertReport(String rep_content, int cont_id, String cont_kind, int rep_kind, int mem_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO report(rep_content, cont_id, cont_kind, rep_kind_id, mem_id) VALUES(?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rep_content);
			pstmt.setInt(2, cont_id);
			pstmt.setString(3, cont_kind);
			pstmt.setInt(4, rep_kind);
			pstmt.setInt(5, mem_id);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null)
				try { conn.close(); } catch (SQLException e) {}
			if(pstmt != null)
				try { pstmt.close(); } catch (SQLException e) {}
		}
		
		return check;
	}
	
	public List<ReportDataBean> getReportList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReportDataBean> list = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT r.rep_id, m.mem_id, r.rep_content, r.rep_date, r.cont_id, r.cont_kind, m.mem_nickname, k.rep_kind_name "
					+ "FROM report r JOIN member m JOIN report_kind k ON r.mem_id = m.mem_id AND r.rep_kind_id = k.rep_kind_id "
					+ "ORDER BY rep_date ASC";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<>();
				
				do {
					ReportDataBean report = new ReportDataBean();
					
					report.setRep_id(rs.getInt(1));
					report.setMem_id(rs.getInt(2));
					report.setRep_content(rs.getString(3));
					report.setRep_date(rs.getTimestamp(4));
					report.setCont_id(rs.getInt(5));
					report.setCont_kind(rs.getByte(6));
					report.setMem_nickname(rs.getString(7));
					report.setRep_kind_name(rs.getString(8));
					
					list.add(report);
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
	
	public int deleteReport(int rep_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			String sql = "DELETE FROM report WHERE rep_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rep_id);
			
			check = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return check;
	}
}
