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
<h1>���� ���ų���</h1>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		Connection con = DB.dbConn(); //��񿬰� 
		Statement stmt = null;
		PreparedStatement pstmt = null; 
		//PreparedStatement pstmt2 = null;
		ResultSet rs = null; 
		ResultSet rs2 = null; ResultSet rs3 = null;
		int c_bonus = 0; //0���� �ʱ�ȭ (���ʽ�����)
		int total;

		String coin_num = request.getParameter("coin_num"); //�ڹٺ����� ���޹��� ���� ���� �ִ´� 
		int c_num = Integer.parseInt(coin_num); //���������� �޾ƿ����Ƿ� int�� ����ȯ�Ѵ� (db�� number����) (������ ���� ����)
		String user_id = (String) session.getAttribute("sessionid"); //���� �α������ִ� ������ id
		
		String query = "select c_price from coin where c_num = '" + c_num + "'"; //���ΰ��� ���� 
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);

		if (c_num >= 50) {//�� ���� 50�� �̻� �����ϸ� ������ ������ 10�ۼ�Ʈ�� ���ʽ� ����(c_bonus)���� �߰� �����Ѵ�.
			c_bonus = Integer.parseInt(String.valueOf(Math.round(c_num * 0.1))); //int������ ��ȯ�ؼ� ���� 

		}
		
		String query2 = "select r_coin from reader where r_id = '" + user_id + "'"; //���ڰ� ������ ���� ���� (���� �ݿ��ȵ�)
		Statement stmt2 = con.createStatement();
		rs2 = stmt2.executeQuery(query2);
		while(rs2.next()){
		total = rs2.getInt("r_coin") + c_num + c_bonus; //���ڰ� ������ �� ���� ���� (�������� �ݿ�)
		//System.out.println("������ ���� ����=" + total);
		
		
		
		while (rs.next()) {
			
	%>

	<table width="500" align="center" border="2">
		<tr>
			<td width="200" align="center">���̵�</td>
			<td width="200" align="center"><%=user_id%></td>
		</tr>
		<tr>
			<td width="200" align="center">������ ���� ����</td>
			<td width="200" align="center"><%=c_num%>��</td>
		</tr>
		<tr>
			<td width="200" align="center">������ ����</td>
			<td width="200" align="center"><%=rs.getInt("c_price")%>��</td>
		</tr>
		<tr>
			<td width="200" align="center">���ʽ�����</td>
			<td width="200" align="center"><%=c_bonus%>��</td>
		</tr>
		
		<tr>
			<td width="200" align="center">���� ������ ����</td>
			<td width="200" align="center"><%= total %>��</td>
		</tr>
	</table>

	<%
	
		}
		String sql2 = "update reader set r_coin = ? where r_id = ?"; //reader���̺� ������ coin(total)�ݿ��ϱ� 
		pstmt = con.prepareStatement(sql2);
		pstmt.setInt(1, total);
		pstmt.setString(2, user_id);
		pstmt.executeUpdate();
		pstmt.close();
		
		String query3 = "select r_nickname from reader where r_id = '" + user_id + "'"; //���̵� ���� �г��� ����
		Statement stmt3 = con.createStatement();
		rs3 = stmt3.executeQuery(query3);
		
		while(rs3.next()){
			
		
		String sql = "insert into buy_coin values(?,?,?,sysdate)"; //buy_coin ���̺� insert (���ų��� ���̺���)
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, rs3.getString("r_nickname")); // �г��� �־������ 
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