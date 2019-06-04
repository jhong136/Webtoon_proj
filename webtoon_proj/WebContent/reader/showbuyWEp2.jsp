<%@page import="webtoon.TEpisodeDTO"%>
<%@page import="webtoon.TEpisodeDAO"%>
<%@page import="webtoon.WebtoonDTO"%>
<%@page import="webtoon.WebtoonDAO"%>
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
String t_code = request.getParameter("t_code");
WebtoonDAO wDao = new WebtoonDAO();
WebtoonDTO wDto = wDao.getWtByCode(t_code);

int t_no = Integer.parseInt(request.getParameter("t_no"));

TEpisodeDAO dao = new TEpisodeDAO();
TEpisodeDTO dto = dao.getEp(t_code, t_no);
%>

<hr>
<h2><%=wDto.getT_title() %></h2>
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