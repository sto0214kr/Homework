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

	<h3>�۾��� ������</h3>
	
	<a href="../Board/boardlist.jsp"><button>�� ���</button></a>
	
	<form method="post" action="boardwriteController.jsp">
		<table>
			<tr>
				<td>����</td>
				<td><input type="text" name="btitle"></td>
			</tr>
			<tr>
				<td>�ۼ���</td>
				<td><input type="text" name="bwriter" disabled="disabled" value="<%=logid%>"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><textarea rows="10" cols="50" name="bcontents"></textarea> </td>
			</tr>	
		</table>
		<input type="submit" value="���">
		<input type="reset" value="���">
	</form>
	
	<%
		}
	%>

</body>
</html>