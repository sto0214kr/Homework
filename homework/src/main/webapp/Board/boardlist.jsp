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

	<h3>�α��� ���� �� �Խñ� ��� ������</h3>
	<%
		String logid = (String)session.getAttribute("logid");
	
		if(logid != null) {
			
			out.println(logid + " �� �ݰ����ϴ�.");
		}
	%>
	<br><br>
	<a href="../Board/boardwrite.jsp"><button>�� ����</button></a>
	<br><br>
	<table border="1">
		<tr>
			<th>��ȣ</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ��</th>
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