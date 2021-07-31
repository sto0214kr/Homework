<%@page import="Dao.ReplyDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Dto.Reply"%>
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
	
		int bno = Integer.parseInt(request.getParameter("bno"));
		String rwriter = request.getParameter("rwriter");
		String rcontents = request.getParameter("rcontents");
		
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
		String rdate = format.format(date);
		
		Reply reply = new Reply(bno, rwriter, rcontents, rdate);
		
		// db
		ReplyDao replyDao = ReplyDao.getinstance();
		
		int result = replyDao.rwrite(reply);
		
		if(result == 1) {
			response.sendRedirect("../Board/boardview.jsp?bno=" + bno);
		}
	%>

</body>
</html>