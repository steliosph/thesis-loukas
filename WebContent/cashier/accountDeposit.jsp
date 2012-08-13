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
	$(document).ready(function() {
		var overlayColor = $('#fancybox-overlay')

		$(document).ready(function() {
			$("label.overlabel").overlabel();
		});
	});
</script>
</head>
<div id="reload">
<jsp:useBean id="account" scope="page"
	class="sql.AccountsRepositoryImpl" />
<%!String AccountId1 = "", Firstname = "", Lastname = "";
	int CustomerId, AccountId;
	float Balance;%>
<%
	AccountId1 = request.getParameter("AccountId");
			AccountId = Integer.parseInt(AccountId1);
			ResultSet rs = account.editAccount(AccountId);
			if (rs.next()) {
				CustomerId = rs.getInt("customer_id");
				AccountId = rs.getInt("Account_Id");
				Balance = rs.getFloat("balance");
				Firstname = rs.getString("Firstname");
				Lastname = rs.getString("Lastname");
				session.setAttribute("CustomerId", CustomerId);
				session.setAttribute("Balance", Balance);
				session.setAttribute("AccountId", AccountId);
			}
%>
<form name="editform" id="accountDeposit" method="post" action="">

	<table width="320px">
		<tr>
			<td colspan=2 style="font-weight: bold;" align="center"><h2
					style="margin-bottom: -3px;">Κατάθεση Χρημάτων σε λογαριασμό</h2>
				<div class="hr" style="margin-bottom: -3px;"></div></td>
		</tr>
		<tr>
			<td colspan=2 align="center" height="10px"></td>
		</tr>
		<tr>
			<td>Όνομα:</td>
			<td><input type="text" id="AccountId" value="<%=Firstname%>"
				disabled="disabled" style="background: #E8E8E8;"></td>
		</tr>
		<tr>
			<td>Επώνυμο:</td>
			<td><input type="text" id="AccountId" value="<%=Lastname%>"
				disabled="disabled" style="background: #E8E8E8;"></td>
		</tr>
		<tr>
			<td>Υπόλοιπο:</td>
			<td><input type="text" id="Balance" value="<%=Balance%>"
				disabled="disabled" style="background: #E8E8E8;" /></td>
		</tr>
		<tr>
			<td>Περιγραφή:</td>
			<td><input type="text" id="desc"></td>
		</tr>
		<tr>
			<td>Ποσό κατάθεσης:</td>
			<td><input type="text" id="TotalAccountAmount"></td>
		</tr>
	</table>
	<div class="hr" style="margin-bottom: -3px;"></div>
	<p class="right noMargin">
		<button type="submit" class="btn" value="Submit">
			<span>Aποθήκευση..</span>
		</button>
		<br>
</form>
</div>
<script>
$(document).ready(function(){
	$("form#accountDeposit").submit(function() {
	var TotalAccountAmount = $('#TotalAccountAmount').attr('value');
	var desc = $('#desc').attr('value');
	if (TotalAccountAmount == "") {
		$('#empty').fadeIn(500).show();	
		$('#correct').fadeOut(1600, "linear");				
	}	
	else {
		$.ajax({
			type: "POST",
			url: "updateAccountDeposit.jsp",
			data: {"TotalAccountAmount": TotalAccountAmount, "desc": desc},
			success: function(result){	
				$('#empty').fadeOut(1600, "linear");
				$('#correct').fadeOut(1600, "linear");	
				var result = $.trim(result);
				$('#reload').load('accountDeposit.jsp', {'AccountId' : <%=AccountId%>,});
				setTimeout(function(){
				if (result=='correct'){		
					$('#empty').fadeOut(1600, "linear");
					$('#correct').fadeIn(500).show();			
				}			
				;},150);
					}
			});
		}
	return false;
	});
});
</script>
<div id="correct" style="display: none; color: red; ">
	<strong>Το υπόλοιπο του λογαριασμού:(<%=AccountId%>)
		ανανεώθηκε!
	</strong>
</div>
<div id="empty" style="display: none; color: red; ">
	<strong>Το ποσο της κατάθεσης στου λογαριασμού:(<%=AccountId%>) δεν μπορεί να είναι κενό</strong>
</div>
</body>
</html>