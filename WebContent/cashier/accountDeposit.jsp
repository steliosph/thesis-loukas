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
<script type="text/javascript">
	$(document).ready(function() {
		var overlayColor = $('#fancybox-overlay')

		$(document).ready(function() {
			$("label.overlabel").overlabel();
		});
	});
</script>
</head>

<jsp:useBean id="account" scope="page" class="sql.AccountsRepositoryImpl" />
<%!String AccountId1 = "";
	int CustomerId, AccountId; 
	float Balance; 
%>

<%
				AccountId1 = request.getParameter("AccountId");
				AccountId = Integer.parseInt(AccountId1);					
				ResultSet rs = account.editAccount(AccountId);
				if (rs.next()) {
					CustomerId = rs.getInt("customer_id");
					AccountId = rs.getInt("Account_Id");						
					Balance = rs.getFloat("balance");					
					session.setAttribute("CustomerId", CustomerId);
					session.setAttribute("Balance", Balance);
					session.setAttribute("AccountId", AccountId);
				}
%>


<form name="editform" method="post" action="updateAccountDeposit.jsp">
	<table width="300px">
		<tr>
			<td colspan=2 style="font-weight: bold;" align="center"><h2
					style="margin-bottom: -3px;">Κατάθεση Χρημάτων σε λογαριασμό</h2>
				<div class="hr" style="margin-bottom: -3px;"></div></td>
		</tr>

		<tr>
			<td colspan=2 align="center" height="10px"></td>
		</tr>
		<tr>
			<td>Ποσό της κατάθεσης:</td>
			<td><input type="text" name=TotalAccountAmount></td>
		</tr>
		
	</table>
	<div class="hr" style="margin-bottom: -3px;"></div>
	<p class="right noMargin">
		<button type="submit" class="btn" value="Submit">
			<span>Save..</span>
		</button>
		<br>
</form>
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