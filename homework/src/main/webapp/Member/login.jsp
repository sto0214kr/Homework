<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<h3>로그인 페이지</h3>
	<form method="post" action="loginController.jsp">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
		</table> <br>
		<input type="submit" value="로그인"> 
		<a href="../Main/main.jsp"><button>이전 페이지</button></a>
	</form>
	
</body>
</html>