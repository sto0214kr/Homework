<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String logid = (String)session.getAttribute("logid");
		
		if(logid != null) {
	%>

	<h3>글쓰기 페이지</h3>
	
	<a href="../Board/boardlist.jsp"><button>글 목록</button></a>
	
	<form method="post" action="boardwriteController.jsp">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="btitle"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="bwriter" disabled="disabled" value="<%=logid%>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="50" name="bcontents"></textarea> </td>
			</tr>	
		</table>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
	
	<%
		}
	%>

</body>
</html>