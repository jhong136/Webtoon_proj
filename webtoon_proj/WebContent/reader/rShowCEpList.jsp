<%@page import="challengetoon.CEpisodeDTO"%>
<%@page import="java.util.List"%>
<%@page import="challengetoon.CEpisodeDAO"%>
<%@page import="challengetoon.ChallengeToonDAO"%>
<%@page import="challengetoon.ChallengeToonDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="rCShowEp.jsp" method="post">

<%
request.setCharacterEncoding("UTF-8");
String enC_title = request.getParameter("c_title");
String c_title = java.net.URLDecoder.decode(enC_title);
ChallengeToonDAO chDao = new ChallengeToonDAO();
String c_code = chDao.getCodeByTitle(c_title);
ChallengeToonDTO chDto = chDao.getCtByCode(c_code);
%>
	<hr>
	<h2><%=c_title %></h2>
	<hr>
	<br>

	<table>
		<tr>
			<td>
				<%
					String str = "../upload/" + chDto.getC_img();
				%>
				<div style="width: 120px; height: 90px; overflow: hidden">
					<img src=<%=str%> width="100"></a>
				</div>
			</td>

			<td>
				<% String s = chDto.getC_intro(); %>
				<h5><%=s %></h5>
			</td>
		</tr>
	</table>
	<hr></hr><br><br>
	
<%
CEpisodeDAO epDao = new CEpisodeDAO();
List<CEpisodeDTO> list = epDao.getCEpList(c_code);
%>

	<input type="hidden" name="c_title" value=<%=enC_title %>>
	<input type="hidden" name="c_code" value=<%=c_code %>> 
	<table>
		<tr>
			<td>열람할 회차 선택</td>
			<td>	
			<select name="c_no">
			<% for (int i=0; i<list.size(); i++) { 
				int n = list.get(i).getC_no(); %>
				<option value=<%=n %>><%=n %>화</option>
			<% } %>
			</select>
			</td>
			<td>
				<input type="submit" value="선택">
			</td>
		</tr>
		<tr>
		<% for (int i=0; i<list.size(); i++) { 
			String epImg = "../upload/" + list.get(i).getC_content();%>
			<td>
			<div style="width: 90px; height: 70px; overflow: hidden">
				<img src=<%=epImg %> width="100"></a>
			</div>
			</td>
			<td>
			<%=list.get(i).getC_name() %>
			</td>
		</tr>
		<% } %>	
	</table>
</body>
</html>