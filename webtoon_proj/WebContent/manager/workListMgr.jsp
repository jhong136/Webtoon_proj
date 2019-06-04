<%@page import="webtoon.WebtoonDAO"%>
<%@page import="webtoon.WebtoonDTO"%>
<%@page import="java.util.List"%>
<%@page import="manager.ManagerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="adminHeader.jsp" flush="false"/>
	<form action="inputTEp.jsp" method="post">
	<hr>
		<h2>웹툰 회차 업로드</h2>
	<hr><br>
	
<%
String mgr_id = (String) session.getAttribute("sessionid");
ManagerDAO dao = new ManagerDAO();
String m_code = dao.getMgrCode(mgr_id);
List<String> wtList = dao.getWtList(m_code);
%>
	<h3>
	회차 업로드할 웹툰 선택<br><br>
	</h3>
<% WebtoonDAO wtDao = new WebtoonDAO();
	for (int i=0; i<wtList.size(); i++) { 
		WebtoonDTO wtDto = new WebtoonDTO();
		wtDto = wtDao.getWtByCode(wtList.get(i));
		String title = wtDto.getT_title();%>
		<input type="radio" name="webtoon" value="<%=wtList.get(i)%>"><%=title%><br>
		<br>	
<% } %>
		<br><br>
		
		<input type="submit" value="선택">
		<input type="reset" value="취소"><br>
	</form>
</body>
</html>