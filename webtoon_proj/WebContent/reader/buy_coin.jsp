<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta charset="EUC-KR">
<title>코인 구매 페이지</title>
</head>
<body>
	<h3 id="title">코인 구매하기</h3>
	<!--가운데정렬 -->
	<style>
#select {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 500px;
	height: 100px;
	margin: -50px 0 0 -50px;
}

#title {
	position: absolute;
	top: 40%;
	left: 50%;
	width: 500px;
	height: 100px;
	margin: -50px 0 0 -50px;
}
</style>

	<div id="select">
		구매할 코인 :
		<form action='buy.jsp' method="post">
			<select name = "coin_num">
				<option value="10">10</option>
				<option value="30">30</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
				<option value="300">300</option>
			</select> 개

		<button class="btn btn-primary"
			type="submit">구매</button></form>
	</div>


	<!-- 버튼을 클릭하면 구매창으로 넘어간다. 로그인된 회원의 코인 개수 늘리기 
 로그인하지 않으면 마이페이지와 코인구매 불가능하게 alert추가할 것 -->

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>


</body>
</html>