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
<body>
	<%@ include file="top.jsp"%>
	<div class="pageTop"></div>
	<div class="pageMain">
		<div class="contentArea">		
		<h1>Ιστορικό Κινήσεων</h1>
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
		
		
<% String showDiv = request.getParameter( "showDiv" ); %>
<script type="text/javascript">
	$(document).ready(function() {
		var showDiv="<%=showDiv%>";	
		if ( showDiv == "null" ) {
			$("#mySelect option[value='empty']").attr('selected', 'selected'); 
		}
		if ( showDiv == "Acc")
		{
			$('#table1').fadeIn();
		    $('#table2').hide();
		    $('#table3').hide();
		    $("#mySelect option[value='TypeAcc']").attr('selected', 'selected'); 
		}
		else if ( showDiv == "Cc" )
		{
			$('#table1').hide();
			$('#table2').fadeIn();
			$('#table3').hide();
			$("#mySelect option[value='TypeCc']").attr('selected', 'selected');
		}
		else if ( showDiv == "Loan")
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
					<option value="empty"></option>
						<%if (TypeAcc != "") {%>
							<option value="TypeAcc"><%=TypeAcc %></option>
							<% } if (TypeCc != "") {%>
							<option value="TypeCc"><%=TypeCc %></option>
							<% } if (TypeLoan != "") {%>
							<option value="TypeLoan">Δάνειο</option>
							<% } %>
					</select></td>

</table>


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

				   							
		</div>
		<div class="clear"></div>
	</div>
	<div class="clear"></div>
	<%@ include file="../footer.jsp"%>
</body>
</html>