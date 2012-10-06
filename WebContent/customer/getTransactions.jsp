<%@ page import="java.text.DecimalFormat" %>
<%@page language="java" import="java.sql.*"%>
<jsp:useBean id="accountTransactions" scope="page" class="sql.AccountTransactionsImpl" />
<jsp:useBean id="creditCardTransactions" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />
<jsp:useBean id="loanTransactions" scope="page" class="sql.LoanTransactionsRepositoryImpl" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//TODO Limit availiability
	String Time,StartDate, EndDate, TransactionTimeText, AccountType, Action, TransactionTime, Desc;
	int CustomerId, TransactionId;
	float Balance, Poso, NewBalance;
	DecimalFormat df = new DecimalFormat( "#,##0.00" );
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

	StartDate = request.getParameter("StartDate");
	EndDate = request.getParameter("EndDate");
	String table = "<table id='table-2' class='sortable'><thead> <tr> <th>Αρ. Συναλ.</th><th>Περιγραφή</th><th>Ώρα Συναλ.</th><th>Ενέργεια</th><th>Υπόλοιπο</th><th>Ποσό</th><th>Νεο Υπολοιπο</th></tr></thead><tbody>";
	
	ResultSet rs;
	if (AccountType.equals("TypeAcc")) {
		if (TransactionTime.equals("date")) {
			rs = accountTransactions.selectTransactionsDate(CustomerId,StartDate, EndDate);
		} else if (TransactionTime.equals("limit 10") || (TransactionTime.equals("limit 20"))) {
			TransactionTime = " order by account_transaction_id DESC " + TransactionTime;
			rs = accountTransactions.selectTransactionsCustomer(CustomerId, TransactionTime);			
		}
		else {
			TransactionTime = TransactionTime + " order by account_transaction_id DESC";
			rs = accountTransactions.selectTransactionsCustomer(CustomerId, TransactionTime);
		}
		if (rs.next()) {
			response.getWriter().print(table);
			rs.beforeFirst();
			while (rs.next()) {
				TransactionId = rs.getInt("account_transaction_id");
				Desc = rs.getString("description");
				Time = rs.getString("account_transacion_time");
				Action = rs.getString("action");
				Balance = rs.getFloat("initial_account_amount");
				Poso = rs.getFloat("total_account_amount");
				NewBalance = rs.getFloat("remaining_account_amount");
				response.getWriter().print("<tr>");
				response.getWriter().print("<td align='center'>" + TransactionId + "</td>");
				response.getWriter().print("<td align='center'>" + Desc + "</td>");
				response.getWriter().print("<td align='center'>" + Time + "</td>");
				response.getWriter().print("<td align='center'>" + Action + "</td>");
				response.getWriter().print("<td align='center'>" + Balance + "</td>");
				response.getWriter().print("<td align='center'>" + Poso + "</td>");
				response.getWriter().print("<td align='center'>" + NewBalance + "</td>");
				response.getWriter().print("</tr>");
			}
		} else if (TransactionTime.equals("date")) {
			if (StartDate == "" || EndDate == "") {
				response.getWriter().print("<div class='center'> <p style='font-style:italic; color:red;'> Παρακαλώ καταχωρίστε ημερομηνίες.</p>");
			} else {
				response.getWriter().print("<div class='center'> <p style='font-style:italic; color:red;'> Δεν υπάρχουν συναλλαγές για τις ημερομηνίες που έχετε επιλέξει. <br>("+ StartDate + " - " + EndDate + ")</p>");
			}
		} else {		
			response.getWriter().print("<div class='center'> <p style='font-style:italic; color:red;'> Δεν υπάρχουν συναλλαγές για την περιοδο που έχετε επιλέξει. <br>("+ TransactionTimeText + ")</p>");
		}
	}
	if (AccountType.equals("TypeCc")) {
		if (TransactionTime.equals("date")) {
			rs = creditCardTransactions.selectTransactionsDate(CustomerId,StartDate, EndDate);
		} 
		else if (TransactionTime.equals("limit 10") || (TransactionTime.equals("limit 20"))) {
			TransactionTime = " order by credit_card_transaction_id DESC " + TransactionTime;
			rs = creditCardTransactions.selectTransactionsCustomer(CustomerId, TransactionTime);
		}
		else {
			TransactionTime = TransactionTime + " order by credit_card_transaction_id DESC";
			rs = creditCardTransactions.selectTransactionsCustomer(CustomerId, TransactionTime);
		}
		if (rs.next()) {
			response.getWriter().print(table);
			rs.beforeFirst();
			while (rs.next()) {
				TransactionId = rs.getInt("credit_card_transaction_id");
				Desc = rs.getString("description");
				Time = rs.getString("credit_car_transaction_time");
				Action = rs.getString("deposit");
				Balance = rs.getFloat("initial_credit_card_amount");
				Poso = rs.getFloat("total_credit_card_amount");
				NewBalance = rs.getFloat("remaining_credit_card_amount");
				response.getWriter().print("<tr>");
				response.getWriter().print("<td align='center'>" + TransactionId + "</td>");
				response.getWriter().print("<td align='center'>" + Desc + "</td>");
				response.getWriter().print("<td align='center'>" + Time + "</td>");
				response.getWriter().print("<td align='center'>" + Action + "</td>");
				response.getWriter().print("<td align='center'>" + Balance + "</td>");
				response.getWriter().print("<td align='center'>" + Poso + "</td>");
				response.getWriter().print("<td align='center'>" + NewBalance + "</td>");
				response.getWriter().print("</tr>");
			}
		} else if (TransactionTime.equals("date")) {
			if (StartDate == "" || EndDate == "") {
				response.getWriter().print("<div class='center'> <p style='font-style:italic; color:red;'> Παρακαλώ καταχωρίστε ημερομηνίες.</p>");
			} else {			
				response.getWriter().print("<div class='center'> <p style='font-style:italic; color:red;'> Δεν υπάρχουν συναλλαγές για τις ημερομηνίες που έχετε επιλέξει. <br>("+ StartDate + " - " + EndDate + ")</p>");
			}
		} else {		
			response.getWriter().print("<div class='center'> <p style='font-style:italic; color:red;'> Δεν υπάρχουν συναλλαγές για την περιοδο που έχετε επιλέξει. <br>("+ TransactionTimeText + ")</p>");
		}
	}
	if (AccountType.equals("TypeLoan")) {
		if (TransactionTime.equals("date")) {		
			rs = loanTransactions.selectTransactionsDate(CustomerId, StartDate, EndDate);
			}
		
		else if (TransactionTime.equals("limit 10") || (TransactionTime.equals("limit 20"))) {
			TransactionTime = " order by loan_transaction_id DESC " + TransactionTime;
			rs = loanTransactions.selectTransactionsCustomer(CustomerId,TransactionTime);
		}
		else {
			TransactionTime = TransactionTime + " order by loan_transaction_id DESC";
			rs = loanTransactions.selectTransactionsCustomer(CustomerId,TransactionTime);
		}
		if (rs.next()) {
			response.getWriter().print(table);
			rs.beforeFirst();
			while (rs.next()) {
				TransactionId = rs.getInt("loan_transaction_id");
				Desc = rs.getString("description");
				Time = rs.getString("loan_transaction_time");
				Action = "Κατάθεση";
				Balance = rs.getFloat("loan_balance");
				Poso = rs.getFloat("total_payed_amount");
				NewBalance = rs.getFloat("remaining_payee_amount");
				response.getWriter().print("<tr>");
				response.getWriter().print("<td align='center'>" + TransactionId + "</td>");
				response.getWriter().print("<td align='center'>" + Desc + "</td>");
				response.getWriter().print("<td align='center'>" + Time + "</td>");
				response.getWriter().print("<td align='center'>" + Action + "</td>");
				response.getWriter().print("<td align='center'>" + Balance + "</td>");
				response.getWriter().print("<td align='center'>" + Poso + "</td>");
				response.getWriter().print("<td align='center'>" + NewBalance + "</td>");
				response.getWriter().print("</tr>");
			}
		} 
	else if (TransactionTime.equals("date")) {
		if (StartDate == "" || EndDate == "") {
			response.getWriter().print("<div class='center'> <p style='font-style:italic; color:red;'> Παρακαλώ καταχωρίστε ημερομηνίες.</p>");
		} else {
			response.getWriter().print("<div class='center'> <p style='font-style:italic; color:red;'> Δεν υπάρχουν συναλλαγές για τις ημερομηνίες που έχετε επιλέξει. <br>("+ StartDate + " - " + EndDate + ")</p>");
		}
	} else {
		response.getWriter().print("<div class='center'> <p style='font-style:italic; color:red;'> Δεν υπάρχουν συναλλαγές για την περιοδο που έχετε επιλέξει. <br>("+ TransactionTimeText + ")</p>");
	}
}

	response.getWriter().println("</tbody></table>");
%>