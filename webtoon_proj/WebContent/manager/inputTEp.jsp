<%@page import="java.util.List"%>
<%@page import="webtoon.TEpisodeDAO"%>
<%@page import="webtoon.TEpisodeDTO"%>
<%@page import="webtoon.WebtoonDAO"%>
<%@page import="webtoon.WebtoonDTO"%>
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
	<form action="/webtoon_proj/test01_servlet/while.do2" method="post" enctype="multipart/form-data">
<%
request.setCharacterEncoding("utf-8");
String t_code = request.getParameter("webtoon");
WebtoonDAO wtDao = new WebtoonDAO();
WebtoonDTO wtDto = wtDao.getWtByCode(t_code);
%>
		<hr>
		<h2><%=wtDto.getT_title()%> 회차  등록</h2>
		<hr><br> 
		
		<%
			TEpisodeDAO epDao = new TEpisodeDAO();
			List<TEpisodeDTO> epList = epDao.getTEpList(t_code);
			int t_no = epList.size()+1;
		%>
		<%=t_no %>번쨰 회차 업로드<br><br>
		
		<input type="hidden" name="t_code" value=<%=t_code %>>
		<input type="hidden" name="no" value=<%=t_no %>>
		회차 제목 입력 <input type="text" name="name"><br><br>
		
		파일 업로드 : <input type="file" name="content"><br><br>
		
		<input type="submit" value="등록">
		<input type="reset" value="취소"><br>
		
	</form>
</body>
</html>