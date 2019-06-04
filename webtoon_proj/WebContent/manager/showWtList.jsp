<%@page import="webtoon.WebtoonDTO"%>
<%@page import="java.util.List"%>
<%@page import="webtoon.WebtoonDAO"%>
<%@page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정식 웹툰 회차 목록</title>
</head>
<body>
<jsp:include page="adminHeader.jsp" flush="false"/>
<form action="showEpList.jsp" method="post">

<%
	request.setCharacterEncoding("UTF-8");
	String day = request.getParameter("day");
	WebtoonDAO dao = new WebtoonDAO();
	List<WebtoonDTO> list = dao.getWtoonByDay(day);
%>
	<div style="padding: 20px;">
	<hr>
		<h4><%=day %>요일 웹툰 목록</h4>
	<hr><br>
	</div>

	열람할 웹툰 선택
	<select name="t_title">
	<% for (int i=0; i<list.size(); i++) { 
		String t = list.get(i).getT_title(); 
		String enT = java.net.URLEncoder.encode(t); %>
		<option value=<%=enT %>><%=t %></option>
	<% } %>
	</select>
	<input type="submit" value="선택">
	<div style="padding: 20px 20px 30px 20px;">
		<table>
			<% for (int i=0; i<list.size(); i++) { %>
			<td>
				<% String str = "../upload/" + list.get(i).getT_img(); %>
				<div style="width: 120px; height: 90px; overflow: hidden">
					<img src=<%=str%> width="100"></a><br>
				</div>
				<% String title = list.get(i).getT_title(); %>
				<%=title %>
			</td>
			<% } %>
		</table>
	</div>
	</form>
</body>
</html>