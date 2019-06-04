<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="rShowWtList.jsp" method="post">
	<div style="padding: 30px;">
		<table>
			<tr>
				<h5>
					요일선택
						<select name="day">
							<option value="월">월</option>
							<option value="화">화</option>
							<option value="수">수</option>
							<option value="목">목</option>
							<option value="금">금</option>
							<option value="토">토</option>
							<option value="일">일</option>
							<option value="완결">완결</option>
						</select>
						<input type="submit" value="선택">
				</h5>
			</tr>
		</table>
	</div>	
	<jsp:include page="../webtoon/showWtoon.jsp" flush="false" />
</body>
</html>