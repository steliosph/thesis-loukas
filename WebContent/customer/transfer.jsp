<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//TODO Limit availiability

	String Balance1, Balance2, TransferAmount, AccountSel1, AccountSel2, TransferDesc, AccNumber1, AccNumber2; 

%>

<%

	AccountSel1 = request.getParameter("AccountSel1");
	AccountSel2 = request.getParameter("AccountSel2");
	Balance1 = request.getParameter("Balance1"); 
	Balance2 = request.getParameter("Balance2");

	AccNumber1 = request.getParameter("AccNumber1"); 
	AccNumber2 = request.getParameter("AccNumber2");
	TransferAmount = request.getParameter("TransferAmount");
	TransferDesc = request.getParameter("TransferDesc");
	
	//response.getWriter().print("<div class='center'> <p style='font-style:italic; color:red;'> Παρακαλώ καταχωρίστε ημερομηνίες.</p>");
	System.out.println("aa");
	response.getWriter().print("Η μεταφορά ολοκληρώθηκε με επιτυχία!!!");
%>