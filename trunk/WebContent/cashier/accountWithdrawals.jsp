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
		case DIRECTOR:
		case CASHIER:
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
				//System.out.println(AccountId);
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


	<form name="accountWithdrawals" id="accountWithdrawals" method="post" action="">
		<table width="330px">
			<tr>
				<td colspan=2 style="font-weight: bold;" align="center"><h2
						style="margin-bottom: -3px;">Ανάληψη Χρημάτων απο λογαριασμό</h2>
					<div class="hr" style="margin-bottom: -3px;"></div></td>
			</tr>

			<tr>
				<td colspan=2 align="center" height="10px"></td>
			</tr>
			<tr>
				<td>Όνομα:</td>
				<td><input type="text" id="AccountId" value="<%=Firstname%>"
					disabled="disabled" style="background:#E8E8E8;"></td>
			</tr>
			<tr>
				<td>Επώνυμο:</td>
				<td><input type="text" id="AccountId" value="<%=Lastname%>"
					disabled="disabled" style="background:#E8E8E8;"></td>
			</tr>
			<tr>
				<td>Υπόλοιπο:</td>
				<td><input type="text" id="Balance" value="<%=Balance%>"
					disabled="disabled" style="background:#E8E8E8;" /></td>
			</tr>
			<tr>
				<td>Ποσό ανάληψης:</td>
				<td><input type="text" id="TotalAccountAmount" value=""></td>
			</tr>

		</table>
		<div class="hr" style="margin-bottom: -3px;"></div>
		<p class="right noMargin">
			<button type="submit" id="subbtn" class="btn" value="Submit" >
				<span>Save..</span>
			</button>
			<br>
</form>	

</div>

<script>
$(document).ready(function(){
	$("form#accountWithdrawals").submit(function() {
	var TotalAccountAmount = $('#TotalAccountAmount').attr('value');
		$.ajax({
			type: "POST",
			url: "updateAccountWithdrawals.jsp",
			data: "TotalAccountAmount="+ TotalAccountAmount,
			success: function(result){
				var result = $.trim(result);
				
				$('#reload').load('accountWithdrawals.jsp', {'AccountId' : <%=AccountId%>,});
				//$('#loading').fadeIn(500).show();
				//alert(result);			
			 
				setTimeout(function(){
					//$("#loading").show().delay(100).fadeOut();					
				if (result=='correct'){
					$('#error').fadeOut(1600, "linear");								
					$('#correct').fadeIn(500).show();
				} else {
					$('#correct').fadeOut(1600, "linear");				
					$('#error').fadeIn(500).show();	
				}			
			;},150);
				}
		});
	return false;
	});
});
;
</script>

 
<div id="loading" style="display: none;">
	<img src="../images/fancybox/loading.gif"/> 
</div>
<div id="correct" style="display: none; color: red; ">
	<strong>Το υπόλοιπο του λογαριασμού:(<%=AccountId%>)
		ανανεώθηκε!
	</strong>
</div>
<div id="error" style="display: none; color: red; ">
	<strong>Το υπόλοιπο του λογαριασμού:(<%=AccountId%>) δεν
		επαρκεί για αυτή την συναλλαγή!
	</strong>
</div>
</body>
</html>
<%
	break;
		case NOACCESS:
			response.sendRedirect("errorpage.jsp");
			break;
		}
	}
%>