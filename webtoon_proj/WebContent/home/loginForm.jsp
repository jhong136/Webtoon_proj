<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>회원가입 양식</title>
<h1 align = "center">회원가입</h1>
</head>
<body>
<form action = "JoinFinish.jsp" method = "post">
<input type = "hidden" name = "ip" value = "<%=request.getRemoteAddr() %>"/>
<table width = "500" align = "center" border ="2">
<tr>
<td width = "200" align = "center">닉네임</td>
<td width = "200" align = "center"><input type = "text" name = "nickname"/></td>
</tr>
<tr>
<td width = "200" align = "center">아이디</td>
<td width = "200" align = "center"><input type = "text" name = "id"/></td>
</tr>
<tr>
<td width = "200" align = "center">비밀번호</td>
<td width = "200" align = "center"><input type = "password" name = "password"/></td>
</tr>
<tr>
<td width = "200" align = "center">성별</td>
<td width = "200" align = "center"><input type = "radio" name = "gender" value = "남" />남
<input type = "radio" name = "gender" value = "여" />여</td>
</tr>
<tr>
<td width = "200" align = "center">생년월일</td>
<td width = "200" align = "center"><input type = "text" name = "date"/></td>
</tr>
<tr>
<td width = "200" align = "center" colspan = "2" ><input type = "submit" name = "join" value ="회원가입하기"/></td>
</tr>

</table>
</form>
</body>
</html>