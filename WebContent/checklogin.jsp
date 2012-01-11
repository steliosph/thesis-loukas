<%@ page import="sql.WebLoginRepositoryImpl"%>
<%@ page import="bean.WebLogin"%>
<%@ page import="sql.WebLoginRepository"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!--  Limit availability , redirect -->
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	WebLoginRepository repos = new WebLoginRepositoryImpl();

	if (username.isEmpty() || password.isEmpty()) {
		// TODO : Show him something else
	} else {

		switch (repos.checkLogin(username, password)) {
		case WRONG_USERNAME_PASSWORD:
%>
<jsp:forward page="epistrofi.jsp"></jsp:forward>
<%
	break;
		case CORRECT_EMPLOYEE:
			// String emp_id = session.getAttribute("emp_id");
			String type;
			session.getAttribute("type", repos.getEmpId(type));
%>
<jsp:forward page="test.jsp"></jsp:forward>

<%
	break;
		case CORRECT_USER:
%>

<jsp:forward page="index.jsp"></jsp:forward>

<%
	break;
		case WRONG_LOGINS:
			// TODO wrong
			break;

		}

	}
%>



