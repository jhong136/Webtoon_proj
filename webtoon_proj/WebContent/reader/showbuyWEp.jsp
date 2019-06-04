<%@page import="webtoon.TEpisodeDAO"%>
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
<form action="showbuyWEp2.jsp" method="post">
	<hr>
		<h2>구매한 웹툰 목록</h2>
	<hr><br>
	
<%
request.setCharacterEncoding("UTF-8");
String r_id = (String) session.getAttribute("sessionid");
ReaderDAO dao = new ReaderDAO();
String r_nickname = dao.getNickname(r_id);
String t_code = request.getParameter("webtoon");
List<TEpisodeDTO> buyList = dao.getBuyEp(r_nickname, t_code);
%>

	<h3>
	회차 선택<br><br>
	</h3>

<input type="hidden" name="t_code" value=<%=t_code %>>
<% TEpisodeDAO epDao = new TEpisodeDAO();
	for (int i=0; i<buyList.size(); i++) { 
		TEpisodeDTO epDto = new TEpisodeDTO();
		int no = buyList.get(i).getT_no();
		epDto = epDao.getEp(t_code, no);
		String name = epDto.getT_name();%>
		<input type="radio" name="t_no" value="<%=no %>"><%=name %><br>
		<br>	
<% } %>
		<br><br>
		
		<input type="submit" value="선택">
		<input type="reset" value="취소"><br>
	</form>
</body>
</html>