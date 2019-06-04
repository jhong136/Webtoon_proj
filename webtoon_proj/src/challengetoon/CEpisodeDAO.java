package challengetoon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.DB;
import webtoon.TEpisodeDTO;

public class CEpisodeDAO {
	public List<CEpisodeDTO> getCEpList(String c_code) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CEpisodeDTO> list = new ArrayList<>();

		try {
			con = DB.dbConn();
			String sql = "select * from c_episode where c_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c_code);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CEpisodeDTO dto = new CEpisodeDTO();
				dto.setC_code(rs.getString("c_code"));
				dto.setC_no(rs.getInt("c_no"));
				dto.setC_name(rs.getString("c_name"));
				dto.setC_grade(rs.getInt("c_grade"));
				dto.setC_content(rs.getString("c_content"));
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
	
	public void addEp(CEpisodeDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DB.dbConn();	
			String sql1 = "insert into c_episode(c_code,c_no,c_name,c_grade,c_content) values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, dto.getC_code());
			pstmt.setInt(2, dto.getC_no());
			pstmt.setString(3, dto.getC_name());
			pstmt.setInt(4, dto.getC_grade());			
			pstmt.setString(5, dto.getC_content());
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
	
	public CEpisodeDTO getEp(String c_code, int c_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		CEpisodeDTO dto = new CEpisodeDTO();

		try {
			con = DB.dbConn();
			String sql = "select * from c_episode where c_code=? and c_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c_code);
			pstmt.setInt(2, c_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto.setC_code(rs.getString("c_code"));
				dto.setC_no(rs.getInt("c_no"));
				dto.setC_name(rs.getString("c_name"));
				dto.setC_grade(rs.getInt("c_grade"));
				dto.setC_content(rs.getString("c_content"));
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
}
