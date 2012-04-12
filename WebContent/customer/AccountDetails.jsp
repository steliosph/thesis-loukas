<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="account" scope="page" class="sql.AccountsRepositoryImpl" />
<jsp:useBean id="creditCard" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />
<jsp:useBean id="loans" scope="page" class="sql.LoansRepositoryImpl" />
<%
	String Firstname, Lastname, TypeAcc= "", TypeCc = "", TypeLoan = "", CardNumber;
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
		<h1>Στοιχεία Λογαριασμού</h1>
		<%
			CustomerId = (Integer) session.getAttribute("customerId");
			ResultSet rs = account.selectAccount(CustomerId);
			while (rs.next()) {
				TypeAcc = "Ταμιευτήριο";
			}			
			rs = creditCard.selectAccount(CustomerId);
			while (rs.next()) {
				TypeCc = "Πιστωτική κάρτα";
			}			
			rs = loans.selectAccount(CustomerId);
			while (rs.next()) {
				TypeLoan = rs.getString("type");
			}
		%>
			<table>
				<tr>
					<td>Επιλογή Λογαριασμού:</td>
					<td><select>
						<%if (TypeAcc != "") {%>
							<option value="TypeAcc"><%=TypeAcc %></option>
							<% } if (TypeCc != "") {%>
							<option value="TypeCc"><%=TypeCc %></option>
							<% } if (TypeLoan != "") {%>
							<option value="TypeLoan"><%=TypeLoan %></option>
							<% } %>
					</select></td>
				</tr>
				<tr>
					<td>Αριθμός Λογαριασμού:</td>
					<td>row 1, cell 2</td>
				</tr>
				<tr>
					<td>Τελευταία Ενημέρωση:</td>
					<td>row 1, cell 2</td>
				</tr>
				<tr>
					<td>Είδος Λογαριασμού:</td>
					<td>row 1, cell 2</td>
				</tr>
				<tr>
					<td> Ονομασία Λογαριασμού:</td>
					<td>row 1, cell 2</td>
				</tr>
				<tr>
					<td>Διεύθυνση Αλληλογραφίας:</td>
					<td>row 1, cell 2</td>
				</tr>
				<tr>
					<td>Ημερομηνία Ανοίγματος / Κατάσταση:</td>
					<td>row 1, cell 2</td>
				</tr>
								
			</table>
				   
				 
				
		</div>
		<div class="clear"></div>
	</div>
	<div class="clear"></div>
	<%@ include file="../footer.jsp"%>
</body>
</html>