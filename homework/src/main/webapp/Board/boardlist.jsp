<%@page import="Dto.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h3>로그인 성공 후 게시글 목록 페이지</h3>
	<%
		String logid = (String)session.getAttribute("logid");
	
		if(logid != null) {
			
			out.println(logid + " 님 반갑습니다.");
		}
	%>
	<br><br>
	<a href="../Board/boardwrite.jsp"><button>글 쓰기</button></a>
	<br><br>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%
		BoardDao boardDao = BoardDao.getinstance();
		
		ArrayList<Board> boards = boardDao.blist();
		
		for(Board temp : boards) {
		%>
		<tr>
			<td><%=temp.getBno() %></td>
			<td><a href="boardview.jsp?bno=<%=temp.getBno()%>"><%=temp.getBtitle() %></a></td>
			<td><%=temp.getBwriter() %></td>
			<td><%=temp.getBdate() %></td>
			<td><%=temp.getBcount() %></td>
		</tr>
		<%
		}
		%>
		
	</table>
	
</body>
</html>