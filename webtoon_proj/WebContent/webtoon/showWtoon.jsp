<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="webtoon.WebtoonDAO"%>
<%@ page import="webtoon.WebtoonDTO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td align="center">
				<table>
					<tr>월
					</tr>
					<br>
					<br>

					<%
						WebtoonDAO dao = new WebtoonDAO();
						List<WebtoonDTO> list = dao.getWtoonByDay("월");
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<%
							String str = "../upload/" + list.get(i).getT_img();
						%>
						<div style="width: 120px; height: 90px; overflow: hidden">
							<img src=<%=str%> width="100"></a><br>
						</div>
						<%
							out.println(list.get(i).getT_title());
						%><br>
						<br>
					</tr>
					<%
						}
					%>
				</table>
			</td>

			<td align="center">
				<table>
					<tr>화
					</tr>
					<br>
					<br>

					<%
						dao = new WebtoonDAO();
						list = dao.getWtoonByDay("화");
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<%
							String str = "../upload/" + list.get(i).getT_img();
						%>
						<div style="width: 120px; height: 90px; overflow: hidden">
							<img src=<%=str%> width="100"></a><br>
						</div>
						<%
							out.println(list.get(i).getT_title());
						%><br>
						<br>
					</tr>
					<%
						}
					%>
				</table>
			</td>

			<td align="center">
				<table>
					<tr>수
					</tr>
					<br>
					<br>

					<%
						dao = new WebtoonDAO();
						list = dao.getWtoonByDay("수");
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<%
							String str = "../upload/" + list.get(i).getT_img();
						%>
						<div style="width: 120px; height: 90px; overflow: hidden">
							<img src=<%=str%> width="100"></a><br>
						</div>
						<%
							out.println(list.get(i).getT_title());
						%><br>
						<br>
					</tr>
					<%
						}
					%>
				</table>
			</td>

			<td align="center">
				<table>
					<tr>목
					</tr>
					<br>
					<br>

					<%
						dao = new WebtoonDAO();
						list = dao.getWtoonByDay("목");
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<%
							String str = "../upload/" + list.get(i).getT_img();
						%>
						<div style="width: 120px; height: 90px; overflow: hidden">
							<img src=<%=str%> width="100"></a><br>
						</div>
						<%
							out.println(list.get(i).getT_title());
						%><br>
						<br>
					</tr>
					<%
						}
					%>
				</table>
			</td>

			<td align="center">
				<table>
					<tr>금
					</tr>
					<br>
					<br>

					<%
						dao = new WebtoonDAO();
						list = dao.getWtoonByDay("금");
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<%
							String str = "../upload/" + list.get(i).getT_img();
						%>
						<div style="width: 120px; height: 90px; overflow: hidden">
							<img src=<%=str%> width="100"></a><br>
						</div>
						<%
							out.println(list.get(i).getT_title());
						%><br>
						<br>
					</tr>
					<%
						}
					%>
				</table>
			</td>

			<td align="center">
				<table>
					<tr>토
					</tr>
					<br>
					<br>

					<%
						dao = new WebtoonDAO();
						list = dao.getWtoonByDay("토");
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<%
							String str = "../upload/" + list.get(i).getT_img();
						%>
						<div style="width: 120px; height: 90px; overflow: hidden">
							<img src=<%=str%> width="100"></a><br>
						</div>
						<%
							out.println(list.get(i).getT_title());
						%><br>
						<br>
					</tr>
					<%
						}
					%>
				</table>
			</td>

			<td align="center">
				<table>
					<tr>일
					</tr>
					<br>
					<br>

					<%
						dao = new WebtoonDAO();
						list = dao.getWtoonByDay("일");
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<%
							String str = "../upload/" + list.get(i).getT_img();
						%>
						<div style="width: 120px; height: 90px; overflow: hidden">
							<img src=<%=str%> width="100"></a><br>
						</div>
						<%
							out.println(list.get(i).getT_title());
						%><br>
						<br>
					</tr>
					<%
						}
					%>
				</table>
			</td>

			<td align="center">
				<table>
					<tr>완결
					</tr>
					<br>
					<br>

					<%
						dao = new WebtoonDAO();
						list = dao.getWtoonByDay("완결");
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<%
							String str = "../upload/" + list.get(i).getT_img();
						%>
						<div style="width: 120px; height: 90px; overflow: hidden">
							<img src=<%=str%> width="100"></a><br>
						</div>
						<%
							out.println(list.get(i).getT_title());
						%><br>
						<br>
					</tr>
					<%
						}
					%>
				</table>
			</td>
		</tr>
		<tr>

		</tr>
	</table>


</body>
</html>