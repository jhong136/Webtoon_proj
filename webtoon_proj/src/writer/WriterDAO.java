package writer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.DB;

public class WriterDAO {
	public List<WriterDTO> getwrtList() {
		List<WriterDTO> wrtList = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = DB.dbConn();	
			String sql = "select * from writer";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();			
			while (rs.next()) {
				WriterDTO dto = new WriterDTO();
				dto.setW_name(rs.getString("w_name"));
				dto.setW_realname(rs.getString("w_realname"));
				dto.setW_mail(rs.getString("w_mail"));
				dto.setW_phone(rs.getString("w_phone"));
				wrtList.add(dto);
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
		return wrtList;
	}
}
