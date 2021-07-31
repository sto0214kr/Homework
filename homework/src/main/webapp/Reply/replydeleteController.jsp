<%@page import="Dao.ReplyDao"%>
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
		int rno = Integer.parseInt(request.getParameter("rno"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		// db
		ReplyDao replyDao = ReplyDao.getinstance();
		
		int result = replyDao.rdelete(rno);
		
		if(result == 1) {
			response.sendRedirect("../Board/boardview.jsp?bno=" + bno);
		}
	%>

</body>
</html>