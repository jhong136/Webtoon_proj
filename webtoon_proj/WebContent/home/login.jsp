<%@ page import="java.sql.*"%>
<%@page import = "config.DB" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta charset="EUC-KR">
<title>로그인 화면</title>
<h3 align = "center" id = "title">로그인 페이지</h3>
<br>
</head>
<style>
#divposition {
position:absolute; top:50%; left:50%; width:200px; height:100px; margin:-50px 0 0 -50px;
}
#title {
position:absolute; top:40%; left:50%; width:200px; height:100px; margin:-50px 0 0 -50px;
}
</style>
<body>
<div id = "divposition">
	<form name="login" method="post">
		<!-- 로그인 후 다음 화면 여기에 적어야함  -->
		<div class="form-group">
			<label for="exampleInputEmail1">id</label> <input type="text"
				class="form-control" name="id" aria-describedby="emailHelp"
				placeholder="아이디를 입력하세요." style="width: 200px;"> <small
				id="emailHelp" class="form-text text-muted"></small>
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Password</label> <input
				type="password" class="form-control" name="password"
				placeholder="비밀번호를 입력하세요." style="width: 200px;">
		</div>

		<button type="submit" class="btn btn-primary" id="btn"
			onclick="btn_click();">로그인</button>
	</form>
	</div>

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



<% 
		PreparedStatement pstmt = null;		
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		Connection con = DB.dbConn();
	
		String id = request.getParameter("id"); //입력받은 값 저장 
		String password = request.getParameter("password");
	
		//입력한 아이디가 존재하면 그 아이디에 해당하는 pwd를 반환 
		String sql = "select r_pwd from reader where r_id ='" + id +"'"; //해당 아이디의 pwd값 추출 
		//sql2는 관리자 아이디일 경우 
		String sql2 = "select m_pwd from manager where m_id ='" + id +"'"; //해당 아이디의 pwd값 추출 
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		if(rs.next()){
		String pw = rs.getString("r_pwd");
		if(password.equals(pw)) //입력한 pw값과 select를 통해 추출한 pw값이 같으면
			result = 1;
		
		}
		
		rs = stmt.executeQuery(sql2);
		//관리자모드 
		if(rs.next()){
			String pw = rs.getString("m_pwd");
			if(password.equals(pw)) //입력한 pw값과 select를 통해 추출한 pw값이 같으면
				result = 2;
			
			}
			
		
		System.out.println("result = " + result ); //확인용/이후에 지울것
		
		if(result == 1){ //해당 id와 pw과 존재하면 true반환
			session.setAttribute("sessionid", id); //세션생성 
			session.setAttribute("sessionpw", password);
			//out.println("<script> function btn_click() {alert('로그인 되었습니다!'); }</script>");
			response.sendRedirect("home.jsp"); //로그인되면 home화면으로 넘어간다 
			
		}
		
		if(result == 2){ //해당 id와 pw과 존재하면 true반환
			session.setAttribute("sessionid", id); //세션생성 
			session.setAttribute("sessionpw", password);
			//out.println("<script> function btn_click() {alert('관리자 모드입니다!'); }</script>");
			response.sendRedirect("../manager/admin.jsp"); //로그인되면 home화면으로 넘어간다 
			
		}
	
	
	
			
		stmt.close(); con.close(); 
		%>
</body>
</html>