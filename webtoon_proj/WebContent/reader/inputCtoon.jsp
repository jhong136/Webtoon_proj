<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/webtoon_proj/test01_servlet/while.do3" method="post" enctype="multipart/form-data">
<%
String r_id = (String) session.getAttribute("sessionid");
%>
		<hr>
		<h2>도전 웹툰 업로드</h2>
		<hr>
		
		<div style= "padding: 10px 30px 10px 60px;">
		<input type="hidden" name="r_id" value=<%=r_id %>> 
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
		
		소개글 :<br>
		<textarea rows="5" cols="60" name="intro"></textarea><br><br> 
		
		썸네일 : <input type="file" name="img"><br><br>
		
		<input type="submit" value="등록">
		<input type="reset" value="취소"><br>
		</div>		
	</form>
</body>
</html>