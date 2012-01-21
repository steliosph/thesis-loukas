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

<jsp:useBean id="customer" scope="page"
	class="sql.CustomersRepositoryImpl" />

<%!String customerId1 = "", firstname = "", lastname = "", address = "",
			city = "", postalCode = "", telephone = "";
	int customerId = 0, addressId = 0;%>
<%
	customerId1 = request.getParameter("customerId");
	customerId = Integer.parseInt(customerId1);
	ResultSet rs = customer.editCustomer(customerId);
	if (rs.next()) {
		addressId = rs.getInt("address.address_id");

		System.out.println(addressId);
		System.out.println(customerId);		
		customerId = rs.getInt("customer_id");
		firstname = rs.getString("firstname");
		lastname = rs.getString("lastname");
		address = rs.getString("address");
		city = rs.getString("city");
		postalCode = rs.getString("postal_code");
		telephone = rs.getString("telephone");
	
		session.setAttribute("addressId", addressId);
		session.setAttribute("customerId", customerId);
	}
%>

<form name="editform" method="post" action="updatecustomers.jsp">
	<table width="300px">
		<tr>
			<td colspan=2 style="font-weight: bold;" align="center"><h2
					style="margin-bottom: -3px;">Επεξεργασία Πελάτη</h2>
				<div class="hr" style="margin-bottom: -3px;"></div></td>
		</tr>

		<tr>
			<td colspan=2 align="center" height="10px"></td>
		</tr>
		<tr>
			<td>Όνομα:</td>
			<td><input type="text" name="firstname" value="<%=firstname%>"></td>
		</tr>
		<tr>
			<td>Επώνυμο:</td>
			<td><input type="text" name="lastname" value="<%=lastname%>"></td>
		</tr>
		<tr>
			<td>Διεύθυνση:</td>
			<td><input type="text" name="address" value="<%=address%>"></td>
		</tr>
		<tr>
			<td>Πόλη:</td>
			<td><input type="text" name="city" value="<%=city%>"></td>
		</tr>
		<tr>
			<td>Τ.Κ:</td>
			<td><input type="text" name="postalCode" value="<%=postalCode%>"></td>
		</tr>
		<tr>
			<td>Τηλέφωνο:</td>
			<td><input type="text" name="telephone" value="<%=telephone%>"></td>
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