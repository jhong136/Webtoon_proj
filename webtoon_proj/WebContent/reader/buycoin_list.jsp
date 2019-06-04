<%@page import = "java.sql.*" %>
<%@page import = "config.DB" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원님의 코인 총 구매내역</title>
</head>
<body>
<!--마이페이지에서 '코인 구매내역'을 누르면 이 페이지로 넘어온다. 
지금까지 구매한 총 코인 내역을 여기서 확인할 수 있다
buy_coin 테이블을 이용해서 r_nickname을 이용해서 추출한 데이터를 뿌려주면 됨 -->

<% 
Connection con = DB.dbConn(); //코드 합칠 때 이부분만 수정하면돼!
Statement stmt = null;		
ResultSet rs = null;


String user_id = (String) session.getAttribute("sessionid");
String query = "select * from reader where r_id = '" + user_id +"'"; //아이디통해서 닉네임 추출
stmt = con.createStatement();
rs = stmt.executeQuery(query);

if(rs != null){
	rs.next();
	String r_nickname = rs.getString("r_nickname");%>
	
	<h2><%= rs.getString("r_nickname") %>님의 코인 구매내역</h2>
	
	<% 
	String query2 = "select c_num, bonus, bc_date from buy_coin where r_nickname = '" + r_nickname +"'"; //해당 닉네임의 목록 받아옴
	ResultSet rs2 = stmt.executeQuery(query2);
	int i = 1;
	while(rs2.next()){
	
	%>
	<%= i %>.
	<span style="color:blue">구매한 코인 개수 : <%= rs2.getInt("c_num") %> 개</span> 
	<span style="color:green"> 지급된 보너스코인 개수:<%= rs2.getInt("bonus") %>개</span>
	<span style="color:orange">코인 구매날짜:<%= rs2.getTimestamp("bc_date") %></span><br>
	<% i++; %>
	<%
	}}


%>


</body>
</html>