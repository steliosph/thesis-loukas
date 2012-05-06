<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="accountTransactions" scope="page" class="sql.AccountTransactionsImpl" />
<jsp:useBean id="account" scope="page" class="sql.AccountsRepositoryImpl" />

<jsp:useBean id="creditCardTransactions" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />
<jsp:useBean id="creditCard" scope="page" class="sql.CreditCardsRepositoryImpl" />

<jsp:useBean id="loanTransactions" scope="page" class="sql.LoanTransactionsRepositoryImpl" />
<jsp:useBean id="loan" scope="page" class="sql.LoansRepositoryImpl" />

<%
//TODO Limit availiability
	String BalanceS1, BalanceS2, TransferAmount, AccountSel1, AccountSel2, TransferDesc, AccNumber1, AccNumber2, CardNumber;
	int AccountId, LoanId, AccId1, AccId2;
	float Balance1, Balance2;
%>

<%
	AccountSel1 = request.getParameter("AccountSel1");
	AccountSel2 = request.getParameter("AccountSel2");
	BalanceS1 = request.getParameter("Balance1"); 
	Balance1 = Float.parseFloat(BalanceS1);
	BalanceS2 = request.getParameter("Balance2");
	Balance2 = Float.parseFloat(BalanceS2);	
	AccNumber1 = request.getParameter("AccNumber1");
	AccId1 = Integer.parseInt(AccNumber1);
	AccNumber2 = request.getParameter("AccNumber2");
	AccId2 = Integer.parseInt(AccNumber2);
	
	TransferAmount = request.getParameter("TransferAmount");
	TransferDesc = request.getParameter("TransferDesc");
	
	
	if (AccountSel1 == "TypeAcc") {
		account.updateAccount(Balance1, AccId1);
	}

	

	response.getWriter().print("Η μεταφορά ολοκληρώθηκε με επιτυχία!!!");
%>