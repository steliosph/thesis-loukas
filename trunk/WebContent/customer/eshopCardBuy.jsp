<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="accountTransactions" scope="page" class="sql.AccountTransactionsImpl" />
<jsp:useBean id="account" scope="page" class="sql.AccountsRepositoryImpl" />

<jsp:useBean id="creditCardTransactions" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />
<jsp:useBean id="creditCard" scope="page" class="sql.CreditCardsRepositoryImpl" />

<%
//TODO Limit availiability
	String cardNumberPrev, eshopProvider, Action, eshopCardNumber, eshopCardValueS, OldBalanceS, NewBalanceS, AccountSel, AccNumber, CardNumber;
	int CustomerId,AccountId, LoanId, AccId;
	float Orio, NewBalance, OldBalance, eshopCardValue;
	
%>

<%

	Orio = (Float) session.getAttribute("Orio");

	CustomerId = (Integer) session.getAttribute("customerId");
	AccountSel = request.getParameter("AccountSel");
	
	OldBalanceS = request.getParameter("Balance"); 
	OldBalance = Float.parseFloat(OldBalanceS);	
	
	eshopCardValueS = request.getParameter("eshopCard"); 
	eshopCardValue = Float.parseFloat(eshopCardValueS);
	
	NewBalanceS = request.getParameter("NewBalance"); 
	NewBalance = Float.parseFloat(NewBalanceS);	
		
	eshopProvider = request.getParameter("eshopProvider");
	eshopCardNumber = request.getParameter("eshopCardNumber");
	AccNumber = request.getParameter("AccNumber");
	AccId = Integer.parseInt(AccNumber);
	
	Action="Αγορά Κάρτας " + eshopProvider + " αξίας: " + eshopCardValue + "0 €";
	cardNumberPrev = eshopCardNumber; 
	eshopCardNumber = "Κωδικός κάρτας: " + eshopCardNumber;
	
	if (AccountSel.equals("TypeAcc") ) {			
		account.updateAccount(NewBalance, AccId);
		accountTransactions.accountTransaction(AccId, CustomerId, Action, OldBalance, eshopCardValue, NewBalance, eshopCardNumber);
	}
	if (AccountSel.equals("TypeCc") ) {
		creditCard.updateCreditCard(NewBalance, AccNumber);
		creditCardTransactions.creditCardTransaction(AccNumber, CustomerId, Action, OldBalance, eshopCardValue, NewBalance, Orio, eshopCardNumber);
	}

	

	response.getWriter().print("Η αγορά κάρτας χρόνου ομιλίας από την εταιρία " + eshopProvider + " αξίας: " + eshopCardValue + "0 € ολοκληρώθηκε με επιτυχία!!! Ο 16-ψήφιος κωδικός της κάρτας είναι: " + cardNumberPrev);
%>