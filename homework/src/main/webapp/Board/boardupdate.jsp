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

	<h3>�Խù� ���� ������</h3>
	<form method="post" action="boardupdateController.jsp">
		<table>
			<tr>
				<td>��ȣ</td>
				<td><input type="text" name="bno" disabled="disabled" value="<%=board.getBno()%>"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="text" name="btitle" value="<%=board.getBtitle()%>"></td>
			</tr>
			<tr>
				<td>�ۼ���</td>
				<td><input type="text" name="bwriter" disabled="disabled" value="<%=board.getBwriter()%>"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><textarea rows="10" cols="50" name="bcontents"><%=board.getBcontents()%></textarea> </td>
			</tr>	
		</table> <br>
		<input type="submit" value="���� ���">
	</form><br>
	<a href="boardlist.jsp"><button>�� ���</button></a>
	<a href="boardview.jsp?bno=<%=bno%>"><button>���</button></a>
	
</body>
</html>