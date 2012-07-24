<%@ page import="enums.AccessRightsEnum"%>
<%@ page import="bean.AccessRights"%>

<%	
	Integer accountTypeId = (Integer) session.getAttribute("accountTypeId");
	AccessRights accessRights = new AccessRights();
	if (accountTypeId == null) {
		response.sendRedirect("../errorpage.jsp");
	} else {
	switch (accessRights.getAccessRights(accountTypeId)) {
	case DIRECTOR:
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
<div id="reload">
<jsp:useBean id="customer" scope="page" class="sql.CustomersRepositoryImpl" />

<%!String customerId1, firstname, lastname, address, city, postalCode, telephone;
	int customerId, addressId;%>
<%
	customerId1 = request.getParameter("customerId");
	customerId = Integer.parseInt(customerId1);
	ResultSet rs = customer.editCustomer(customerId);
	if (rs.next()) {
		addressId = rs.getInt("address.address_id");	
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

<form name="editform" method="post" id="editCustomers" action="">
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
			<td><input type="text" name="firstname" id="firstname" value="<%=firstname%>"></td>
		</tr>
		<tr>
			<td>Επώνυμο:</td>
			<td><input type="text" name="lastname" id="lastname" value="<%=lastname%>"></td>
		</tr>
		<tr>
			<td>Διεύθυνση:</td>
			<td><input type="text" name="address" id="address" value="<%=address%>"></td>
		</tr>
		<tr>
			<td>Πόλη:</td>
			<td><input type="text" name="city" id="city" value="<%=city%>"></td>
		</tr>
		<tr>
			<td>Τ.Κ:</td>
			<td><input type="text" name="postalCode" id="postalCode" value="<%=postalCode%>"></td>
		</tr>
		<tr>
			<td>Τηλέφωνο:</td>
			<td><input type="text" name="telephone" id="telephone" value="<%=telephone%>"></td>
		</tr>
	</table>
	<div class="hr" style="margin-bottom: -3px;"></div>
	<p class="right noMargin">
		<button type="submit" class="btn" value="Submit">
			<span>Αποθήκευση..</span>
		</button>
		<br>
</form>
</div>
<script>
$(document).ready(function(){
	$("form#editCustomers").submit(function() {
	var firstname = $('#firstname').attr('value');
	var lastname = $('#lastname').attr('value');	
	var address = $('#address').attr('value');
	var city = $('#city').attr('value');
	var postalCode = $('#postalCode').attr('value');
	var telephone = $('#telephone').attr('value');
		$.ajax({
			type: "POST",
			url: "updatecustomers.jsp",
			data: {"firstname": firstname, "lastname": lastname, "address": address, "city": city, "postalCode": postalCode, "telephone": telephone},	
			success: function(result){
				var result = $.trim(result);
				$('#reload').load('editcustomer.jsp', {'customerId' : <%=customerId%>,});									
				setTimeout(function(){				
					if (result=='correct'){								
						$('#correct').fadeIn(500).show();
						setTimeout(function() {
						    $('#correct').fadeOut(1600, "linear");
						}, 3000);
					} else {}			
				;},150);
					}
			});
		return false;
		});
	});
	;
	</script>
<div id="correct" style="display: none; color: red; ">
	<strong>Τα στοιχεία του πελάτη
	<%=firstname%> <%=lastname%> ανανεώθηκαν!
	</strong>
</div>
</body>
</html>
<%
	break;
	case CASHIER:
	case NOACCESS:
	case CUSTOMER:
		response.sendRedirect("../errorpage.jsp");
	break;
	}}
%>