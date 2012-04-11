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
				<div style="overflow: auto; height: 500px;">
					<table id="table-2">
						<caption>Στοιχεία δανείών</caption>
						<thead>
							<tr>
								<th>Αριθμός Λογαριασμού</th>
								<th>Είδος Λογαριασμόυ</th>
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
									Type = "Λογαριασμός";
									Limit = rs.getFloat("balance");
									Balance = rs.getFloat("balance");								
							%>
							<tr> 
								<td><%=AccountId%></td>								
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
								<td><%=CardNumber%></td>								
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
							<tr>
								<th></th>
								<th></th>
								<th></th>
								<th bgcolor="#ffffcc">Ποσό Δανείου</th>
								<th bgcolor="#ffffcc">Ποσό για εξόφληση</th>								
							</tr>						 						
							<tr> 
								<td><%=LoanId%></td>								
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