<%@page import="challengetoon.CEpisodeDTO"%>
<%@page import="challengetoon.CEpisodeDAO"%>
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
String enC_title = request.getParameter("c_title");
String c_title = java.net.URLDecoder.decode(enC_title);
String t_code = request.getParameter("c_code");
int t_no = Integer.parseInt(request.getParameter("c_no"));
CEpisodeDAO dao = new CEpisodeDAO();
CEpisodeDTO dto = dao.getEp(t_code, t_no);
%>

<hr>
<h2><%=c_title %></h2>
<hr>
<br>

<hr>
<h4><%=dto.getC_no() %>화. <%=dto.getC_name() %></h4>
<hr>

<%
	String str = "../upload/" + dto.getC_content();
%>
<table width=100%>
	<td align="center">
		<img src=<%=str%> width="500"></a>
	</td>
</table>
</body>
</html>