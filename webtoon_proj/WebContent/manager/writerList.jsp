<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="writer.WriterDTO" %>
<%@ page import="writer.WriterDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
WriterDAO dao = new WriterDAO();
List<WriterDTO> items = dao.getwrtList();
for (int i=0; i<items.size(); i++) {
	WriterDTO dto = items.get(i);
	out.println(dto.getW_name());
}
%>
</body>
</html>