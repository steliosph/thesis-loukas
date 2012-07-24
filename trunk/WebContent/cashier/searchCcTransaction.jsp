<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>
<%@ page import="java.text.NumberFormat" %> 
<%@ page import="sql.CreditCardsTransactionRepository"%>
<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="ccTransactions" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />
<%
	String desc, firstname, lastname, action, Search = "", combobox;
	int ccTransactionId ;
	float orio, initialAmount, ccAmount, ccBalance, totalPayedAmount, remainingPayeeAmount;
	Timestamp ccTransactionTime;
	
	NumberFormat nf = NumberFormat.getInstance();
	nf.setMaximumFractionDigits(2);
	nf.setMinimumFractionDigits(2);	
%>
<script type="text/javascript">
function showHide() {
	var error = document.getElementById("error");
	var table = document.getElementById("table");
	var table2 = document.getElementById("table2");
	
	if(table.style.display == "block") {
		table.style.display = "none";		
		if(error != null) {			 
			   error.style.display = "none";
			}		
	}
	else {
		if(error != null) {
			   error.style.display = "none";
			}
		if(table2 != null) {
			   table2.style.display = "none";
			}
		table.style.display = "block";		
	}
}
</script>
<html>
<head>
<script src="../js/sorttable.js"></script>
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
			<table id="table-2"> 
				<thead>
				<tr>
					<td ALIGN="center">Αναζήτηση</td>
					<td ALIGN="center">Όλες οι συναλλαγές</td>
				</tr>
				</thead>
				<tr>
					<td>
						<form action="searchCcTransaction.jsp" method="post" style="padding: 0; margin: 0">
							<select name="searchCombo">
								<option value="searchId">Αρ. Συναλ.</option>
								<option value="searchFirst">Όνομα</option>
								<option value="searchLast">Επώνυμο</option>
								<option value="searchDesc">Περιγραφή</option>
								<option value="searchAction">Κατ./Ανά.</option>
								<option value="searchInitialAmount">Υπόλοιπο</option>
								<option value="searchTotalPayedAmount">Ποσό Κατ./Ανά.</option>
								<option value="searchRemainingPayeeAmount">Νέο Υπόλοιπο</option>
								<option value="searchOrio">Όριο</option>						
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
				<div id="table" style="overflow: auto; max-height:500px; height: auto; display: none;">
					<table id="table-2" class="sortable">
						<thead>
							<tr>
								<th>Αρ. Συναλ.</th>
								<th>Όνομα</th>
								<th>Επώνυμο</th>
								<th>Περιγραφή</th>
								<th>Κατ./Ανά.</th>
								<th>Υπόλοιπο</th>
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
							<tr align='center'> 
								<td><%=ccTransactionId%></td>
								<td><%=firstname%></td>
								<td><%=lastname%></td>
								<td><%=desc%></td>
								<td><%=action%></td>
 								<td><%=nf.format(initialAmount)%></td> 								
 								<td><%=nf.format(totalPayedAmount)%></td>
								<td><%=nf.format(remainingPayeeAmount)%></td>
								<td><%=nf.format(orio)%></td>
							    <td><%=ccTransactionTime%></td>							    			
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<div class="clear"></div>
				<% 
				Search = request.getParameter("search");
				System.out.println(Search);
				if (Search != "" ) {			 		
				combobox = request.getParameter("searchCombo");							
				if (combobox.equals("searchId") ) {				
					rs = ccTransactions.searchCcTransactionId(Search); 
				}
				else if (combobox.equals("searchFirst") ) {
					rs = ccTransactions.searchCcTransactionFirstname(Search); 	
				}
				else if (combobox.equals("searchLast") ) {
					rs = ccTransactions.searchCcTransactionLastname(Search);
				}				
				else if (combobox.equals("searchDesc") ) {
					rs = ccTransactions.searchCcTransactionDesc(Search); 
				}
				else if (combobox.equals("searchAction") ) {
					rs = ccTransactions.searchCcTransactionAction(Search); 
				}
				else if (combobox.equals("searchInitialAmount") ) {
					rs = ccTransactions.searchCcTransactionInitialAmount(Search); 
				}
				else if (combobox.equals("searchTotalPayedAmount") ) {
					rs = ccTransactions.searchCcTransactionTotalPayedAmount(Search);
				}
				else if (combobox.equals("searchRemainingPayeeAmount") ) {
					rs = ccTransactions.searchCcTransactionRemainingPayeeAmount(Search);
				}	
				else if (combobox.equals("searchOrio") ) {
					rs = ccTransactions.searchCcTransactionOrio(Search); 
				}
				if (rs.next()) {
				%>
		<div id="table2" style="overflow: auto; max-height:500px; height: auto; width: auto;">
					<table id="table-2" class="sortable">
						<thead>
							<tr align='center'>
								<th>Αρ. Συναλ.</th>
								<th>Όνομα</th>
								<th>Επώνυμο</th>
								<th>Περιγραφή</th>
								<th>Κατ./Ανά.</th>
								<th>Υπόλοιπο</th>
								<th>Ποσό Κατ./Ανά.</th>								
								<th>Νέο Υπόλοιπο</th>
								<th>Όριο</th>
								<th>Ώρα Συναλ.</th>								
							</tr>
						</thead>
						<tbody>				
				<%
				rs.beforeFirst();
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
							<tr align='center'> 
								<td><%=ccTransactionId%></td>
								<td><%=firstname%></td>
								<td><%=lastname%></td>
								<td><%=desc%></td>
								<td><%=action%></td>
 								<td><%=nf.format(initialAmount)%></td> 								
 								<td><%=nf.format(totalPayedAmount)%></td>
								<td><%=nf.format(remainingPayeeAmount)%></td>
								<td><%=nf.format(orio)%></td>
							    <td><%=ccTransactionTime%></td>							    			
							</tr>
							<% } %>	
						</tbody>
					</table>
				</div>	
			<% } else {	%>			
<div class="center" id="error" style="font-size: 17pt; overflow: auto; font-style:italic; color:red;">Δεν υπάρχουν συναλλαγές με τα κριτήρια που έχετε εισάγει</div>
			<% } } else  { %>
<div class="center" id="error" style="font-size: 17pt; overflow: auto; font-style:italic; color:red;">Δεν υπάρχουν συναλλαγές με τα κριτήρια που έχετε εισάγει</div>							
			<% } %>													
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>