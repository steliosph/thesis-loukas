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
	String Action = "Μεταφορά", OldBalanceS1, OldBalanceS2, NewBalanceS1, NewBalanceS2, TransferAmountS, AccountSel1, AccountSel2, TransferDesc, AccNumber1, AccNumber2, CardNumber;
	int CustomerId,AccountId, LoanId, AccId1, AccId2;
	float LoanAmount,Orio,NewBalance1, NewBalance2, OldBalance1, OldBalance2, TransferAmount;	
%>

<%
	CustomerId = (Integer) session.getAttribute("customerId");
	Orio = (Float) session.getAttribute("Orio");
	LoanAmount = (Float) session.getAttribute("LoanAmount");
	
	AccountSel1 = request.getParameter("AccountSel1");
	AccountSel2 = request.getParameter("AccountSel2");
	
	OldBalanceS1 = request.getParameter("Balance1"); 
	OldBalance1 = Float.parseFloat(OldBalanceS1);
	OldBalanceS2 = request.getParameter("Balance2");
	OldBalance2 = Float.parseFloat(OldBalanceS2);		
	
	NewBalanceS1 = request.getParameter("NewBalance1"); 
	NewBalance1 = Float.parseFloat(NewBalanceS1);
	NewBalanceS2 = request.getParameter("NewBalance2");
	NewBalance2 = Float.parseFloat(NewBalanceS2);	
		
	AccNumber1 = request.getParameter("AccNumber1");
	AccId1 = Integer.parseInt(AccNumber1);
	AccNumber2 = request.getParameter("AccNumber2");
	AccId2 = Integer.parseInt(AccNumber2);
	
	TransferAmountS = request.getParameter("TransferAmount");
	TransferAmount = Float.parseFloat(TransferAmountS);
	TransferDesc = request.getParameter("TransferDesc");
	if (AccountSel1.equals("TypeAcc") ) {			
		if (AccountSel2.equals("TypeCc") ) {
			TransferDesc = TransferDesc + " Aπό ταμιευτήριο σε πιστωτική κάρτα";
			creditCard.updateCreditCard(NewBalance2, AccNumber2);
			creditCardTransactions.creditCardTransaction(AccNumber2, CustomerId, Action, OldBalance2, TransferAmount, NewBalance2, Orio, TransferDesc);
		}
		if (AccountSel2.equals("TypeLoan") ) {
			TransferDesc = TransferDesc + " Aπό ταμιευτήριο σε δάνειο";
			NewBalance2 = OldBalance2 - TransferAmount;
			loan.updateLoan2(AccId2, CustomerId, NewBalance2);
			loanTransactions.loanTransaction(AccId2, CustomerId, LoanAmount, OldBalance2, TransferAmount, NewBalance2, TransferDesc);		
		}
		account.updateAccount(NewBalance1, AccId1);
		accountTransactions.accountTransaction(AccId1, CustomerId, Action, OldBalance1, TransferAmount, NewBalance1, TransferDesc);
	
	}
	
	if (AccountSel1.equals("TypeCc") ) {
		if (AccountSel2.equals("TypeAcc") ) {
			TransferDesc = TransferDesc + " Aπό πιστωτική κάρτα σε ταμιευτήριο";
			account.updateAccount(NewBalance2, AccId2);
			accountTransactions.accountTransaction(AccId2, CustomerId, Action, OldBalance2, TransferAmount, NewBalance2, TransferDesc);
		}
		if (AccountSel2.equals("TypeLoan") ) {
			TransferDesc = TransferDesc + " Aπό πιστωτική κάρτα σε δάνειο";
			NewBalance2 = OldBalance2 - TransferAmount;
			loan.updateLoan2(AccId2, CustomerId, NewBalance2);
			loanTransactions.loanTransaction(AccId2, CustomerId, LoanAmount, OldBalance2, TransferAmount, NewBalance2, TransferDesc);		
		}
		creditCard.updateCreditCard(NewBalance1, AccNumber1);
		creditCardTransactions.creditCardTransaction(AccNumber1, CustomerId, Action, OldBalance1, TransferAmount, NewBalance1, Orio, TransferDesc);				
	}

	

	response.getWriter().print("Η μεταφορά ολοκληρώθηκε με επιτυχία!!!");
%>