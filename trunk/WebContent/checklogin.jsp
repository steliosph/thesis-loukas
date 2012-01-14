<%@ page import="sql.WebLoginRepositoryImpl"%>
<%@ page import="sql.WebLoginRepository"%>
<%@ page import="sql.EmployeeRepositoryImpl"%>
<%@ page import="sql.EmployeeRepository"%>

<%@ page import="bean.WebLogin"%>
<%@ page import="bean.Employee"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!--  Limit availability , redirect -->
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	WebLoginRepository webLoginRepository = new WebLoginRepositoryImpl();
	EmployeeRepository employeeRepository = new EmployeeRepositoryImpl();
	if (username.isEmpty() || password.isEmpty()) {
		// TODO : Show him something else
	} else {
		switch (webLoginRepository.checkLogin(username, password)) {
		case WRONG_USERNAME_PASSWORD:
%>
<jsp:forward page="epistrofi.jsp"></jsp:forward>
<%
	break;
		case CORRECT_EMPLOYEE:
			int employeeId = webLoginRepository.getEmployeeId(username, password);
			
			/** ETW KAI TO BEAN SOU. KAME SET TO SESSION SOU TWRA **/
			Employee employee = employeeRepository.retrieveEmployee(employeeId);
			
			switch (webLoginRepository.getAccountType(username,password)) {
			case TAMIAS:
%>
<jsp:forward page="test.jsp"></jsp:forward>
<%
	break;
			case DIEFTHINTIS:
%>
<jsp:forward page="director/director.jsp"></jsp:forward>
<%
	break;
			}
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