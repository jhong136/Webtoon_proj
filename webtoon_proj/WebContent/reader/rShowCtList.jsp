<%@page import="challengetoon.ChallengeToonDTO"%>
<%@page import="challengetoon.ChallengeToonDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도전 웹툰 회차 목록</title>
</head>
<body>
<form action="rShowCEpList.jsp" method="post">

<%
	ChallengeToonDAO dao = new ChallengeToonDAO();
	List<ChallengeToonDTO> list = dao.getCtList();
%>
	<div style="padding: 20px;">
	<hr>
		<h4>도전 웹툰 목록</h4>
	<hr><br>
	</div>

	열람할 웹툰 선택
	<select name="c_title">
	<% for (int i=0; i<list.size(); i++) { 
		String c = list.get(i).getC_title(); 
		String enC = java.net.URLEncoder.encode(c); %>
		<option value=<%=enC %>><%=c %></option>
	<% } %>
	</select>
	<input type="submit" value="선택">
	<div style="padding: 20px 20px 30px 20px;">
		<table>
			<% for (int i=0; i<list.size(); i++) { %>
			<td>
				<% String str = "../upload/" + list.get(i).getC_img(); %>
				<div style="width: 120px; height: 90px; overflow: hidden">
					<img src=<%=str%> width="100"></a><br>
				</div>
				<% String title = list.get(i).getC_title(); %>
				<%=title %>
			</td>
			<% } %>
		</table>
	</div>
	</form>
</body>
</html>