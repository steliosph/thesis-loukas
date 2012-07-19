<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="SHORTCUT ICON" href="../images/favicon.ico" type="image/x-icon" />
</head>
<body>
<%@ include file="top.jsp"%>
	<div class="pageTop"></div>
	<div class="pageMain">
		<div class="contentArea">
		
		
		<div class="pattern_box_icon">
			<img src="customer.jpg" alt="" title="" />
		</div>
		<h1>
			Πελάτης:<span> <%=session.getAttribute("firstname")%> <%=session.getAttribute("lastname")%></span>
		</h1>
		<p>
		<h1>Παρακαλώ επιλέξτε μια απο τις παρακάτω λειτουργίες.</h1>
		<h3>Λογαριασμοί</h3>
			<li style="margin-bottom:10px;"><a href="BalanceOverview.jsp">Εικόνα Υπολοίπων</a></li>
			<li style="margin-bottom:10px;"><a href="AccountDetails.jsp">Στοιχεία Λογαριασμού</a></li>
			<li style="margin-bottom:10px;"><a href="TransactionHistory.jsp">Ιστορικό Κινήσεων</a></li>
		 
		<div class="left">	
		<h3>Μεταφορές</h3>	
			<li style="margin-bottom:10px;"><a href="TransferBetweenMyAccounts.jsp">Μεταφορά Mεταξύ Λογαριασμών μου</a></li>
		<h3>e-shop</h3>				
			<li style="margin-bottom:10px;"><a href="eshop.jsp?answered=false">Κάρτε χρόνου ομιλίας</a></li>			
		<h3>Δωρεές</h3>	
			<li style="margin-bottom:10px;"><a href="../cashier/loantransactions.jsp">Δωρεές σε ιδρύματα</a></li>
		<h3>Άλλες Υπηρεσίες</h3>			
			<li style="margin-bottom:10px;"><a href="../cashier/ccTransactions.jsp">Ισοτιμίες Συναλλάγματος</a></li>
		<h3>Ρυθμίσεις</h3>
			<li style="margin-bottom:10px;"><a href="../cashier/accountTransactions.jsp">Ρυθμίσεις Λογαριασμού</a></li>
			</div>		
		
		


		</div>
		<div class="clear"></div>
		</div>
		<div class="clear"></div>
	<%@ include file="../footer.jsp"%>
</body>
</html>