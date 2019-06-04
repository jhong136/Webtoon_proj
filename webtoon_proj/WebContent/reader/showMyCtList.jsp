<%@page import="challengetoon.ChallengeToonDTO"%>
<%@page import="challengetoon.ChallengeToonDAO"%>
<%@page import="java.util.List"%>
<%@page import="reader.ReaderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="inputCEp.jsp" method="post">
	<hr>
		<h2>웹툰 회차 업로드</h2>
	<hr><br>
	
<%
String r_id = (String) session.getAttribute("sessionid");
ReaderDAO dao = new ReaderDAO();
String r_nickname = dao.getNickname(r_id);
List<String> ctList = dao.getCtList(r_nickname);
%>
	<h3>
	회차 업로드할 웹툰 선택<br><br>
	</h3>
<% ChallengeToonDAO ctDao = new ChallengeToonDAO();
	for (int i=0; i<ctList.size(); i++) { 
		ChallengeToonDTO ctDto = new ChallengeToonDTO();
		ctDto = ctDao.getCtByCode(ctList.get(i));
		String title = ctDto.getC_title();%>
		<input type="radio" name="challengetoon" value="<%=ctList.get(i)%>"><%=title%><br>
		<br>	
<% } %>
		<br><br>
		
		<input type="submit" value="선택">
		<input type="reset" value="취소"><br>
	</form>
</body>
</html>