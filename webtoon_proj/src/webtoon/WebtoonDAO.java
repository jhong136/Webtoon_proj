package webtoon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.DB;

public class WebtoonDAO {
	public void addWtoon(WebtoonDTO dto, String m_code) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DB.dbConn();	
			String sql1 = "insert into webtoon(t_code,t_title,t_genre,t_intro,t_img,t_age) values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, dto.getT_code());
			pstmt.setString(2, dto.getT_title());
			pstmt.setString(3, dto.getT_genre());
			pstmt.setString(4, dto.getT_intro());			
			pstmt.setString(5, dto.getT_img());
			pstmt.setString(6, dto.getT_age());
			pstmt.executeQuery();
			
			String sql2 = "insert into t_day(day_name,t_code) values(?,?)";
			for (int i = 0; i < dto.getnDays(); i++) {
				pstmt = con.prepareStatement(sql2);
				pstmt.setString(1, dto.getDays()[i]);
				pstmt.setString(2, dto.getT_code());
				pstmt.executeQuery();
			}
			
			String sql3 = "insert into toon_writer(t_code,w_name) values(?,?)";
			for (int i=0; i<dto.getnWriters(); i++) {
				pstmt = con.prepareStatement(sql3);
				pstmt.setString(1, dto.getT_code());
				pstmt.setString(2, dto.getWriters()[i]);
				pstmt.executeQuery();
			}
			
			String sql4 = "insert into work(t_code,w_name,m_code) values(?,?,?)";
			for (int i=0; i<dto.getnWriters(); i++) {
				pstmt = con.prepareStatement(sql4);
				pstmt.setString(1, dto.getT_code());
				pstmt.setString(2, dto.getWriters()[i]);
				pstmt.setString(3, m_code);
				pstmt.executeQuery();
			}
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
	
	public List<WebtoonDTO> getWtoonByDay(String day) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<WebtoonDTO> list = new ArrayList<>();
		
		try {
			con = DB.dbConn();	
			String sql = "select * from webtoon where t_code in (select t_code from t_day where day_name = ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, day);
			rs = pstmt.executeQuery();			
			while (rs.next()) {
				WebtoonDTO dto = new WebtoonDTO();
				dto.setT_code(rs.getString("t_code"));
				dto.setT_title(rs.getString("t_title"));
				dto.setT_genre(rs.getString("t_genre"));
				dto.setT_intro(rs.getString("t_intro"));
				dto.setT_img(rs.getString("t_img"));
				dto.setT_age(rs.getString("t_age"));
				
				dto.setWriters(findWriters(dto.getT_code()));
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
	
	public WebtoonDTO getWtByCode(String code) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		WebtoonDTO dto = new WebtoonDTO();
		
		try {
			con = DB.dbConn();	
			String sql = "select * from webtoon where t_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();			
			while (rs.next()) {
				dto.setT_code(rs.getString("t_code"));
				dto.setT_title(rs.getString("t_title"));
				dto.setT_genre(rs.getString("t_genre"));
				dto.setT_intro(rs.getString("t_intro"));
				dto.setT_img(rs.getString("t_img"));
				dto.setT_age(rs.getString("t_age"));
				
				dto.setWriters(findWriters(dto.getT_code()));			
				dto.setDays(findDays(dto.getT_code()));
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
			
		String t_code = null;
		
		try {
			con = DB.dbConn();	
			String sql = "select t_code from webtoon where t_title=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			rs = pstmt.executeQuery();			
			while (rs.next()) {
				t_code = rs.getString("t_code");
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
		return t_code;
	}
	
	public String[] findWriters(String code) {
		String[] str = null;
		int n = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DB.dbConn();	
			String sql = "select count(*) from toon_writer where t_code = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				n = rs.getInt(1);
			}
			
			str = new String[n];
			int i = 0;
			sql = "select w_name from toon_writer where t_code = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				str[i] = rs.getString(1);
				i++;
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
		return str;
	}
	
	public String[] findDays(String code) {
		String[] str = null;
		int n = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DB.dbConn();	
			String sql = "select count(*) from t_day where t_code = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				n = rs.getInt(1);
			}
			
			str = new String[n];
			int i = 0;
			sql = "select day_name from t_day where t_code = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				str[i] = rs.getString(1);
				i++;
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
		return str;
	}
}
