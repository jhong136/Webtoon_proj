<%@page import = "java.sql.*" %>
<%@page import = "config.DB" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����������(ȸ��������������)</title>
<h1>����������</h1>

</head>
<body>
<%
request.setCharacterEncoding("UTF-8"); //�ѱ��� ������ �ʵ���
//�г���, id, pwd, ����, ����, ����, ���Գ�¥
String driver = "oracle.jdbc.driver.OracleDriver";
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String db_user = "jun";
		String db_password = "database";
		
		Connection con = null;
		Statement stmt = null;		
		ResultSet rs = null;
		//�α��ε� ȸ���� ��� ������ �����´� 
		
		String user_id = (String) session.getAttribute("sessionid");
		String query = "select * from reader where r_id = '" + user_id +"'";
		try {Class.forName(driver);
		System.out.println("����̹� �ε�");} //����̹� �ε� 
		catch(ClassNotFoundException e){e.printStackTrace();} 
		try{con = DriverManager.getConnection(db_url, db_user,db_password); 
		System.out.println("�����ͺ��̽� ���� ����");//�����ͺ��̽� ���� 
		
		stmt = con.createStatement();
		
		rs = stmt.executeQuery(query);
		if(rs != null){
			rs.next();
	
		%>
		
<table width = "500" align = "center" border ="2">
<tr>
<td width = "200" align = "center">�г���</td>
<td width = "200" align = "center"><%= rs.getString("r_nickname") %></td>
</tr>
<tr>
<td width = "200" align = "center">���̵�</td>
<td width = "200" align = "center"><%= rs.getString("r_id") %></td>
</tr>
<tr>
<td width = "200" align = "center">��й�ȣ</td>
<td width = "200" align = "center"><%= rs.getString("r_pwd") %></td>
</tr>
<tr>
<td width = "200" align = "center">����</td>
<td width = "200" align = "center"><%= rs.getString("r_gender") %>
</td>
</tr>
<tr>
<td width = "200" align = "center">�������</td>
<td width = "200" align = "center"><%= rs.getDate("r_birth") %></td>
</tr>
<tr>
<td width = "200" align = "center">������ ����</td>
<td width = "200" align = "center"><%= rs.getInt("r_coin") %></td>
</tr>
<tr>
<td width = "200" align = "center">���Գ�¥</td>
<td width = "200" align = "center"><%= rs.getDate("r_date") %></td>
</tr>
<tr>
<!-- ������ ������ ���� �뿩�� �Ͱ� ������ ���� �������� ����Ʈ�� �ְ��ϱ� -->
<td width = "200" align = "center" colspan = "2" ><input type = "button" name = "purchse_webtoon" value ="������ ���� ���� ����" onclick="location.href='../reader/showbuyWt.jsp'"/></td>
</tr>
<!-- ���ڰ� ���ε��� ���� ����  -->
<tr>
<td width = "200" align = "center" colspan = "2" ><input type = "button"  name = "chanllenge_webtoon" value ="���ε��� ����" onclick="location.href='../reader/showMyCtList.jsp'"/></td>
</tr>
<tr>
<td width = "200" align = "center" colspan = "2" ><input type = "button" name = "purchase_coin" value ="���� ���ų���" onclick="location.href='../reader/buycoin_list.jsp'"/></td>
</tr>
<tr>
<td width = "200" align = "center" colspan = "2" ><input type = "button" name = "regist" value ="���� ���� ���" onclick="location.href='../reader/inputCtoon.jsp'"/></td>
</tr>
<tr>
<td width = "200" align = "center" colspan = "2" ><input type = "submit" name = "exit" value ="ȸ�� Ż��"/></td>
</tr>
</table>

<% 	}
stmt.close();
con.close();
}catch(SQLException e){
	e.printStackTrace();}
		
%>
</body>
</html>