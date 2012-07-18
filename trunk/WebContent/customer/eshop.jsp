<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<html>
<head>
<%@ include file="top.jsp"%>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="SHORTCUT ICON" href="../images/favicon.ico"
	type="image/x-icon" />
</head>
<script type="text/javascript">
var xmlhttp1;

	function showAcc(AccountType) {
		xmlhttp1 = GetXmlHttpObject();
		if (xmlhttp1 == null) {
			alert("Your browser does not support AJAX!");
			return;
		}
		var url1 = "getAccount.jsp";
		url1 = url1 + "?AccountType=" + AccountType;
		xmlhttp1.onreadystatechange = stateChanged1;
		xmlhttp1.open("GET", url1, true);
		xmlhttp1.send(null);
	}

	function stateChanged1() {
		if (xmlhttp1.readyState == 4) {
			var showdata = xmlhttp1.responseText;
			var data = showdata.split(",");
			if (data.length > 1) {
				document.getElementById('Id').innerHTML = data[1];
				document.getElementById("Balance").innerHTML = data[6];
			}
		}
	}

	function GetXmlHttpObject() {
		if (window.XMLHttpRequest) {
			return new XMLHttpRequest();
		}
		if (window.ActiveXObject) {
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
		return null;
	}
</script>

<body>
	<jsp:useBean id="account" scope="page" class="sql.AccountsRepositoryImpl" />
	<jsp:useBean id="accountTransactions" scope="page" class="sql.AccountTransactionsImpl" />
	<jsp:useBean id="creditCardTransactions" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />
	<jsp:useBean id="creditCard" scope="page" class="sql.CreditCardsRepositoryImpl" />
	
	
	<%
		String TypeAcc = "", TypeCc = "", TypeLoan = "";
		int CustomerId = 0;
	%>
	<%
		if (session.getAttribute("customerId") == null) {
			response.sendRedirect("../errorpage.jsp");
		} else {
			CustomerId = (Integer) session.getAttribute("customerId");

			ResultSet rs = account.selectAccount(CustomerId);
			while (rs.next()) {
				TypeAcc = "Ταμιευτήριο";
			}
			rs = creditCardTransactions.selectAccount(CustomerId);
			while (rs.next()) {
				TypeCc = "Πιστωτική κάρτα";
			}
	%>
	
	
		<div class="pageTop"></div>
	<div class="pageMain">
		<div class="contentArea">
			<h1>Κάρτες Top up</h1>
<div class="center" id="result" style="font-size: 17pt; overflow: auto; font-style:italic; color:red;"></div>			
		<div class="left marginPX">	
			<table class="table-2">
					Στοιχεία Λογαριασμού Εντολέα
					<tr>
						<td bgcolor="#fffaaa">Επιλογή Λογαριασμού:</td>
						<td><select id="AccountSel">
								<option value="noAccount">Επιλέξτε λογαριασμό</option>
								<%
									if (TypeAcc != "") {
								%>
								<option value="TypeAcc"><%=TypeAcc%></option>
								<%
									}
										if (TypeCc != "") {
								%>
								<option value="TypeCc"><%=TypeCc%></option>
								<%
									}
								%>
								
						</select></td>
					</tr>
					<tr>
						<td bgcolor="#fffaaa">Αριθμός Λογαριασμού:</td>
						<td id="Id" />
					</tr>
					<tr>
						<td bgcolor="#fffaaa">Διαθέσιμο Υπόλοιπο:</td>
						<td id="Balance" />
				</table>
			</div>
			
			<div class="left" id="left"><br>
				<table class="table-2">										
					<tr>
						<td bgcolor="#fffaaa">Επιλέξτε προμηθευτή:</td>
						<td><select id="eshopProvider">
								<option value="noProvider"> </option>
								<option value="cosmote">Cosmote</option>
								<option value="wind">Wind</option>
								<option value="vodafone">Vodafone</option>
						</select></td>
					</tr>
					<tr>
						<td bgcolor="#fffaaa">Επιλέξτε Κάρτα:</td>
						<td><select id="eshopCard" disabled="disabled">
								<option value="noEshopCard"> </option>
								<option value="5">5 € </option>
								<option value="10">10 €</option>
								<option value="15">15 €</option>
								<option value="20">20 €</option>
								<option value="30">30 €</option>
						</select></td>
					</tr>
 
				</table>			
 				<br>
 				<br> 		
 				
				<button type="button" class="btn" id="Submit">
					<span>Μεταφορά..</span>
				</button>
				<button type="button" class="btn" id="Clear">
					<span>Ακύρωση..</span>
				</button>
			</div>	
							
				 
	</div>
	
 <div class="center" id="cardShow" ></div>		


<script>
$(function() {
    $("#Submit").click( function()
    {     
    	var AccountSel = document.getElementById("AccountSel");
    	AccountSel = AccountSel.options[AccountSel.selectedIndex].value;     	
        var eshopProvider = document.getElementById("eshopProvider");
        eshopProvider = eshopProvider.options[eshopProvider.selectedIndex].value; 
        var eshopCard = document.getElementById("eshopCard");
        eshopCard = eshopCard.options[eshopCard.selectedIndex].value;     
        
    	var Balance = document.getElementById('Balance').innerHTML;
    	var BalanceLength = $("#Balance").html();
    	BalanceLength = $.trim(BalanceLength);    	
    	Balance=parseFloat(Balance);
    	var AccNumber = document.getElementById('Id').innerHTML;      	
    	
    	if (eshopCard == "noEshopCard") {
    		$("#result").text('Παρακαλώ επιλέξτε κάρτα χρόνου ομιλίας');
    	}
    	if (eshopProvider == "noProvider") {
    		$("#result").text('Παρακαλώ επιλέξτε προμηθευτή');
    	}
    	if (AccountSel == "noAccount") {
    		$("#result").text('Παρακαλώ επιλέξτε λογαριασμό εντολέα');
    	}

    	
    	
        else if(answered == true) {        	
        	NewBalance = Balance - eshopCard;  
        	if (AccountSel == "TypeAcc" ) {	
        		alert("FAsd");
        		<%
        		account.updateAccount(NewBalance1, AccNumber);
        		//accountTransactions.accountTransaction(AccId1, CustomerId, Action, OldBalance1, TransferAmount, NewBalance1, TransferDesc);
        		%>
        	}
        	if (AccountSel == "TypeCc" ) {
        		creditCard.updateCreditCard(NewBalance1, AccNumber1);
        		creditCardTransactions.creditCardTransaction(AccNumber1, CustomerId, Action, OldBalance1, TransferAmount, NewBalance1, Orio, TransferDesc);
        	}    
        }
    	else if (eshopCard < Balance) {   
    		$("#result").fadeOut();
    		$("#Submit span").text("Επιλέξτε για επιβεβαίωση");    		
    		document.getElementById("AccountSel").disabled=true;
    		document.getElementById("eshopProvider").disabled=true;
    		document.getElementById("eshopCard").disabled=true;
    	    answered = true;   
    	    
    	}    
    });
}); 

</script>
 
	
<script>
	var answered = false;
	$("#AccountSel option[value='noAccount']").attr('selected', 'selected');
	$("#eshopProvider option[value='noProvider']").attr('selected', 'selected');
	$("#eshopCard option[value='noEshopCard']").attr('selected', 'selected');

	document.getElementById("AccountSel").disabled=false;
	document.getElementById("eshopProvider").disabled=false;
	document.getElementById("eshopCard").disabled=false;
	
	$('#AccountSel').change(function() {
		var noAccount = document.getElementById("AccountSel");
		noAccount = noAccount.options[noAccount.selectedIndex].value;
		if (noAccount == "noAccount") {
			document.getElementById('Id').innerHTML = "";
			document.getElementById('Balance').innerHTML = "";						
		}		 		  
	showAcc(this.value);		   
	});
		
	$('#eshopProvider').change(function() {
		var noProvider = document.getElementById("eshopProvider");
		noProvider = noProvider.options[noProvider.selectedIndex].value;
		if (noProvider == "noProvider") {
		document.getElementById('eshopCard').disabled=true;
		$("#eshopCard option[value='noEshopCard']").attr('selected', 'selected');
		$("#cardShow").hide();
		}
		else if (noProvider == "cosmote") {		
			$("#cardShow").show();
			$("#cardShow").html("<div><img src='cosmote.jpg' width='900' height='130'></div>");	
			document.getElementById('eshopCard').disabled=false;					
		}
		else if (noProvider == "vodafone") {		
			$("#cardShow").show();
			$("#cardShow").html("<div><img src='vodafone.jpg' width='900' height='130'></div>");	
			document.getElementById('eshopCard').disabled=false;
		}
		else if (noProvider == "wind") {
			$("#cardShow").show();
			$("#cardShow").html("<div><img src='wind.jpg' width='900' height='130'></div>");	
			document.getElementById('eshopCard').disabled=false;
		}
		});		
</script>
	
	
	
	<div class="clear"></div>
		</div>
		<div class="clear"></div>
		<%@ include file="../footer.jsp"%>
		</div>
</body>
</html>
<%
	}
%>
	