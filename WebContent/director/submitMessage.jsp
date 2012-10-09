<%@ page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>
<jsp:useBean id="message" scope="page" class="sql.MessagesRepositoryImpl" />
<%!String Fullname, Message, Email;%>
<%
	Fullname = request.getParameter("Fullname");						   									
	Message = request.getParameter("Message");
	Email = request.getParameter("Email");
	message.insertMessage(Email, Message, Fullname);
	out.println("correct");	
%>