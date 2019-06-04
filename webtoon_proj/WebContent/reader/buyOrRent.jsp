<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/webtoon_proj/test01_servlet/buyrent.do" method="post" enctype="multipart/form-data">
<%
	String r_id = (String) session.getAttribute("sessionid");
	String t_code = (String) request.getAttribute("t_code");
	int t_no = (Integer) request.getAttribute("t_no");
%>
	<hr>
	<h4>구매하시겠습니까(3코인)? 대여하시겠습까(1코인)?</h4>
	<hr>

	<input type="hidden" name="r_id" value=<%=r_id %>>
	<input type="hidden" name="t_code" value=<%=t_code %>>
	<input type="hidden" name="t_no" value=<%=t_no %>>
	<input type="radio" name="bOrR" value="구매">구매
	<input type="radio" name="bOrR" value="대여">대여
	<br><br><br>
	<input type="submit" value="선택">
	<input type="reset" value="취소">
	<br>
	</form>
</body>
</html>