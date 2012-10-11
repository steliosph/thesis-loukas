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
		<div class="pattern_box_icon">
			<img src="director.png" alt="" title="" />
		</div>
		<h1>
			Γενικός Διευθυντής<span> <%=session.getAttribute("firstname")%>
				<%=session.getAttribute("lastname")%></span>
		</h1>
		<p>
		<h1>Παρακαλώ επιλέξτε μια απο τις παρακάτω λειτουργίες.</h1>
		 
			<li style="margin-bottom:10px;"><a href="sumloans.jsp">Συνολική εικόνα δανείων</a></li>
			<li style="margin-bottom:10px;"><a href="customers.jsp">Πληροφορίες πελατών της τράπεζας</a></li>
			<li style="margin-bottom:10px;"><a href="employee.jsp">Πληροφορίες υπαλλήλων της τράπεζας</a></li>
			<li style="margin-bottom:10px;"><a href="message.jsp">Μηνύματα</a></li>
		 
		
	</div>
	<div class="clear"></div>
</div>
<%@ include file="../footer.jsp"%>
<%
	break;
	case CASHIER:
	case NOACCESS:
	case CUSTOMER:
		response.sendRedirect("../errorpage.jsp");
	break;
	}}
%>