<%@page import="java.sql.*"%>
<%@page import="java.lang.Math"%>
<%@page import="config.DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<h1>코인 구매내역</h1>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		Connection con = DB.dbConn(); //디비연결 
		Statement stmt = null;
		PreparedStatement pstmt = null; 
		//PreparedStatement pstmt2 = null;
		ResultSet rs = null; 
		ResultSet rs2 = null; ResultSet rs3 = null;
		int c_bonus = 0; //0으로 초기화 (보너스코인)
		int total;

		String coin_num = request.getParameter("coin_num"); //자바변수에 전달받은 코인 개수 넣는다 
		int c_num = Integer.parseInt(coin_num); //문자형으로 받아왔으므로 int로 형변환한다 (db에 number형임) (구매할 코인 개수)
		String user_id = (String) session.getAttribute("sessionid"); //지금 로그인해있는 계정의 id
		
		String query = "select c_price from coin where c_num = '" + c_num + "'"; //코인가격 추출 
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);

		if (c_num >= 50) {//한 번에 50개 이상 구매하면 구매한 코인의 10퍼센트를 보너스 코인(c_bonus)으로 추가 지급한다.
			c_bonus = Integer.parseInt(String.valueOf(Math.round(c_num * 0.1))); //int형으로 변환해서 저장 

		}
		
		String query2 = "select r_coin from reader where r_id = '" + user_id + "'"; //독자가 보유한 코인 추출 (아직 반영안됨)
		Statement stmt2 = con.createStatement();
		rs2 = stmt2.executeQuery(query2);
		while(rs2.next()){
		total = rs2.getInt("r_coin") + c_num + c_bonus; //독자가 보유한 총 코인 개수 (결제내역 반영)
		//System.out.println("보유한 코인 개수=" + total);
		
		
		
		while (rs.next()) {
			
	%>

	<table width="500" align="center" border="2">
		<tr>
			<td width="200" align="center">아이디</td>
			<td width="200" align="center"><%=user_id%></td>
		</tr>
		<tr>
			<td width="200" align="center">구매한 코인 개수</td>
			<td width="200" align="center"><%=c_num%>개</td>
		</tr>
		<tr>
			<td width="200" align="center">결제한 가격</td>
			<td width="200" align="center"><%=rs.getInt("c_price")%>원</td>
		</tr>
		<tr>
			<td width="200" align="center">보너스코인</td>
			<td width="200" align="center"><%=c_bonus%>개</td>
		</tr>
		
		<tr>
			<td width="200" align="center">현재 보유한 코인</td>
			<td width="200" align="center"><%= total %>개</td>
		</tr>
	</table>

	<%
	
		}
		String sql2 = "update reader set r_coin = ? where r_id = ?"; //reader테이블에 구매한 coin(total)반영하기 
		pstmt = con.prepareStatement(sql2);
		pstmt.setInt(1, total);
		pstmt.setString(2, user_id);
		pstmt.executeUpdate();
		pstmt.close();
		
		String query3 = "select r_nickname from reader where r_id = '" + user_id + "'"; //아이디를 통해 닉네임 추출
		Statement stmt3 = con.createStatement();
		rs3 = stmt3.executeQuery(query3);
		
		while(rs3.next()){
			
		
		String sql = "insert into buy_coin values(?,?,?,sysdate)"; //buy_coin 테이블에 insert (구매내역 테이블임)
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, rs3.getString("r_nickname")); // 닉네임 넣어줘야함 
		pstmt.setInt(2, c_num);
		pstmt.setInt(3, c_bonus);
		pstmt.executeUpdate();
		
		
		}
		}
		
		
		stmt.close();
		pstmt.close();
		con.close();
		rs.close(); rs2.close(); rs3.close();
		
		
	%>
</body>
</html>