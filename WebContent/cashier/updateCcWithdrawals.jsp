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

<%!String TotalCreditCardAmount1 = "", CardNumber = "", Deposit = "";
	int CustomerId;
	float balance = 0, Orio = 0, InitialCreditCardAmount = 0, TotalCreditCardAmount = 0, RemainingCreditCardAmount = 0 ;
%>

<%
			CustomerId = (Integer) session.getAttribute("customerId");
			Deposit = "Ανάληψη";
			CardNumber = (String) session.getAttribute("cardNumber");	
			Orio = (Float) session.getAttribute("orio");			
			balance = (Float) session.getAttribute("balance");				
			InitialCreditCardAmount = balance;						
			TotalCreditCardAmount1 = request.getParameter("TotalCreditCardAmount");								
			TotalCreditCardAmount = Float.parseFloat(TotalCreditCardAmount1);	
			
			RemainingCreditCardAmount = InitialCreditCardAmount - TotalCreditCardAmount;
			System.out.println(Orio);
			if (0 > RemainingCreditCardAmount) {
				//TODO analipsi > ipolipo
			}
			else if (0 <= RemainingCreditCardAmount) {
			balance = RemainingCreditCardAmount;						
			creditCardsTransaction.creditCardTransaction(CardNumber, CustomerId, Deposit, InitialCreditCardAmount, TotalCreditCardAmount, RemainingCreditCardAmount, Orio);
			creditCards.updateCreditCard(balance, CardNumber);
			session.setAttribute("updatecc", "Το πιστωτικό υπόλοιπο της κάρτας:("
					+ CardNumber + ") ανανεώθηκε!");
			response.sendRedirect("creditcard.jsp");
			}
			break;
		case NOACCESS:
			response.sendRedirect("errorpage.jsp");
			break;
		}
	}
%>