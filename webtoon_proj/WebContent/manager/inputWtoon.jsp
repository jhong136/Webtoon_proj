<%@page import="writer.WriterDTO"%>
<%@page import="java.util.List"%>
<%@page import="writer.WriterDAO"%>
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
	<form action="/webtoon_proj/test01_servlet/while.do" method="post" enctype="multipart/form-data">
<%
String mgr_id = (String) session.getAttribute("sessionid");
%>
		<hr>
		<h2>신규 웹툰 등록</h2>
		<hr>
		
		<div style= "padding: 10px 30px 10px 60px;">
		<input type="hidden" name="m_id" value=<%=mgr_id %>> 
		웹툰 제목: <input type="text" name="title"><br><br>
		
		장르 
		<select name="genre">
			<option value="액션">액션</option>
			<option value="판타지">판타지</option>
			<option value="스릴러">스릴러</option>
			<option value="드라마">드라마</option>
			<option value="로맨스">로맨스</option>
			<option value="개그">개그</option>
			<option value="학원">학원</option>
		</select><br><br> 
		
		연령 
		<select name="age">
			<option value="전체연령">전체연령</option>
			<option value="청소년관람불가">청소년관람불가</option>
		</select><br><br> 
		
		작가(닉네임)<br><br>
 		<select name="writer1" value="">
 			<option value="">작가명</option>
		<%
			WriterDAO wrDao = new WriterDAO();
			List<WriterDTO> wrtList = wrDao.getwrtList();
			
			for (int i=0; i<wrtList.size(); i++) { 
				String name = wrtList.get(i).getW_name();%>
				<option value=<%=name %>><%=name %></option>
		  <%} %>
		</select><br><br>
		
		<select name="writer2">
			<option value="">작가명</option>
		<%
			for (int i=0; i<wrtList.size(); i++) { 
				String name = wrtList.get(i).getW_name();%>
				<option value=<%=name %>><%=name %></option>
		  <%} %>
		</select><br><br>
		
		<select name="writer3">
			<option value="">작가명</option>
		<%
			for (int i=0; i<wrtList.size(); i++) { 
				String name = wrtList.get(i).getW_name();%>
				<option value=<%=name %>><%=name %></option>
		  <%} %>
		</select><br><br>
		
		<select name="writer4">
			<option value="">작가명</option>
		<%
			for (int i=0; i<wrtList.size(); i++) { 
				String name = wrtList.get(i).getW_name();%>
				<option value=<%=name %>><%=name %></option>
		  <%} %>
		</select><br><br>
		
		소개글 :<br>
		<textarea rows="5" cols="60" name="intro"></textarea><br><br> 
		
		썸네일 : <input type="file" name="img"><br><br>
		
		연재요일<br> 
		<input type="checkbox" name="day" value="월">월
		<input type="checkbox" name="day" value="화">화 
		<input type="checkbox" name="day" value="수">수 
		<input type="checkbox" name="day" value="목">목 
		<input type="checkbox" name="day" value="금">금 
		<input type="checkbox" name="day" value="토">토
		<input type="checkbox" name="day" value="일">일 
		<br><br><br>
		
		<input type="submit" value="등록">
		<input type="reset" value="취소"><br>
		</div>
		
	</form>
</body>
</html>