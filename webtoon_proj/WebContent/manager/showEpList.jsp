<%@page import="java.util.List"%>
<%@page import="webtoon.TEpisodeDTO"%>
<%@page import="webtoon.TEpisodeDAO"%>
<%@page import="webtoon.WebtoonDTO"%>
<%@page import="webtoon.WebtoonDAO"%>
<%@page import="java.net.URLEncoder" %>
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
<form action="mShowEp.jsp" method="post">

<%
request.setCharacterEncoding("UTF-8");
String enT_title = request.getParameter("t_title");
String t_title = java.net.URLDecoder.decode(enT_title);
WebtoonDAO wtDao = new WebtoonDAO();
String t_code = wtDao.getCodeByTitle(t_title);
WebtoonDTO wtDto = wtDao.getWtByCode(t_code);
%>
	<hr>
	<h2><%=t_title %></h2>
	<hr>
	<br>

	<table>
		<tr>
			<td>
				<%
					String str = "../upload/" + wtDto.getT_img();
				%>
				<div style="width: 120px; height: 90px; overflow: hidden">
					<img src=<%=str%> width="100"></a>
				</div>
			</td>

			<td>
				<% String s = wtDto.getT_intro(); %>
				<h5><%=s %></h5>
			</td>
		</tr>
	</table>
	<hr></hr><br><br>
	
<%
TEpisodeDAO epDao = new TEpisodeDAO();
List<TEpisodeDTO> list = epDao.getTEpList(t_code);
%>

	<input type="hidden" name="t_title" value=<%=enT_title %>>
	<input type="hidden" name="t_code" value=<%=t_code %>> 
	<table>
		<tr>
			<td>열람할 회차 선택</td>
			<td>	
			<select name="t_no">
			<% for (int i=0; i<list.size(); i++) { 
				int n = list.get(i).getT_no(); %>
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
			String epImg = "../upload/" + list.get(i).getT_content();%>
			<td>
			<div style="width: 90px; height: 70px; overflow: hidden">
				<img src=<%=epImg %> width="100"></a>
			</div>
			</td>
			<td>
			<%=list.get(i).getT_name() %>
			</td>
		</tr>
		<% } %>	
	</table>
	</form>

</body>
</html>