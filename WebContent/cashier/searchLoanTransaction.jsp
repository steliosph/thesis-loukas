<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>
<%@ page import="sql.LoanTransactionsRepository"%>
<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="loanTransactions" scope="page" class="sql.LoanTransactionsRepositoryImpl" />
<%
	String desc, firstname, lastname, Search, combobox;
	int loanTransactionId ;
	float loanAmount, loanBalance, totalPayedAmount, remainingPayeeAmount;
	Timestamp loanTransactionTime; 
%>
<script type="text/javascript" language="javascript"> 
function showHide() {
    var table = document.getElementById("table");
    if(table.style.display == "block") {
    	table.style.display = "none";
      }
    else {
    	table.style.display = "block";
    	table2.style.display = "none";
    }
}
	function openPage(pageURL)

 {
 window.location.href = pageURL;
 }
</script>
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
			<table ALIGN="center" border="1">
				<tr>
					<td ALIGN="center">Αναζήτηση</td>
					<td ALIGN="center">Όλες οι συναλλαγές</td>
				</tr>
				<tr>
					<td>
						<form action="searchLoanTransaction.jsp" method="post" style="padding: 0; margin: 0">
							<select name="searchCombo">
								<option value="searchId">Αρ. Συναλ.</option>
								<option value="searchFirst">Όνομα</option>
								<option value="searchLast">Επώνυμο</option>
								<option value="searchDesc">Περιγραφή</option>
								<option value="searchLoanAmount">Ποσό Δανείου</option>
								<option value="searchLoanBalance">Παλαίο Υπόλοιπο</option>
								<option value="searchTotalPayedAmount">Πληρωτέο Ποσό</option>
								<option value="searchRemainingPayeeAmount">Νέο Υπόλοιπο</option>						
							</select> 							
							<input type="text" name="search" id="search">
							<button type="submit" class="btn" value="Submit">
								<span>Aναζήτηση..</span>
							</button>
						</form>
					</td>
					<td>&nbsp;
						<button type="button" class="btn" value="Show-Hide"
							onclick="return showHide();">
							<span>Όλες οι συναλλαγές</span>
						</button>
					</td>
				</tr>
			</table>
			<br>			
			<div>
				<div  id="table" style="overflow: auto; height: 500px; display: none;">
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
				<div id="table2" style="overflow: auto; height: 500px; width: auto;">
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
				Search = request.getParameter("search");	
				combobox = request.getParameter("searchCombo");							
				if (combobox.equals("searchId") ) {				
					rs = loanTransactions.searchLoanTransactionId(Search); 
				}
				else if (combobox.equals("searchFirst") ) {
					rs = loanTransactions.searchLoanTransactionFirstname(Search);		
				}
				else if (combobox.equals("searchLast") ) {
					rs = loanTransactions.searchLoanTransactionLastname(Search);
				}				
				else if (combobox.equals("searchDesc") ) {
					rs = loanTransactions.searchLoanTransactionDesc(Search);
				}
				else if (combobox.equals("searchLoanAmount") ) {
					rs = loanTransactions.searchLoanTransactionLoanAmount(Search);
				}
				else if (combobox.equals("searchLoanBalance") ) {
					rs = loanTransactions.searchLoanTransactionLoanBalance(Search);
				}
				else if (combobox.equals("searchTotalPayedAmount") ) {
					rs = loanTransactions.searchLoanTransactionTotalPayedAmount(Search);
				}
				else if (combobox.equals("searchRemainingPayeeAmount") ) {
					rs = loanTransactions.searchLoanTransactionRemainingPayeeAmount(Search);
				}							
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
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>