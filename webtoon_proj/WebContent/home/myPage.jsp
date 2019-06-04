<%@page import = "java.sql.*" %>
<%@page import = "config.DB" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>마이페이지(회원정보수정가능)</title>
<h1>마이페이지</h1>

</head>
<body>
<%
request.setCharacterEncoding("UTF-8"); //한글이 깨지지 않도록
//닉네임, id, pwd, 성별, 생일, 코인, 가입날짜
String driver = "oracle.jdbc.driver.OracleDriver";
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String db_user = "jun";
		String db_password = "database";
		
		Connection con = null;
		Statement stmt = null;		
		ResultSet rs = null;
		//로그인된 회원의 모든 정보를 가져온다 
		
		String user_id = (String) session.getAttribute("sessionid");
		String query = "select * from reader where r_id = '" + user_id +"'";
		try {Class.forName(driver);
		System.out.println("드라이버 로딩");} //드라이버 로딩 
		catch(ClassNotFoundException e){e.printStackTrace();} 
		try{con = DriverManager.getConnection(db_url, db_user,db_password); 
		System.out.println("데이터베이스 연결 성공");//데이터베이스 연결 
		
		stmt = con.createStatement();
		
		rs = stmt.executeQuery(query);
		if(rs != null){
			rs.next();
	
		%>
		
<table width = "500" align = "center" border ="2">
<tr>
<td width = "200" align = "center">닉네임</td>
<td width = "200" align = "center"><%= rs.getString("r_nickname") %></td>
</tr>
<tr>
<td width = "200" align = "center">아이디</td>
<td width = "200" align = "center"><%= rs.getString("r_id") %></td>
</tr>
<tr>
<td width = "200" align = "center">비밀번호</td>
<td width = "200" align = "center"><%= rs.getString("r_pwd") %></td>
</tr>
<tr>
<td width = "200" align = "center">성별</td>
<td width = "200" align = "center"><%= rs.getString("r_gender") %>
</td>
</tr>
<tr>
<td width = "200" align = "center">생년월일</td>
<td width = "200" align = "center"><%= rs.getDate("r_birth") %></td>
</tr>
<tr>
<td width = "200" align = "center">보유한 코인</td>
<td width = "200" align = "center"><%= rs.getInt("r_coin") %></td>
</tr>
<tr>
<td width = "200" align = "center">가입날짜</td>
<td width = "200" align = "center"><%= rs.getDate("r_date") %></td>
</tr>
<tr>
<!-- 구매한 내역에 들어가면 대여한 것과 소장한 것을 구분지어 리스트가 있게하기 -->
<td width = "200" align = "center" colspan = "2" ><input type = "button" name = "purchse_webtoon" value ="구매한 웹툰 내역 보기" onclick="location.href='../reader/showbuyWt.jsp'"/></td>
</tr>
<!-- 독자가 업로드한 웹툰 내역  -->
<tr>
<td width = "200" align = "center" colspan = "2" ><input type = "button"  name = "chanllenge_webtoon" value ="업로드한 웹툰" onclick="location.href='../reader/showMyCtList.jsp'"/></td>
</tr>
<tr>
<td width = "200" align = "center" colspan = "2" ><input type = "button" name = "purchase_coin" value ="코인 구매내역" onclick="location.href='../reader/buycoin_list.jsp'"/></td>
</tr>
<tr>
<td width = "200" align = "center" colspan = "2" ><input type = "button" name = "regist" value ="도전 웹툰 등록" onclick="location.href='../reader/inputCtoon.jsp'"/></td>
</tr>
<tr>
<td width = "200" align = "center" colspan = "2" ><input type = "submit" name = "exit" value ="회원 탈퇴"/></td>
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