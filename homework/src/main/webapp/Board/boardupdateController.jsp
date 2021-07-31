<%@page import="Dao.BoardDao"%>
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
	
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		String btitle = request.getParameter("btitle");
		String bcontents = request.getParameter("bcontents");
		
		Board board = new Board( btitle , bcontents );
		
		// db
		BoardDao boardDao = BoardDao.getinstance();
		
		int result =  boardDao.bupdate(bno, board);
		
		if(result == 1) {
			response.sendRedirect("boardlist.jsp");
		}
		
	%>

</body>
</html>