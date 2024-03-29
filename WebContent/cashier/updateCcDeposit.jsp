<%@ page import="enums.AccessRightsEnum"%>
<%@ page import="bean.AccessRights"%>

<%
	Integer accountTypeId = (Integer) session
			.getAttribute("accountTypeId");
	AccessRights accessRights = new AccessRights();
	if (accountTypeId == null) {
		response.sendRedirect("../errorpage.jsp");
	} else {
		switch (accessRights.getAccessRights(accountTypeId)) {
		case DIRECTOR:
		case CASHIER:
%>
<%@ page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>

<jsp:useBean id="creditCards" scope="page" class="sql.CreditCardsRepositoryImpl" />
<jsp:useBean id="creditCardsTransaction" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />

<%!String a, TotalCreditCardAmount1, CardNumber, Deposit, Desc;
	int CustomerId;
	float balance, Orio, InitialCreditCardAmount,  TotalCreditCardAmount, RemainingCreditCardAmount;
%>

<%
			CustomerId = (Integer) session.getAttribute("customerId");
			Deposit = "Κατάθεση";
			Desc = request.getParameter("desc");						   				
			Desc = Desc +  " Από " + (String) session.getAttribute("firstname") + " " +  (String) session.getAttribute("lastname");				
			CardNumber = (String) session.getAttribute("cardNumber");	
			Orio = (Float) session.getAttribute("orio");			
			balance = (Float) session.getAttribute("balance");				
			InitialCreditCardAmount = balance;						
			TotalCreditCardAmount1 = request.getParameter("TotalCreditCardAmount");	
			System.out.println(TotalCreditCardAmount1);
			TotalCreditCardAmount = Float.parseFloat(TotalCreditCardAmount1);	
			RemainingCreditCardAmount = InitialCreditCardAmount + TotalCreditCardAmount;						
			balance = RemainingCreditCardAmount;						
			creditCardsTransaction.creditCardTransaction(CardNumber, CustomerId, Deposit, InitialCreditCardAmount, TotalCreditCardAmount, RemainingCreditCardAmount, Orio, Desc);
			creditCards.updateCreditCard(balance, CardNumber);
			out.println("correct");
			break;
		case NOACCESS:
			response.sendRedirect("errorpage.jsp");
			break;
		}
	}
%>