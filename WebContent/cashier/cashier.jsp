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
	case CASHIER:
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />
</head>
<%@ include file="top.jsp"%>
<div class="pageTop"></div>
<div class="pageMain">
	<div class="contentArea">
				<div class="left noMargin">
		<div class="pattern_box_icon">
			<img src="tamias.png" alt="" title="" />
		</div>
		</div>
		<h1>
		
			Χειριστής ταμείου:<span> <%=session.getAttribute("firstname")%>
				<%=session.getAttribute("lastname")%></span>
		</h1>
		<p>
		<div class="left ">
		<h1>Παρακαλώ επιλέξτε μια απο τις παρακάτω λειτουργίες.</h1>
		<a href="sumloans.jsp">Συνολική εικόνα δανείων</a><br> <br>
		<a href="deposit.jsp">Κατάθεση χρημάτων σε δάνειο</a><br> <br>
		<a href="creditcard.jsp">Κατάθεση/Ανάληψη χρημάτων σε κάρτα</a><br> <br>
		<a href="employee.jsp">Κατάθεση/Ανάληψη χρημάτων σε λογαριασμό</a><br> <br>
		<a href="employee.jsp">Πληροφορίες υπαλλήλων της τράπεζας</a><br> <br>
		<a href="employee.jsp">Πληροφορίες υπαλλήλων της τράπεζας</a><br> <br>
	</div>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="../footer.jsp"%>
<%
	break;
	case NOACCESS:
		response.sendRedirect("errorpage.jsp");
	break;
	}}
%>