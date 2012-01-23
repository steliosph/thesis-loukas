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

<jsp:useBean id="employee" scope="page"
	class="sql.EmployeeRepositoryImpl" />

<%
	 String s="", employeeId1="", firstname = "", lastname = "", type= "", empAddress = "", empCity = "", empPostalCode = "", empTelephone = "", branchAddress= "", branchCity="", branchPostalCode= "", branchTelephone= "";
	 int employeeId = 0, empAddressId = 0, branchAddressId = 0;
	 double salary = 0;
	 Timestamp dateHired;
%>	
	
<%
employeeId1 = request.getParameter("employeeId");
employeeId = Integer.parseInt(employeeId1);

System.out.println(employeeId);

	ResultSet rs = employee.editEmployee(employeeId);
	if (rs.next()) {
		employeeId = rs.getInt("employee_id");
		firstname = rs.getString("firstname");
		lastname = rs.getString("lastname");
		salary = rs.getDouble("salary");
		dateHired = rs.getTimestamp("date_hired");
		
		System.out.println(dateHired);
		
		type = rs.getString("type");
		empAddressId = rs.getInt("a.address_id");
		empAddress = rs.getString("a.address");
		empCity = rs.getString("a.city");
		empPostalCode = rs.getString("a.postal_code");
		empTelephone = rs.getString("a.telephone");
		branchAddressId = rs.getInt("a2.address_id");
		branchAddress = rs.getString("a2.address");
		branchCity = rs.getString("a2.city");
		branchPostalCode = rs.getString("a2.postal_code");
		branchTelephone = rs.getString("a2.telephone");
	
		session.setAttribute("employeeId", employeeId);
		session.setAttribute("empAddressId", empAddressId);
		session.setAttribute("branchAddressId", branchAddressId);
	}
%>

<form name="editform" method="post" action="updateemployees.jsp">
	<table width="300px">
		<tr>
			<td colspan=2 style="font-weight: bold;" align="center"><h2
					style="margin-bottom: -3px;">Επεξεργασία Υπαλλήλου</h2>
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
			<td>Μισθός:</td>
			<td><input type="text" name="salary" value="<%=salary%>"></td>
		</tr>
		<tr>
			<td>Ημ. Προσληψης:</td>
			<td><input type="text" name="dataHired" value=""></td>
		</tr>
		<tr>
			<td>Τυπος:</td>
			<td><input type="text" name="type" value="<%=type%>"></td>
		</tr>
		<tr>
			<td>Διευθυνση Εργαζομένου:</td>
			<td><input type="text" name="empAddress" value="<%=empAddress%>"></td>
		</tr>
		<tr>
			<td>Πόλη Εργαζομένου:</td>
			<td><input type="text" name="empCity" value="<%=empCity%>"></td>
		</tr>
				<tr>
			<td>Τ.Κ Εργαζομένου:</td>
			<td><input type="text" name="empPostalCode" value="<%=empPostalCode%>"></td>
		</tr>
				<tr>
			<td>Τηλέφωνο Εργαζομένου:</td>
			<td><input type="text" name="empTelephone" value="<%=empTelephone%>"></td>
		</tr>
				<tr>
			<td>Διευθυνση Καταστήματος:</td>
			<td><input type="text" name="branchAddress" value="<%=branchAddress%>"></td>
		</tr>
				<tr>
			<td>Πόλη Καταστήματος:</td>
			<td><input type="text" name="branchCity" value="<%=branchCity%>"></td>
		</tr>
				<tr>
			<td>Τ.Κ Καταστήματος:</td>
			<td><input type="text" name="branchPostalCode" value="<%=branchPostalCode%>"></td>
		</tr>
				<tr>
			<td>Τηλέφωνο Καταστήματος:</td>
			<td><input type="text" name="branchTelephone" value="<%=branchTelephone%>"></td>
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
	case CASHIER:
	case NOACCESS:
		response.sendRedirect("errorpage.jsp");
	break;
	}}
%>