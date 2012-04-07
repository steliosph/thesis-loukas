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
<%@ page import="sql.CreditCardsTransactionRepository"%>
<%@ page language="java" import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="ccTransactions" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />

<%
	String desc, firstname, lastname, action;
	int ccTransactionId ;
	float orio, initialAmount, ccAmount, ccBalance, totalPayedAmount, remainingPayeeAmount;
	Timestamp ccTransactionTime; 
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
			<h1>Συνολική εικόνα συναλλαγων πιστωτικών καρτών</h1>
			<div>
				<div style="overflow: auto; height: 500px;">
					<table id="table-2">
						<thead>
							<tr>
								<th>Αρ. Συναλ.</th>
								<th>Όνομα</th>
								<th>Επώνυμο</th>
								<th>Περιγραφή</th>
								<th>Κατ./Ανά.</th>
								<th>Υπόλοιπο.</th>
								<th>Ποσό Κατ./Ανά.</th>								
								<th>Νέο Υπόλοιπο</th>
								<th>Όριο</th>
								<th>Ώρα Συναλ.</th>								
							</tr>
						</thead>
						<tbody>
							<%
							ResultSet rs = ccTransactions.getCcTransaction();
								while (rs.next()) {
									ccTransactionId = rs.getInt("credit_card_transaction_id");
									firstname = rs.getString("Firstname");
									lastname = rs.getString("lastname");
									desc = rs.getString("description");
									action = rs.getString("deposit");
									initialAmount = rs.getFloat("initial_credit_card_amount");
									totalPayedAmount = rs.getFloat("total_credit_card_Amount");
									remainingPayeeAmount = rs.getFloat("remaining_credit_card_amount");
									orio = rs.getFloat("orio");
									ccTransactionTime = rs.getTimestamp("credit_car_Transaction_Time");
							%>
							<tr> 
								<td><%=ccTransactionId%></td>
								<td><%=firstname%></td>
								<td><%=lastname%></td>
								<td><%=desc%></td>
								<td><%=action%></td>
 								<td><%=initialAmount%></td> 								
 								<td><%=totalPayedAmount%></td>
								<td><%=remainingPayeeAmount%></td>
								<td><%=orio%></td>
							    <td><%=ccTransactionTime%></td>							    			
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
