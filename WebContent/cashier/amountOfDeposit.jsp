<%@ page import="enums.AccessRightsEnum"%>
<%@ page import="bean.AccessRights"%> 
<%
	Integer accountTypeId = (Integer) session
			.getAttribute("accountTypeId");
	AccessRights accessRights = new AccessRights();
	if (accountTypeId == null) {
		response.sendRedirect("../errorpage.jsp");
	} else {
		switch (accessRights.getAccessRights(accountTypeId)) {
			case DIRECTOR :
			case CASHIER :
%>
<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="../css/fancybox.css" />
<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../js/jquery.overlabel.min.js" type="text/javascript"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>
<script type="text/javascript">
<script type="text/javascript">
	$(document).ready(function() {
		var overlayColor = $('#fancybox-overlay')

		$(document).ready(function() {
			$("label.overlabel").overlabel();
		});
	});
</script>
</head>
<div id="reload">
<jsp:useBean id="loan" scope="page" class="sql.LoansRepositoryImpl" />
<%!String loanId1 = "", Firstname = "", Lastname = "";
	int loanId, customerId;
	float amount, remainingPayeeAmount;%>

<%
				loanId1 = request.getParameter("LoanId");
				loanId = Integer.parseInt(loanId1);
				System.out.println(loanId);
				ResultSet rs = loan.editLoan(loanId);
				if (rs.next()) {
					loanId = rs.getInt("loan_id");					
					amount = rs.getFloat("loan_amount");
					customerId = rs.getInt("customer_id");
					remainingPayeeAmount = rs.getFloat("remaining_payee_amount");
					Firstname = rs.getString("Firstname");
					Lastname = rs.getString("Lastname");
					session.setAttribute("customerId", customerId);
					session.setAttribute("loanId", loanId);
					session.setAttribute("amount", amount);
					session.setAttribute("remainingPayeeAmount", remainingPayeeAmount);
				}
%>


<form name="editform" id="aaa" method="post" action="" >
	<table width="300px">
		<tr>
			<td colspan=2 style="font-weight: bold;" align="center"><h2
					style="margin-bottom: -3px;">Κατάθεση Χρημάτων</h2>
				<div class="hr" style="margin-bottom: -3px;"></div></td>
		</tr>
		<tr>
			<td colspan=2 align="center" height="10px"></td>
		</tr>
				<tr>
			<td>Όνομα:</td>
			<td><input type="text" id="Firstname" value="<%=Firstname%>"
				disabled="disabled" style="background: #E8E8E8;"></td>
		</tr>
		<tr>
			<td>Επώνυμο:</td>
			<td><input type="text" id="Lastname" value="<%=Lastname%>"
				disabled="disabled" style="background: #E8E8E8;"></td>
		</tr>
		<tr>
			<td>Αρχικό Ποσό:</td>
			<td><input type="text" id="amount" value="<%=amount%>"
				disabled="disabled" style="background: #E8E8E8;" /></td>
		</tr>		
		<tr>
			<td>Ποσό εξόφλησης:</td>
			<td><input type="text" id="remainingPayeeAmount" value="<%=remainingPayeeAmount%>"
				disabled="disabled" style="background: #E8E8E8;" /></td>
		</tr>
		<tr>
			<td>Ποσό κατάθεσης:</td>
			<td><input type="text" id="TotalPayedAmount"></td>
		</tr>
		
	</table>
	<div class="hr" style="margin-bottom: -3px;"></div>
	<p class="right noMargin">
		<button type="submit" class="btn" value="Submit">
			<span>Save..</span>
		</button>
		<br>
</form>
</div>

<script>
$(document).ready(function(){
	$("form#aaa").submit(function() {
	var TotalPayedAmount = $('#TotalPayedAmount').attr('value');
		$.ajax({
			type: "POST",
			url: "updateDeposit.jsp",
			data: "TotalPayedAmount="+ TotalPayedAmount,
			success: function(result){
				var result = $.trim(result);
				
				$('#reload').load('amountOfDeposit.jsp', {'LoanId' : <%=loanId%>,});				
				if (result=='correct'){							
					$('#correct').fadeIn(500).show();
				}
				else {}
				}
		});
	return false;
	});
});
</script>

<div id="correct" style="display: none; color: red; ">
	<strong>Το ποσό για εξόφληση του δάνειο:(<%=loanId%>)
		ανανεώθηκε!
	</strong>
</div>
<div id="error" style="display: none; color: red; ">
	<strong>Το υπόλοιπο του λογαριασμού:(<%=loanId%>) δεν
		επαρκεί για αυτή την συναλλαγή!
	</strong>
</div>
</body>
</html>
<%
	break;
			case NOACCESS :
				response.sendRedirect("errorpage.jsp");
				break;
		}
	}
%>