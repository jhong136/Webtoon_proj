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
<title>�α��� ȭ��</title>
<h3 align = "center" id = "title">�α��� ������</h3>
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
		<!-- �α��� �� ���� ȭ�� ���⿡ �������  -->
		<div class="form-group">
			<label for="exampleInputEmail1">id</label> <input type="text"
				class="form-control" name="id" aria-describedby="emailHelp"
				placeholder="���̵� �Է��ϼ���." style="width: 200px;"> <small
				id="emailHelp" class="form-text text-muted"></small>
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Password</label> <input
				type="password" class="form-control" name="password"
				placeholder="��й�ȣ�� �Է��ϼ���." style="width: 200px;">
		</div>

		<button type="submit" class="btn btn-primary" id="btn"
			onclick="btn_click();">�α���</button>
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
	
		String id = request.getParameter("id"); //�Է¹��� �� ���� 
		String password = request.getParameter("password");
	
		//�Է��� ���̵� �����ϸ� �� ���̵� �ش��ϴ� pwd�� ��ȯ 
		String sql = "select r_pwd from reader where r_id ='" + id +"'"; //�ش� ���̵��� pwd�� ���� 
		//sql2�� ������ ���̵��� ��� 
		String sql2 = "select m_pwd from manager where m_id ='" + id +"'"; //�ش� ���̵��� pwd�� ���� 
		
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		if(rs.next()){
		String pw = rs.getString("r_pwd");
		if(password.equals(pw)) //�Է��� pw���� select�� ���� ������ pw���� ������
			result = 1;
		
		}
		
		rs = stmt.executeQuery(sql2);
		//�����ڸ�� 
		if(rs.next()){
			String pw = rs.getString("m_pwd");
			if(password.equals(pw)) //�Է��� pw���� select�� ���� ������ pw���� ������
				result = 2;
			
			}
			
		
		System.out.println("result = " + result ); //Ȯ�ο�/���Ŀ� �����
		
		if(result == 1){ //�ش� id�� pw�� �����ϸ� true��ȯ
			session.setAttribute("sessionid", id); //���ǻ��� 
			session.setAttribute("sessionpw", password);
			//out.println("<script> function btn_click() {alert('�α��� �Ǿ����ϴ�!'); }</script>");
			response.sendRedirect("home.jsp"); //�α��εǸ� homeȭ������ �Ѿ�� 
			
		}
		
		if(result == 2){ //�ش� id�� pw�� �����ϸ� true��ȯ
			session.setAttribute("sessionid", id); //���ǻ��� 
			session.setAttribute("sessionpw", password);
			//out.println("<script> function btn_click() {alert('������ ����Դϴ�!'); }</script>");
			response.sendRedirect("../manager/admin.jsp"); //�α��εǸ� homeȭ������ �Ѿ�� 
			
		}
	
	
	
			
		stmt.close(); con.close(); 
		%>
</body>
</html>