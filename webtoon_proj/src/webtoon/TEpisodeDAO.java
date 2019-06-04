package webtoon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import config.DB;

public class TEpisodeDAO {
	public List<TEpisodeDTO> getTEpList(String t_code) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TEpisodeDTO> list = new ArrayList<>();

		try {
			con = DB.dbConn();
			String sql = "select * from t_episode where t_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, t_code);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TEpisodeDTO dto = new TEpisodeDTO();
				dto.setT_code(rs.getString("t_code"));
				dto.setT_no(rs.getInt("t_no"));
				dto.setT_name(rs.getString("t_name"));
				dto.setT_grade(rs.getInt("t_grade"));
				dto.setT_content(rs.getString("t_content"));
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public void addEp(TEpisodeDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DB.dbConn();	
			String sql1 = "insert into t_episode(t_code,t_no,t_name,t_grade,t_content) values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, dto.getT_code());
			pstmt.setInt(2, dto.getT_no());
			pstmt.setString(3, dto.getT_name());
			pstmt.setInt(4, dto.getT_grade());			
			pstmt.setString(5, dto.getT_content());
			pstmt.executeQuery();			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			try {
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public TEpisodeDTO getEp(String t_code, int t_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		TEpisodeDTO dto = new TEpisodeDTO();

		try {
			con = DB.dbConn();
			String sql = "select * from t_episode where t_code=? and t_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, t_code);
			pstmt.setInt(2, t_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto.setT_code(rs.getString("t_code"));
				dto.setT_no(rs.getInt("t_no"));
				dto.setT_name(rs.getString("t_name"));
				
				dto.setT_content(rs.getString("t_content"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	public int getCount(String t_code) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int cnt = 0;

		try {
			con = DB.dbConn();
			String sql = "select count(*) from t_episode where t_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, t_code);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public Date getEndDate(String r_nickname, String t_code, int t_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Date endDate = null;

		try {
			con = DB.dbConn();
			String sql = "select end_date from rent where r_nickname=? and t_code=? and t_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, r_nickname);
			pstmt.setString(2, t_code);
			pstmt.setInt(3, t_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				endDate = rs.getDate("end_date");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return endDate;
	}
}
