<%@page import="Dto.Reply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.ReplyDao"%>
<%@page import="Dto.Board"%>
<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">
	.cols {
		padding: 5px 10px;
	}
</style>

</head>
<body>

	<%
	int bno = Integer.parseInt(request.getParameter("bno"));
	
	BoardDao boardDao = BoardDao.getinstance();
	
	// ��ȸ�� ����
	boardDao.bcountup(bno);

	Board board = boardDao.bview(bno);
	%>

	<h3>�Խñ� �� ������</h3>
	<table>
		<tr>
			<td>��ȣ</td>
			<td><input type="text" name="bno" readonly="readonly" value="<%=bno%>"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type="text" name="btitle" readonly="readonly" value="<%=board.getBtitle()%>"></td>
		</tr>
		<tr>
			<td>�ۼ���</td>
			<td><input type="text" name="bwriter"  readonly="readonly" value="<%=board.getBwriter()%>"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><textarea rows="10" cols="50" readonly="readonly" name="bcontents"><%=board.getBcontents()%></textarea> </td>
		</tr>
		<tr>
			<td></td>
			<td><input type="text" name="bdate" readonly="readonly" value="<%=board.getBdate()%>" 
						style="width: 130px; text-align: center;">
				��ȸ�� : <input type="text" name="bcount" readonly="readonly" value="<%=board.getBcount()%>"
								style="width: 20px; text-align: center;">
			</td>
		</tr>
	</table><br>
	<a href="boardlist.jsp"><button>���</button></a>
	<a href="boardupdate.jsp?bno=<%=bno%>"><button>����</button></a>
	<a href="boarddeleteController.jsp?bno=<%=bno%>"><button>����</button></a>
	
	<br><hr><br>
	<!-- ��� -->
	<h3>��� ����</h3>
	<form method="post" action="../Reply/replywriteController.jsp">
		<table>
			<tr>
				<td>�ۼ��� : <input type="text" name="rwriter" style="width: 100px;"></td>
				<td>��۳��� : <input type="text" name="rcontents"></td>
				<td><input type="hidden" value="<%=bno %>" name="bno"></td>
				<td><input type="submit" value="���"></td>
			</tr>
		</table>
	</form>
	
	<br><br>
	<h4>��� ���</h4>
	<table>
		<tr>
			<th class="cols">�ۼ���</th>
			<th class="cols">��۳���</th>
			<th class="cols">�ۼ���</th>
			<th class="cols"> - </th>
		</tr>
		<%
			ReplyDao replyDao = ReplyDao.getinstance();
			ArrayList<Reply> replies = replyDao.rlist(bno);
			
			for(Reply temp : replies) {
		%>
		<tr>
			<td class="cols"><%=temp.getRwriter() %></td>
			<td class="cols"><%=temp.getRcontents() %></td>
			<td class="cols"><%=temp.getRdate() %></td>
			<td class="cols"><a href="../Reply/replydeleteController.jsp?rno=<%=temp.getRno()%>&bno=<%=bno%>"><button>����</button></a></td>
		</tr>
		<%
			}
		%>
		
	</table>
	
</body>
</html>