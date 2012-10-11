<%@ page import="enums.AccessRightsEnum"%>
<%@ page import="bean.AccessRights"%>

<%	
	Integer accountTypeId = (Integer) session.getAttribute("accountTypeId");
	AccessRights accessRights = new AccessRights();
	if (accountTypeId == null) {
		response.sendRedirect("../errorpage.jsp");
	} else {
	switch (accessRights.getAccessRights(accountTypeId)) {
	case DIRECTOR:
%>
<%@ page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");%>

<jsp:useBean id="message" scope="page" class="sql.MessagesRepositoryImpl" />

<%!String Fullname, Email, Message;
	int MessageId;%>

<%
	MessageId = (Integer) session.getAttribute("MessageId");
	Fullname = request.getParameter("Fullname");
	Email = request.getParameter("Email");
	Message = request.getParameter("Message");
	
	message.updateMessage(Fullname, Email, Message, MessageId);
	
	out.println("correct");
	break;
	case CASHIER:
	case NOACCESS:
	case CUSTOMER:
		response.sendRedirect("./errorpage.jsp");
	break;
	}}
%>
