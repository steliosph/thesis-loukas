
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="sql.AccountTransactionsRepository"%>
<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="accountTransactions" scope="page"
	class="sql.AccountTransactionsImpl" />
<%
	String desc, firstname, lastname, action, Search = "", combobox;
	int accountTransactionId;
	float orio, initialAmount, accountAmount, accountBalance, totalPayedAmount, remainingPayeeAmount;
	Timestamp accountTransactionTime;

	NumberFormat nf = NumberFormat.getInstance();
	nf.setMaximumFractionDigits(2);
	nf.setMinimumFractionDigits(2);
%>
<script type="text/javascript">
	function showHide() {
		var error = document.getElementById("error");
		var table = document.getElementById("table");
		var table2 = document.getElementById("table2");

		if (table.style.display == "block") {
			table.style.display = "none";
			if (error != null) {
				error.style.display = "none";
			}
		} else {
			if (error != null) {
				error.style.display = "none";
			}
			if (table2 != null) {
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
			<h1>Συνολική εικόνα συναλλαγων λογαριασμών</h1>
			<table id="table-2">
				<thead>
					<tr>
						<td ALIGN="center">Αναζήτηση</td>
						<td ALIGN="center">Όλες οι συναλλαγές</td>
					</tr>
				</thead>
				<tr>
					<td>
						<form action="searchAccountTransaction.jsp" method="post"
							style="padding: 0; margin: 0">
							<select name="searchCombo">
								<option value="searchId">Αρ. Συναλ.</option>
								<option value="searchFirst">Όνομα</option>
								<option value="searchLast">Επώνυμο</option>
								<option value="searchDesc">Περιγραφή</option>
								<option value="searchAction">Κατ./Ανά.</option>
								<option value="searchInitialAmount">Υπόλοιπο</option>
								<option value="searchTotalPayedAmount">Ποσό Κατ./Ανά.</option>
								<option value="searchRemainingPayeeAmount">Νέο Υπόλοιπο</option>
							</select> <input type="text" name="search" id="search">
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
				<div id="table"
					style="overflow: auto; max-height: 500px; height: auto; display: none;">
					<%
						ResultSet rs = accountTransactions.getAccountTransaction();
						if (rs.next()) {
					%>
					<table id="table-2" class="sortable">
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
								rs.beforeFirst();
									while (rs.next()) {
										accountTransactionId = rs.getInt("account_transaction_id");
										firstname = rs.getString("Firstname");
										lastname = rs.getString("lastname");
										desc = rs.getString("description");
										action = rs.getString("action");
										initialAmount = rs.getFloat("initial_account_amount");
										totalPayedAmount = rs.getFloat("total_account_Amount");
										remainingPayeeAmount = rs
												.getFloat("remaining_account_amount");
										accountTransactionTime = rs
												.getTimestamp("account_Transacion_Time");
							%>
							<tr align='center'>
								<td><%=accountTransactionId%></td>
								<td><%=firstname%></td>
								<td><%=lastname%></td>
								<td><%=desc%></td>
								<td><%=action%></td>
								<td><%=nf.format(initialAmount)%></td>
								<td><%=nf.format(totalPayedAmount)%></td>
								<td><%=nf.format(remainingPayeeAmount)%></td>
								<td><%=accountTransactionTime%></td>
							</tr>
						</tbody>
					</table>
					<%
						}
						} else {
					%>
					<div class="center" id="error3"
						style="font-size: 17pt; overflow: auto; font-style: italic; color: red;">Δεν
						υπάρχουν συναλλαγές στην ενότητα των λογαριασμών.</div>
					<%
						}
					%>
				</div>
				<div class="clear"></div>
				<%
					Search = request.getParameter("search");
					System.out.println(Search);
					if (Search != "") {
						combobox = request.getParameter("searchCombo");
						if (combobox.equals("searchId")) {
							rs = accountTransactions.searchAccountTransactionId(Search);
						} else if (combobox.equals("searchFirst")) {
							rs = accountTransactions
									.searchAccountTransactionFirstname(Search);
						} else if (combobox.equals("searchLast")) {
							rs = accountTransactions
									.searchAccountTransactionLastname(Search);
						} else if (combobox.equals("searchDesc")) {
							rs = accountTransactions
									.searchAccountTransactionDesc(Search);
						} else if (combobox.equals("searchAction")) {
							rs = accountTransactions
									.searchAccountTransactionAction(Search);
						} else if (combobox.equals("searchInitialAmount")) {
							rs = accountTransactions
									.searchAccountTransactionInitialAmount(Search);
						} else if (combobox.equals("searchTotalPayedAmount")) {
							rs = accountTransactions
									.searchAccountTransactionTotalPayedAmount(Search);
						} else if (combobox.equals("searchRemainingPayeeAmount")) {
							rs = accountTransactions
									.searchAccountTransactionRemainingPayeeAmount(Search);
						}
						if (rs.next()) {
				%>
				<div id="table2"
					style="overflow: auto; max-height: 500px; height: auto; width: auto;">
					<table id="table-2" class="sortable">
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
								rs.beforeFirst();
										while (rs.next()) {
											accountTransactionId = rs
													.getInt("account_transaction_id");
											firstname = rs.getString("Firstname");
											lastname = rs.getString("lastname");
											desc = rs.getString("description");
											action = rs.getString("action");
											initialAmount = rs.getFloat("initial_account_amount");
											totalPayedAmount = rs.getFloat("total_account_Amount");
											remainingPayeeAmount = rs
													.getFloat("remaining_account_amount");
											accountTransactionTime = rs
													.getTimestamp("account_Transacion_Time");
							%>
							<tr align='center'>
								<td><%=accountTransactionId%></td>
								<td><%=firstname%></td>
								<td><%=lastname%></td>
								<td><%=desc%></td>
								<td><%=action%></td>
								<td><%=nf.format(initialAmount)%></td>
								<td><%=nf.format(totalPayedAmount)%></td>
								<td><%=nf.format(remainingPayeeAmount)%></td>
								<td><%=accountTransactionTime%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<%
					} else {
				%>
				<div class="center" id="error"
					style="font-size: 17pt; overflow: auto; font-style: italic; color: red;">Δεν
					υπάρχουν συναλλαγές με τα κριτήρια που έχετε εισάγει.</div>
				<%
					}
					} else {
				%>
				<div class="center" id="error"
					style="font-size: 17pt; overflow: auto; font-style: italic; color: red;">Δεν
					υπάρχουν συναλλαγές με τα κριτήρια που έχετε εισάγει.</div>
				<%
					}
				%>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>