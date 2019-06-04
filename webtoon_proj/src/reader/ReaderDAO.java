package reader;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.DB;
import webtoon.TEpisodeDTO;

public class ReaderDAO {
	public String getNickname(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String str = null;
		
		try {
			con = DB.dbConn();	
			String sql = "select r_nickname from reader where r_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();			
			while (rs.next()) {
				str = rs.getString("r_nickname");
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
	
	public List<TEpisodeDTO> getBuyEp(String nickname, String t_code) {
		List<TEpisodeDTO> epList = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		TEpisodeDTO dto = new TEpisodeDTO();
		
		try {
			con = DB.dbConn();	
			String sql = "select * from t_episode where t_code=? and t_no in (select t_no from buy where r_nickname=?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, t_code);
			pstmt.setString(2, nickname);
			rs = pstmt.executeQuery();			
			while (rs.next()) {
				dto.setT_code(rs.getString("t_code"));
				dto.setT_no(rs.getInt("t_no"));
				dto.setT_name(rs.getString("t_name"));
				dto.setT_content(rs.getString("t_content"));
				epList.add(dto);
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
		return epList;
	}
	
	
	public List<TEpisodeDTO> getRentEp(String nickname, String t_code) {
		List<TEpisodeDTO> epList = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		TEpisodeDTO dto = new TEpisodeDTO();
		
		try {
			con = DB.dbConn();	
			String sql = "select * from t_episode where t_code=? and t_no in (select t_no from rent where r_nickname=?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, t_code);
			pstmt.setString(2, nickname);
			rs = pstmt.executeQuery();			
			while (rs.next()) {
				dto.setT_code(rs.getString("t_code"));
				dto.setT_no(rs.getInt("t_no"));
				dto.setT_name(rs.getString("t_name"));
				dto.setT_content(rs.getString("t_content"));
				epList.add(dto);
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
		return epList;
	}
	
	public List<String> getWtList(String nickname) {
		List<String> wtCodeList = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DB.dbConn();	
			String sql = "select t_code from buy where r_nickname=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();			
			while (rs.next()) {
				String str = rs.getString("t_code");
				wtCodeList.add(str);
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
		return wtCodeList;
	}
	
	public List<String> getCtList(String nickname) {
		List<String> ctCodeList = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DB.dbConn();	
			String sql = "select c_code from challengetoon where r_nickname=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();			
			while (rs.next()) {
				String str = rs.getString("c_code");
				ctCodeList.add(str);
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
		return ctCodeList;
	}
	
	public void buyTEp(String r_nickname, String t_code, int t_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DB.dbConn();	
			String sql1 = "insert into buy(r_nickname,t_code,t_no,b_date) values(?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, r_nickname);
			pstmt.setString(2, t_code);
			pstmt.setInt(3, t_no);
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
	
	public void rentTEp(String r_nickname, String t_code, int t_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DB.dbConn();	
			String sql1 = "insert into rent(r_nickname,t_code,t_no,start_date,end_date) values(?,?,?,sysdate,sysdate+3)";
			pstmt = con.prepareStatement(sql1);
			pstmt.setString(1, r_nickname);
			pstmt.setString(2, t_code);
			pstmt.setInt(3, t_no);
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
	
	public void decCoin(String r_nickname, int r_coin) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DB.dbConn();	
			String sql1 = "update reader set r_coin=? where r_nickname=?";
			pstmt = con.prepareStatement(sql1);
			pstmt.setInt(1, r_coin);
			pstmt.setString(2, r_nickname);
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
	
	public int getCoin(String r_nickname) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int coin = 0;
		
		try {
			con = DB.dbConn();	
			String sql = "select r_coin from reader where r_nickname=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, r_nickname);
			rs = pstmt.executeQuery();			
			while (rs.next()) {
				coin = rs.getInt("r_coin");
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
		return coin;
	}
}
