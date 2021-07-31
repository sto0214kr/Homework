<%@page import="Dto.Board"%>
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

	<%
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		BoardDao boardDao = BoardDao.getinstance();
			
		Board board = boardDao.bview(bno);
	%>

	<h3>게시물 수정 페이지</h3>
	<form method="post" action="boardupdateController.jsp">
		<table>
			<tr>
				<td>번호</td>
				<td><input type="text" name="bno" disabled="disabled" value="<%=board.getBno()%>"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="btitle" value="<%=board.getBtitle()%>"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="bwriter" disabled="disabled" value="<%=board.getBwriter()%>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="50" name="bcontents"><%=board.getBcontents()%></textarea> </td>
			</tr>	
		</table> <br>
		<input type="submit" value="수정 등록">
	</form><br>
	<a href="boardlist.jsp"><button>글 목록</button></a>
	<a href="boardview.jsp?bno=<%=bno%>"><button>취소</button></a>
	
</body>
</html>