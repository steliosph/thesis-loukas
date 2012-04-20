<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="account" scope="page" class="sql.AccountsRepositoryImpl" />
<jsp:useBean id="creditCard" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />
<jsp:useBean id="loans" scope="page" class="sql.LoansRepositoryImpl" />
<%
	String LoanDate = "", LoanLastTran = "", CcLastTran = "", AccLastTran = "", Address = "", City ="", AccDate = "", Firstname = "", Lastname = "", TypeAcc= "", TypeCc = "", TypeLoan = "", CardNumber = "";
	int CustomerId, AccountId = 0, LoanId = 0;
	float AccLimit, AccBalance, CcLimit, CcBalance, LoanLimit, LoanBalance;
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="SHORTCUT ICON" href="../images/favicon.ico" type="image/x-icon" />
</head>
<body onload="load()">
	<%@ include file="top.jsp"%>
	<div class="pageTop"></div>
	<div class="pageMain">
		<div class="contentArea">		
		<h1>Στοιχεία Λογαριασμού</h1>
		<%
			CustomerId = (Integer) session.getAttribute("customerId");
		
			ResultSet rs = account.selectAccount(CustomerId);
			while (rs.next()) {
				AccLastTran = rs.getString("account_transacion_time");
				Address = rs.getString("address");
				City = rs.getString("city");
				AccountId = rs.getInt("account_id");
				Firstname = rs.getString("Firstname");
				Lastname = rs.getString("lastname");
				AccLimit = rs.getFloat("balance");
				AccBalance = rs.getFloat("balance");
				TypeAcc = "Ταμιευτήριο";
				AccDate = rs.getString("date_created");
			}			
			rs = creditCard.selectAccount(CustomerId);
			while (rs.next()) {
				CcLastTran = rs.getString("credit_car_transaction_time");
				Address = rs.getString("address");
				City = rs.getString("city");
				CardNumber = rs.getString("card_number");
				Firstname = rs.getString("Firstname");
				Lastname = rs.getString("lastname");
				CcLimit = rs.getFloat("orio");
				CcBalance = rs.getFloat("balance");
				TypeCc = "Πιστωτική κάρτα";
			}			
			rs = loans.selectAccount(CustomerId);
			while (rs.next()) {
				LoanLastTran = rs.getString("loan_transaction_time");
				Address = rs.getString("address");
				City = rs.getString("city");
				LoanId = rs.getInt("loan_id");
				Firstname = rs.getString("Firstname");
				Lastname = rs.getString("lastname");
				LoanLimit = rs.getFloat("loan_amount");
				LoanBalance = rs.getFloat("remaining_payee_amount");	
				TypeLoan = rs.getString("type");
			}
	String showDiv = request.getParameter( "showDiv" ); %>
	
<script type="text/javascript">
	$(document).ready(function() {
		var showDiv="<%=showDiv%>";	
		var TypeAcc='<%=TypeAcc%>';
		var TypeCc='<%=TypeCc%>';
		var TypeLoan='<%=TypeLoan%>';
		if ( showDiv == "Acc" || TypeAcc != "")
		{
			$('#table1').fadeIn();
		    $('#table2').hide();
		    $('#table3').hide();
		    $("#mySelect option[value='TypeAcc']").attr('selected', 'selected'); 
		}
		else if ( showDiv == "Cc" || TypeCc != "" )
		{
			$('#table1').hide();
			$('#table2').fadeIn();
			$('#table3').hide();
			$("#mySelect option[value='TypeCc']").attr('selected', 'selected');
		}
		else if ( showDiv == "Loan" || TypeLoan != "")
		{
			$('#table1').hide();
			$('#table2').hide();
			$('#table3').fadeIn();
			$("#mySelect option[value='TypeLoan']").attr('selected', 'selected');
		}
			});
</script>		

			<table class="table-2">
				<tr>
					<td  bgcolor="#fffaaa">Επιλογή Λογαριασμού:</td>
					<td><select id="mySelect"; >
						<%if (TypeAcc != "") {%>
							<option value="TypeAcc"><%=TypeAcc %></option>
							<% } if (TypeCc != "") {%>
							<option value="TypeCc"><%=TypeCc %></option>
							<% } if (TypeLoan != "") {%>
							<option value="TypeLoan">Δάνειο</option>
							<% } %>
						</select>
					</td>
					
<script type="text/javascript">
$('#mySelect').change(function() {
	  if ($(this).val() == '') { 
		  $('#table1').hide();
		  $('#table2').hide();
		  $('#table3').hide();
	  }
	  if ($(this).val() == 'TypeAcc') { 
	     $('#table1').fadeIn();
	     $('#table2').hide();
	     $('#table3').hide();
	  }
	  if ($(this).val() == 'TypeCc') {
		  $('#table1').hide();
		  $('#table2').fadeIn();
		  $('#table3').hide();		 
	  }
	  if ($(this).val() == 'TypeLoan') {
		  $('#table1').hide();
		  $('#table2').hide();
		  $('#table3').fadeIn();
		  }
	});
</script>
</table>
<table id='table1' style="display: none;" class="table-2">
				</tr>
				<tr>
					<td bgcolor="#fffaaa">Αριθμός Λογαριασμού:</td>
					<td><%=AccountId%></td>
				</tr>
				<tr>
					<td bgcolor="#fffaaa">Τελευταία Ενημέρωση:</td>
					<td><%=AccLastTran%></td>
				</tr>
				<tr>
					<td bgcolor="#fffaaa">Είδος Λογαριασμού:</td>
					<td><%=TypeAcc%></td>
				</tr>
				<tr>
					<td bgcolor="#fffaaa"> Κάτοχος Λογαριασμού:</td>
					<td><%=Firstname%> <%=Lastname%></td>
				</tr>
				<tr>
					<td bgcolor="#fffaaa">Διεύθυνση Αλληλογραφίας:</td>
					<td><%=Address%> <%=City%></td>
				</tr>
				<tr>
					<td bgcolor="#fffaaa">Ημερομηνία Ανοίγματος:</td>
					<td><%=AccDate%></td>
				</tr>								
</table>
<table id='table2' style="display: none;"  class="table-2">
				</tr>
				<tr>
					<td bgcolor="#fffaaa">Αριθμός Λογαριασμού:</td>
					<td><%=CardNumber%></td>
				</tr>
				<tr>
					<td bgcolor="#fffaaa">Τελευταία Ενημέρωση:</td>
					<td><%=CcLastTran%></td>
				</tr>
				<tr>
					<td bgcolor="#fffaaa">Είδος Λογαριασμού:</td>
					<td><%=TypeCc%></td>
				</tr>
				<tr>
					<td bgcolor="#fffaaa"> Κάτοχος Λογαριασμού:</td>
					<td><%=Firstname%> <%=Lastname%></td>
				</tr>
				<tr>
					<td bgcolor="#fffaaa">Διεύθυνση Αλληλογραφίας:</td>
					<td><%=Address%> <%=City%></td>
				</tr>								
</table>
<table id='table3' style="display: none;"  class="table-2">
				</tr>
				<tr>
					<td bgcolor="#fffaaa">Αριθμός Λογαριασμού:</td>
					<td><%=AccountId%></td>
				</tr>
				<tr>
					<td bgcolor="#fffaaa">Τελευταία Ενημέρωση:</td>
					<td><%=LoanLastTran%></td>
				</tr>
				<tr>
					<td bgcolor="#fffaaa">Είδος Λογαριασμού:</td>
					<td><%=TypeLoan%></td>
				</tr>
				<tr>
					<td bgcolor="#fffaaa"> Κάτοχος Λογαριασμού:</td>
					<td><%=Firstname%> <%=Lastname%></td>
				</tr>
				<tr>
					<td bgcolor="#fffaaa">Διεύθυνση Αλληλογραφίας:</td>
					<td><%=Address%> <%=City%></td>
				</tr>							
</table>				   							
		</div>
		<div class="clear"></div>
	</div>
	<div class="clear"></div>
	<%@ include file="../footer.jsp"%>
</body>
</html>