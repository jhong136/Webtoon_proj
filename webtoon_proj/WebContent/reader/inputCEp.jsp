<%@page import="reader.ReaderDAO"%>
<%@page import="challengetoon.CEpisodeDTO"%>
<%@page import="java.util.List"%>
<%@page import="challengetoon.CEpisodeDAO"%>
<%@page import="challengetoon.ChallengeToonDTO"%>
<%@page import="challengetoon.ChallengeToonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/webtoon_proj/test01_servlet/while.do4" method="post" enctype="multipart/form-data">
<%
request.setCharacterEncoding("utf-8");
String c_code = request.getParameter("challengetoon");
String r_id = (String) session.getAttribute("sessionid");
ReaderDAO dao = new ReaderDAO();
String r_nickname = dao.getNickname(r_id);
ChallengeToonDAO chDao = new ChallengeToonDAO();
ChallengeToonDTO chDto = chDao.getCtByCode(c_code);

%>
		<hr>
		<h2><%=chDto.getC_title() %> 회차  등록</h2>
		<hr><br> 
		
		<%
			CEpisodeDAO epDao = new CEpisodeDAO();
			List<CEpisodeDTO> epList = epDao.getCEpList(chDto.getC_code());
			int c_no = epList.size()+1;
		%>
		<%=c_no %>번쨰 회차 업로드<br><br>
		
		<input type="hidden" name="c_code" value=<%=chDto.getC_code() %>>
		<input type="hidden" name="no" value=<%=c_no %>>
		회차 제목 입력 <input type="text" name="name"><br><br>
		
		파일 업로드 : <input type="file" name="content"><br><br>
		
		<input type="submit" value="등록">
		<input type="reset" value="취소"><br>
		
	</form>
</body>
</html>