package challengetoon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import config.DB;

public class ChallengeToonDAO {
	public void addCtoon(ChallengeToonDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DB.dbConn();	
			String sql1 = "insert into challengetoon(c_code,c_title,c_genre,c_intro,c_img,c_mark,r_nickname)\r\n values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, dto.getC_code());
			pstmt.setString(2, dto.getC_title());
			pstmt.setString(3, dto.getC_genre());
			pstmt.setString(4, dto.getC_intro());			
			pstmt.setString(5, dto.getC_img());
			pstmt.setString(6, dto.getC_mark());
			pstmt.setString(7, dto.getR_nickName());
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
	
	public List<ChallengeToonDTO> getCtList() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<ChallengeToonDTO> list = new ArrayList<>();
		
		try {
			con = DB.dbConn();	
			String sql = "select * from challengetoon";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);			
			while (rs.next()) {
				ChallengeToonDTO dto = new ChallengeToonDTO();
				dto.setC_code(rs.getString("c_code"));
				dto.setC_title(rs.getString("c_title"));
				dto.setC_genre(rs.getString("c_genre"));
				dto.setC_intro(rs.getString("c_intro"));
				dto.setC_img(rs.getString("c_img"));
				dto.setC_mark(rs.getString("c_mark"));
				dto.setR_nickName(rs.getString("r_nickname"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (stmt != null)
					stmt.close();
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
	
	public ChallengeToonDTO getCtByCode(String code) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ChallengeToonDTO dto = new ChallengeToonDTO();
		
		try {
			con = DB.dbConn();	
			String sql = "select * from challengetoon where c_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();			
			while (rs.next()) {
				dto.setC_code(rs.getString("c_code"));
				dto.setC_title(rs.getString("c_title"));
				dto.setC_genre(rs.getString("c_genre"));
				dto.setC_intro(rs.getString("c_intro"));
				dto.setC_img(rs.getString("c_img"));
				dto.setC_mark(rs.getString("c_mark"));
				dto.setR_nickName(rs.getString("r_nickname"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
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
	
	public String getCodeByTitle(String title) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		String c_code = null;
		
		try {
			con = DB.dbConn();	
			String sql = "select c_code from challengetoon where c_title=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			rs = pstmt.executeQuery();			
			while (rs.next()) {
				c_code = rs.getString("c_code");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
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
		return c_code;
	}
	
//	public ChallengeToonDTO getCtByNic(String r_nickname) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		ChallengeToonDTO dto = new ChallengeToonDTO();
//		
//		try {
//			con = DB.dbConn();	
//			String sql = "select * from challengetoon where r_nickname=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, r_nickname);
//			rs = pstmt.executeQuery();			
//			while (rs.next()) {
//				dto.setC_code(rs.getString("c_code"));
//				dto.setC_title(rs.getString("c_title"));
//				dto.setC_genre(rs.getString("c_genre"));
//				dto.setC_intro(rs.getString("c_intro"));
//				dto.setC_img(rs.getString("c_img"));
//				dto.setC_mark(rs.getString("c_mark"));
//				dto.setR_nickName(rs.getString("r_nickname"));
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) rs.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			try {
//				if (pstmt != null)
//					pstmt.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			try {
//				if (con != null)
//					con.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return dto;
//	}
}
