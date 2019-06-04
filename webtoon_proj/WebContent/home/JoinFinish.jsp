<%@page import = "java.sql.*" %>
<%@page import = "java.text.SimpleDateFormat" %>
<%@page import = "java.util.Date" %>
<%@page import = "java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset= UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="UTF-8">
<title>회원가입 정보를 DB에 저장</title>
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
		PreparedStatement pstmt = null;		
		try {Class.forName(driver);
		System.out.println("드라이버 로딩");} //드라이버 로딩 
		catch(ClassNotFoundException e){e.printStackTrace();} 
		try{con = DriverManager.getConnection(db_url, db_user,db_password); 
		System.out.println("데이터베이스 연결 성공");//데이터베이스 연결 
String sql = "insert into reader values(?,?,?,?,TO_DATE(?,'YYYY-MM-DD'),?, ?)";
String nickname = request.getParameter("nickname");
String id = request.getParameter("id");
String password = request.getParameter("password");
String gender = request.getParameter("gender");
String date = request.getParameter("date");
pstmt = con.prepareStatement(sql);
pstmt.setString(1,nickname);
pstmt.setString(2,id);
pstmt.setString(3,password);
pstmt.setString(4, gender);
pstmt.setString(5, date);
pstmt.setDate(6, java.sql.Date.valueOf(java.time.LocalDate.now()));  //현재날짜 
pstmt.setInt(7, 0);
pstmt.execute(); 
pstmt.close();
//response.sendRedirect("login.jsp"); //회원 추가 후 login.jsp로 가기
}catch(SQLException e){
	e.printStackTrace();}
		
%>

<br><br>
<h2>가입을 축하드립니다.</h2><br><br>

<a class="btn btn-outline-primary" href="login.jsp" role="button">로그인하기</a>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>