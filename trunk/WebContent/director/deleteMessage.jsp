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

<%!String DeleteMessage, MessageId1, Fullname, Email, Message;
	int MessageId;%>

<%
	MessageId1 = request.getParameter("messageId");
	MessageId = Integer.parseInt(MessageId1);
	DeleteMessage = request.getParameter("deleteMessage");	
	if("yes".equals(DeleteMessage)) {
		message.deleteMessage(MessageId);
		System.out.println("Fasd");
	}
	
	break;
	case CASHIER:
	case NOACCESS:
	case CUSTOMER:
		response.sendRedirect("./errorpage.jsp");
	break;
	}}
%>










