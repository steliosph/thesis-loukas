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

<jsp:useBean id="loan" scope="page" class="sql.LoansRepositoryImpl" />
<%!String loanId1 = "";
	int loanId = 0, customerId=0;
	float amount, remainingPayeeAmount;%>

<%
				loanId1 = request.getParameter("loanId");
				loanId = Integer.parseInt(loanId1);
				ResultSet rs = loan.editLoan(loanId);
				if (rs.next()) {
					loanId = rs.getInt("loan_id");					
					amount = rs.getFloat("loan_amount");
					customerId = rs.getInt("customer_id");
					remainingPayeeAmount = rs.getFloat("remaining_payee_amount");
					session.setAttribute("customerId", customerId);
					session.setAttribute("loanId", loanId);
					session.setAttribute("amount", amount);
					session.setAttribute("remainingPayeeAmount", remainingPayeeAmount);
				}
%>


<form name="editform" method="post" action="updateDeposit.jsp">
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
			<td>Ποσό της κατάθεσης:</td>
			<td><input type="text" name=TotalPayedAmount></td>
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