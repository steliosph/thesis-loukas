<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="account" scope="page" class="sql.AccountsRepositoryImpl" />
<jsp:useBean id="creditCard" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />
<jsp:useBean id="loans" scope="page" class="sql.LoansRepositoryImpl" />
<%
	String Firstname, Lastname, Type, CardNumber;
	int CustomerId, AccountId, LoanId;
	float Limit, Balance;
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="SHORTCUT ICON" href="../images/favicon.ico"
	type="image/x-icon" />
</head>
<body>
	<%@ include file="top.jsp"%>
	<div class="pageTop"></div>
	<div class="pageMain">
		<div class="contentArea">
			<h1>Εικόνα Υπολοίπων</h1>		
			<div>
				<div style="overflow: auto; height: auto;">
					<table class="table-2">
						<caption>Στοιχεία Λογαριασμών</caption>
						<thead>
							<tr>
								<th>Aρ. Λογ.</th>
								<th>Είδος Λογαριασμού</th>
								<th>Κάτοχος Λογαριασμού</th>
								<th>Όριο</th>
								<th>Υπόλοιπο</th>
								
							</tr>
						</thead>
						<tbody>
							<%	
							CustomerId = (Integer) session.getAttribute("customerId");
							ResultSet rs = account.selectAccount(CustomerId);
								while (rs.next()) {
									AccountId = rs.getInt("account_id");
									Firstname = rs.getString("Firstname");
									Lastname = rs.getString("lastname");
									Type = "Ταμιευτήριο";
									Limit = rs.getFloat("balance");
									Balance = rs.getFloat("balance");								
							%>
							<tr> 
								<td><a href= "AccountDetails.jsp?showDiv=Acc"><%=AccountId%></a> <a href="TransactionHistory.jsp?showDiv=Acc&TransactionsSelect=l10t"> <img src="../images/10t.png" align="right"> </a></td>								
 								<td><%=Type%></td>
 								<td><%=Firstname%> <%=Lastname%></td>
 								<td><%=Limit%></td>
								<td><%=Balance%></td>
							</tr>
							<%
								}
							%>
							
							<%
							rs = creditCard.selectAccount(CustomerId);
								while (rs.next()) {
									CardNumber = rs.getString("card_number");
									Firstname = rs.getString("Firstname");
									Lastname = rs.getString("lastname");
									Type = "Πιστωτική κάρτα";
									Limit = rs.getFloat("orio");
									Balance = rs.getFloat("balance");								
							%>
							<tr> 
								<td><a href= "AccountDetails.jsp?showDiv=Cc"><%=CardNumber%></a> <a href="TransactionHistory.jsp?showDiv=Cc&TransactionsSelect=l10t"> <img src="../images/10t.png" align="right"></a></td> 								
 								<td><%=Type%></td>
 								<td><%=Firstname%> <%=Lastname%></td>
 								<td><%=Limit%></td>
								<td><%=Balance%></td>
							</tr>
							<%
								}							
							rs = loans.selectAccount(CustomerId);
								while (rs.next()) {
									LoanId = rs.getInt("loan_id");
									Firstname = rs.getString("Firstname");
									Lastname = rs.getString("lastname");
									Type = rs.getString("type");
									Limit = rs.getFloat("loan_amount");
									Balance = rs.getFloat("remaining_payee_amount");								
							%>	
							<thead>												 
							<tr>
								<th bgcolor="#f2f2f2"></th>
								<th bgcolor="#f2f2f2"></th>
								<th bgcolor="#f2f2f2"></th>
								<th>Ποσό Δανείου</th>
								<th>Ποσό για εξόφληση</th>								
							</tr>	
							</thead>					 						
							<tr> 
								<td><a href= "AccountDetails.jsp?showDiv=Loan"><%=LoanId%></a> <a href="TransactionHistory.jsp?showDiv=Loan&TransactionsSelect=l10t"><img src="../images/10t.png" align="right"></a></td>								
 								<td><%=Type%></td>
 								<td><%=Firstname%> <%=Lastname%></td>
 								<td><%=Limit%></td>
								<td><%=Balance%></td>
							</tr>
							<%
								}
							%>
							
						</tbody>
					</table>
				</div>
				<div class="clear"></div>
			</div>		
		
		</div>
		<div class="clear"></div>
	</div>
	<div class="clear"></div>
	<%@ include file="../footer.jsp"%>
</body>
</html>