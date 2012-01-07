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
		case WRONG_USERNAME:			
			// TODO wrong
	break;
		case WRONG_PASSWORD:
	break;
		case CORRECT_EMPLOYEE:
		System.out.println( "cor emp" );
		// Create Session
		// redirect to emp
		 response.sendRedirect("welcome.jsp");
	break;
		case CORRECT_USER:
		System.out.println( "cor cus" );
	// Create Session
	// redirect to user
     response.sendRedirect("test.jsp");
	break;
		case WRONG_LOGINS:
	break;

		}

	}
%>

<jsp:useBean id="login" scope="request"
	class="sql.WebLoginRepositoryImpl">
	<jsp:setProperty name="login" property="username"
		value='<%=request.getParameter("username")%>' />
	<jsp:setProperty name="login" property="password"
		value='<%=request.getParameter("password")%>' />
</jsp:useBean>

