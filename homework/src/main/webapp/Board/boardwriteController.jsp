<%@page import="Dao.BoardDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Dto.Board"%>
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
	
		String btitle = request.getParameter("btitle");
		String bcontents = request.getParameter("bcontents");
		String bwriter = (String)session.getAttribute("logid");
		
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String bdate = format.format(date);
		
		Board board = new Board( btitle , bcontents , bwriter , bdate , 0 );
		
		//db
		BoardDao boardDao = BoardDao.getinstance();
		
		int result = boardDao.bwrite(board);
		
		if(result == 1) {
			response.sendRedirect("../Board/boardlist.jsp");
		}
		else {
			response.sendRedirect("boardwrite.jsp");
		}
	%>

</body>
</html>