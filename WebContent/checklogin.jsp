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
	break;
		case WRONG_PASSWORD:
	break;
		case CORRECT_EMPLOYEE:
	// Create session.
	// Rediret to administrator
	break;
		case CORRECT_USER:
	// Create Session
	// redirect to user
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

