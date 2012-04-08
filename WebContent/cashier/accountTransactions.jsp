<%@ page import="sql.AccountTransactionsRepository"%>
<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="accountTransactions" scope="page" class="sql.AccountTransactionsImpl" />
<%
	String desc, firstname, lastname, action;
	int accountTransactionId;
	float orio, initialAmount, accountAmount, accountBalance, totalPayedAmount, remainingPayeeAmount;
	Timestamp accountTransactionTime;
%>

<script type="text/javascript" language="javascript"> 
function showHide() {
    var table = document.getElementById("table");
    if(table.style.display == "block") {
    	table.style.display = "none";
      }
    else {
    	table.style.display = "block";
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
			<h1>Συνολική εικόνα συναλλαγων λογαριασμών</h1>
			<table ALIGN="center" border="1">
				<tr>
					<td ALIGN="center">Αναζήτηση</td>
					<td ALIGN="center">Όλες οι συναλλαγές</td>
				</tr>
				<tr>
					<td>
						<form action="searchAccountTransaction.jsp" method="post" style="padding: 0; margin: 0">
							<select name="searchCombo">
								<option value="searchId">Αρ. Συναλ.</option>
								<option value="searchFirst">Όνομα</option>
								<option value="searchLast">Επώνυμο</option>
								<option value="searchDesc">Περιγραφή</option>
								<option value="searchAction">Κατ./Ανά.</option>
								<option value="searchInitialAmount">Υπόλοιπο</option>
								<option value="searchTotalPayedAmount">Ποσό Κατ./Ανά.</option>
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
				<div id="table" style="overflow: auto; height: 500px; display: none;">
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
								<th>Ώρα Συναλ.</th>
							</tr>
						</thead>
						<tbody>
							<%
								ResultSet rs = accountTransactions.getAccountTransaction();
											while (rs.next()) {
												accountTransactionId = rs.getInt("account_transaction_id");
												firstname = rs.getString("Firstname");
												lastname = rs.getString("lastname");
												desc = rs.getString("description");
												action = rs.getString("action");
												initialAmount = rs.getFloat("initial_account_amount");
												totalPayedAmount = rs.getFloat("total_account_Amount");
												remainingPayeeAmount = rs.getFloat("remaining_account_amount");
												accountTransactionTime = rs.getTimestamp("account_Transacion_Time");
							%>
							<tr>
								<td><%=accountTransactionId%></td>
								<td><%=firstname%></td>
								<td><%=lastname%></td>
								<td><%=desc%></td>
								<td><%=action%></td>
								<td><%=initialAmount%></td>
								<td><%=totalPayedAmount%></td>
								<td><%=remainingPayeeAmount%></td>
								<td><%=accountTransactionTime%></td>
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
