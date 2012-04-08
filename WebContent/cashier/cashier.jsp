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
		<li style="margin-bottom:10px;"><a href="sumloans.jsp">Συνολική εικόνα δανείων</a></li>
		<li style="margin-bottom:10px;"><a href="deposit.jsp">Κατάθεση χρημάτων σε δάνειο</a></li>
		<li style="margin-bottom:10px;"><a href="creditcard.jsp">Κατάθεση/Ανάληψη χρημάτων σε κάρτα</a></li>
		<li style="margin-bottom:10px;"><a href="accounts.jsp">Κατάθεση/Ανάληψη χρημάτων σε λογαριασμό</a></li>
		<li style="margin-bottom:10px;"><a href="loantransactions.jsp">Συναλλαγές Δανείων</a></li>
		<li style="margin-bottom:10px;"><a href="ccTransactions.jsp">Συναλλαγές Καρτών</a></li>
		<li style="margin-bottom:10px;"><a href="accountTransactions.jsp">Συναλλαγές Λογαριασμών</a></li>
	</div>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="../footer.jsp"%>