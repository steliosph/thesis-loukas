<%@page language="java" import ="java.sql.*" %>  
<jsp:useBean id="accountTransactions" scope="page" class="sql.AccountTransactionsImpl" />
<jsp:useBean id="creditCardTransactions" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />
<jsp:useBean id="loanTransactions" scope="page" class="sql.LoanTransactionsRepositoryImpl" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	String TransactionTimeText, AccountType, Action, TransactionTime, Desc ;
	int CustomerId, TransactionId;
	float Balance, Poso, NewBalance;
	Timestamp Time;
%>
<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
%>
<% 
	CustomerId = (Integer) session.getAttribute("customerId"); 
 	AccountType = request.getParameter("AccountType"); 	
 	TransactionTime = request.getParameter("TransactionTime");
 	TransactionTimeText = request.getParameter("TransactionTimeText");
	String table="<table class='table-2'><thead> <tr> <th>Αρ. Συναλ.</th><th>Περιγραφή</th><th>Ώρα Συναλ.</th><th>Αναλ./Κατ.</th><th>Υπόλοιπο</th><th>Ποσό</th><th>Νεο Υπολοιπο</th></tr></thead><tbody>";
	
	ResultSet rs;
	if (AccountType.equals("TypeAcc")) {				
		rs = accountTransactions.selectTransactionsCustomer(CustomerId, TransactionTime);	
		if (rs.next()) {
			response.getWriter().print(table);
		
			while(rs.next()){
				TransactionId = rs.getInt("account_transaction_id");
				Desc = rs.getString("description");
				Time = rs.getTimestamp("account_transacion_time");
				Action = rs.getString("action");
				Balance = rs.getFloat("initial_account_amount");
				Poso = rs.getFloat("total_account_amount");
				NewBalance = rs.getFloat("remaining_account_amount");		
				response.getWriter().print("<tr>");			
				response.getWriter().print("<td>" + TransactionId + "</td>"); 
				response.getWriter().print("<td>" + Desc + "</td>"); 
				response.getWriter().print("<td>" + Time + "</td>"); 
				response.getWriter().print("<td>" + Action + "</td>"); 
				response.getWriter().print("<td>" + Balance + "</td>"); 
				response.getWriter().print("<td>" + Poso + "</td>");
				response.getWriter().print("<td>" + NewBalance + "</td>"); 		
				response.getWriter().print("</tr>");
				}
		}
		else {
			response.getWriter().print("<div class='center'> <p style='font-style:italic; color:red;'> Δεν υπάρχουν συναλλαγές για την περιοδο που έχετε επιλέξει <br>(" + TransactionTimeText + ")</p>");
		}
	}
	if (AccountType.equals("TypeCc")) {
		rs = creditCardTransactions.selectTransactionsCustomer(CustomerId, TransactionTime);
		if (rs.next()) {
			response.getWriter().print(table);
		
			while(rs.next()){
				TransactionId = rs.getInt("credit_card_transaction_id");
				Desc = rs.getString("description");
				Time = rs.getTimestamp("credit_car_transaction_time");
				Action = rs.getString("deposit");
				Balance = rs.getFloat("initial_credit_card_amount");
				Poso = rs.getFloat("total_credit_card_amount");
				NewBalance = rs.getFloat("remaining_credit_card_amount");		
				response.getWriter().print("<tr>");			
				response.getWriter().print("<td>" + TransactionId + "</td>"); 
				response.getWriter().print("<td>" + Desc + "</td>"); 
				response.getWriter().print("<td>" + Time + "</td>"); 
				response.getWriter().print("<td>" + Action + "</td>"); 
				response.getWriter().print("<td>" + Balance + "</td>"); 
				response.getWriter().print("<td>" + Poso + "</td>");
				response.getWriter().print("<td>" + NewBalance + "</td>"); 		
				response.getWriter().print("</tr>");
				}
		}
		else {
			response.getWriter().print("<div class='center'> <p style='font-style:italic; color:red;'> Δεν υπάρχουν συναλλαγές για την περιοδο που έχετε επιλέξει <br>(" + TransactionTimeText + ")</p>");
		}
	}
	if (AccountType.equals("TypeLoan")) {
		rs = loanTransactions.selectTransactionsCustomer(CustomerId, TransactionTime);
		if (rs.next()) {
			response.getWriter().print(table);
			
			while(rs.next()){
				TransactionId = rs.getInt("loan_transaction_id");
				Desc = rs.getString("description");
				Time = rs.getTimestamp("loan_transaction_time");
				Action = "Κατάθεση";
				Balance = rs.getFloat("loan_balance");
				Poso = rs.getFloat("total_payed_amount");
				NewBalance = rs.getFloat("remaining_payee_amount");		
				response.getWriter().print("<tr>");			
				response.getWriter().print("<td>" + TransactionId + "</td>"); 
				response.getWriter().print("<td>" + Desc + "</td>"); 
				response.getWriter().print("<td>" + Time + "</td>"); 
				response.getWriter().print("<td>" + Action + "</td>"); 
				response.getWriter().print("<td>" + Balance + "</td>"); 
				response.getWriter().print("<td>" + Poso + "</td>");
				response.getWriter().print("<td>" + NewBalance + "</td>"); 		
				response.getWriter().print("</tr>");
				}	
		}	
		else {
			response.getWriter().print("<div class='center'> <p style='font-style:italic; color:red;'> Δεν υπάρχουν συναλλαγές για την περιοδο που έχετε επιλέξει <br>(" + TransactionTimeText + ")</p>");
		}
	}
    
	response.getWriter().println("</tbody>");
%>