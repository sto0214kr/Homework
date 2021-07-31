<%@page import="Dto.Member"%>
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
		String mpasswordconfirm = request.getParameter("passwordconfirm");
		String mname = request.getParameter("name");
		String memail = request.getParameter("email");
		
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String mphone = phone1 + phone2 + phone3;
		
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		String address4 = request.getParameter("address4");
		String maddress = address1 + address2 + address3 + address4;
		
		Member member = new Member(mid, mpassword, mname, memail, mphone, maddress);
		
		// db
		MemberDao memberDao = MemberDao.getinstance();
		
		int result = memberDao.signup(member);
		
		if(result == 1) {
			response.sendRedirect("../Main/main.jsp");
		}
		else {
			response.sendRedirect("signup.jsp");
		}
	%>
	
</body>
</html>