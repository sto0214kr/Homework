<%@page import="Dao.MemberDao"%>
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
		request.setCharacterEncoding("EUC-KR");
	
		String mid = request.getParameter("id");
		String mpassword = request.getParameter("password");
		
		// db
		MemberDao memberDao = MemberDao.getinstance();
		
		int result = memberDao.login(mid, mpassword);
		
		if(result == 1) {
			response.sendRedirect("../Board/boardlist.jsp");
			
			session.setAttribute("logid", mid);
		}
		else {
			response.sendRedirect("login.jsp");
		}
	%>

</body>
</html>