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
<%!String loanId1 = "", type = "", status = "";
	int loanId = 0, customerId = 0;
	float amount = 0;%>

<%
	loanId1 = request.getParameter("loanId");
	if (loanId1 != null)
		loanId = Integer.parseInt(loanId1);
	ResultSet rs = loan.editLoan(loanId);
	if (rs.next()) {
		loanId = rs.getInt("loan_id");
		customerId = rs.getInt("customer_id");
		amount = rs.getFloat("loan_amount");
		type = rs.getString("type");
		status = rs.getString("status");
	}
%>

<form name="editform" method="post" action="update.jsp">
	<table align="center" width="300px"
		style="background-color: #EDF6EA; border: 1px solid #000000;">
		<tr>
			<td colspan=2 style="font-weight: bold;" align="center">Επεξεργασία Δανείου</td>
		</tr>
		<tr>
			<td colspan=2 align="center" height="10px"></td>
		</tr>
		<tr>
			<td>LoadID</td>
			<td><input type="text" name="branchid" value="<%=loanId%>"></td>
		</tr>
		<tr>
			<td>Id Πελάτη</td>
			<td><input type="text" name="branchid" value="<%=customerId%>"></td>
		</tr>
		<tr>
			<td>Ποσό</td>
			<td><input type="text" name="address" value="<%=amount%>"></td>
		</tr>
		<tr>
			<td>Tύπος</td>
			<td><input type="text" name="city" value="<%=type%>"></td>
		</tr>
		<tr>
			<td><label for="name">Κατάσταση: </label></td>
			<td><select name="status">
					<OPTION SELECTED VALUE="<%=status%>"></OPTION>
					<option value="egkrithike">Εκκρεμεί</option>
					<option value="egkrithike">'Εγκριση</option>
					<option value="aporipsi">Απόρριψη</option>
			</select></td>



		</tr>
		<tr>
			<td></td>
			<td><input type="submit" name="Submit" value="Update"
				style="background-color: #49743D; font-weight: bold; color: #ffffff;"></td>
		</tr>
		<tr>
			<td colspan=2 align="center" height="10px"></td>
		</tr>
	</table>
	<br>
</form>
</body>
</html>