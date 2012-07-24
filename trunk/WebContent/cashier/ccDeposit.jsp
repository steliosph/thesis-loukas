<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="../css/fancybox.css" />
<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../js/jquery.overlabel.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var overlayColor = $('#fancybox-overlay')

		$(document).ready(function() {
			$("label.overlabel").overlabel();
		});
	});
</script>
</head>
<body>
<div id="reload">
<jsp:useBean id="creditCards" scope="page" class="sql.CreditCardsRepositoryImpl" />
<%!String cardNumber = "", Firstname = "", Lastname = "";
	int customerId; 
	float balance, orio; 
%>
<%
				cardNumber = request.getParameter("cardNumber");				
				ResultSet rs = creditCards.editCreditCard(cardNumber);
				if (rs.next()) {
					customerId = rs.getInt("customer_id");
					cardNumber = rs.getString("card_number");				
					balance = rs.getFloat("balance");
					orio = rs.getFloat("orio");
					Firstname = rs.getString("Firstname");
					Lastname = rs.getString("Lastname");
					session.setAttribute("cardNumber", cardNumber);
					session.setAttribute("balance", balance);
					session.setAttribute("orio", orio);
					session.setAttribute("customerId", customerId);
				}
%>
<form name="editform" id="ccDeposit" method="post" action="">
	<table width="320px">
		<tr>
			<td colspan=2 style="font-weight: bold;" align="center"><h2
					style="margin-bottom: -3px;">Κατάθεση Χρημάτων σε πιστωτική κάρτα</h2>
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
			<td>Υπόλοιπο:</td>
			<td><input type="text" id="balance" value="<%=balance%>"
				disabled="disabled" style="background: #E8E8E8;"></td>
		</tr>
		<tr>
			<td>Όριο:</td>
			<td><input type="text" id="orio" value="<%=orio%>"
				disabled="disabled" style="background: #E8E8E8;"></td>
		</tr>
		<tr>
			<td>Περιγραφή:</td>
			<td><input type="text" id="desc"></td>
		</tr>		
		<tr>
			<td>Ποσό κατάθεσης:</td>
			<td><input type="text" id="TotalCreditCardAmount" name=TotalCreditCardAmount value= ""></td>
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
	$("form#ccDeposit").submit(function() {
	var TotalCreditCardAmount = $('#TotalCreditCardAmount').attr('value');
	var desc = $('#desc').attr('value');
	if (TotalCreditCardAmount == "") {
		$('#correct').fadeOut(1600, "linear");		
		$('#empty').fadeIn(500).show();			 
				
	}	
	else {
		$.ajax({
			type: "POST",
			url: "updateCcDeposit.jsp",
			data: {"TotalCreditCardAmount": TotalCreditCardAmount, "desc": desc},
			success: function(result){
				$('#empty').fadeOut(1600, "linear");
				$('#correct').fadeOut(1600, "linear");	
				var result = $.trim(result);
				$('#reload').load('ccDeposit.jsp', {'cardNumber' : <%=cardNumber%>});
				setTimeout(function(){					
				if (result=='correct'){		
					$('#correct').fadeIn(500).show();
					$('#empty').fadeOut(1600, "linear");
						
					
				}			
			;},150);
				}
		});
	}
	return false;
	});
});
;
</script>
<div id="correct" style="display: none; color: red; ">
	<strong>Το υπόλοιπο της κάρτας:(<%=cardNumber%>) ανανεώθηκε! </strong>
</div>
<div id="empty" style="display: none; color: red; ">
	<strong>Το ποσο της κατάθεσης στην πιστωτική κάρτα (<%=cardNumber%>) δεν μπορεί να είναι κενό</strong>
</div>
</body>
</html>
