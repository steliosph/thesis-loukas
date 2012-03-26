<%@ page import="enums.AccessRightsEnum"%>
<%@ page import="bean.AccessRights"%>

<%	
	Integer accountTypeId = (Integer) session.getAttribute("accountTypeId");
	AccessRights accessRights = new AccessRights();
	if (accountTypeId == null) {
		response.sendRedirect("../errorpage.jsp");
	} else {
	switch (accessRights.getAccessRights(accountTypeId)) {
	case DIRECTOR:
	case CASHIER:
%>
<%@ page import="sql.LoanTransactionsRepository"%>
<%@ page language="java" import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="loanTransactions" scope="page" class="sql.LoanTransactionsRepositoryImpl" />

<%
	String desc = "", firstname = "", lastname = "";
	int loanTransactionId ;
	float loanAmount, loanBalance, totalPayedAmount, remainingPayeeAmount;
	Timestamp loanTransactionTime; 
%>
 
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />
    
</head>
<body>
	<%@ include file="top.jsp"%>
	<div class="pageTop"></div>
	<div class="pageMain">
		<div class="contentArea">
			<!-- Main Menu Links -->
		<%@ include file="menu.jsp"%>
			<h1>Συνολική εικόνα συναλλαγων δανείων</h1>
			<div>
				<div style="overflow: auto; height: 500px;">
					<table id="table-2">
						<thead>
							<tr>
								<th>Αρ. Συναλ.</th>
								<th>Όνομα</th>
								<th>Επώνυμο</th>
								<th>Περιγραφή</th>
								<th>Ποσό Δανείου</th>
								<th>Παλαίο Υπόλοιπο</th>
								<th>Πληρωτέο Ποσό</th>
								<th>Νέο Υπόλοιπο</th>
								<th>Ώρα Συναλ.</th>								
							</tr>
						</thead>
						<tbody>
							<%
							ResultSet rs = loanTransactions.getLoanTransaction();
								while (rs.next()) {
									loanTransactionId = rs.getInt("loan_transaction_id");
									firstname = rs.getString("Firstname");
									lastname = rs.getString("lastname");
									desc = rs.getString("description");
									loanAmount = rs.getFloat("loan_amount");
									loanBalance = rs.getFloat("loan_balance");
									totalPayedAmount = rs.getFloat("total_Payed_Amount");
									remainingPayeeAmount = rs.getFloat("remaining_payee_amount");
									loanTransactionTime = rs.getTimestamp("loan_Transaction_Time");
							%>
							<tr> 
								<td><%=loanTransactionId%></td>
								<td><%=firstname%></td>
								<td><%=lastname%></td>
								<td><%=desc%></td>
 								<td><%=loanAmount%></td>
 								<td><%=loanBalance%></td>
								<td><%=totalPayedAmount%></td>
								<td><%=remainingPayeeAmount%></td>
							    <td><%=loanTransactionTime%></td>							    			
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
	<%@ include file="../footer.jsp"%>
</body>
</html>
<%
	break;
	case NOACCESS:
		response.sendRedirect("errorpage.jsp");
	break;
	}}
%>
