<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<h3>�α��� ������</h3>
	<form method="post" action="loginController.jsp">
		<table>
			<tr>
				<td>���̵�</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><input type="password" name="password"></td>
			</tr>
		</table> <br>
		<input type="submit" value="�α���"> 
		<a href="../Main/main.jsp"><button>���� ������</button></a>
	</form>
	
</body>
</html>