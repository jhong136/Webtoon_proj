<%@page import="webtoon.WebtoonDTO"%>
<%@page import="webtoon.WebtoonDAO"%>
<%@page import="webtoon.TEpisodeDTO"%>
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
<form action="showbuyWEp.jsp" method="post">
	<hr>
		<h2>구매한 웹툰 목록</h2>
	<hr><br>
	
<%
String r_id = (String) session.getAttribute("sessionid");
ReaderDAO dao = new ReaderDAO();
String r_nickname = dao.getNickname(r_id);
List<String> buyList = dao.getWtList(r_nickname);
%>

	<h3>
	웹툰 선택<br><br>
	</h3>
<% WebtoonDAO wtDao = new WebtoonDAO();
	for (int i=0; i<buyList.size(); i++) { 
		WebtoonDTO wtDto = new WebtoonDTO();
		wtDto = wtDao.getWtByCode(buyList.get(i));
		String title = wtDto.getT_title();%>
		<input type="radio" name="webtoon" value="<%=buyList.get(i)%>"><%=title%><br>
		<br>	
<% } %>
		<br><br>
		
		<input type="submit" value="선택">
		<input type="reset" value="취소"><br>
</form>
</body>
</html>