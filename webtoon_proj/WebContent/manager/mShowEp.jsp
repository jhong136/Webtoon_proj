<%@page import="webtoon.TEpisodeDTO"%>
<%@page import="webtoon.TEpisodeDAO"%>
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
<%
request.setCharacterEncoding("UTF-8");
String enT_title = request.getParameter("t_title");
String t_title = java.net.URLDecoder.decode(enT_title);
String t_code = request.getParameter("t_code");
int t_no = Integer.parseInt(request.getParameter("t_no"));
TEpisodeDAO dao = new TEpisodeDAO();
TEpisodeDTO dto = dao.getEp(t_code, t_no);
%>

<hr>
<h2><%=t_title %></h2>
<hr>
<br>

<hr>
<h4><%=dto.getT_no() %>화. <%=dto.getT_name() %></h4>
<hr>

<%
	String str = "../upload/" + dto.getT_content();
%>
<table width=100%>
	<td align="center">
		<img src=<%=str%> width="500"></a>
	</td>
</table>
</body>
</html>