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
var xmlhttp,xmlhttp1;
	function transfer(AccountSel1, Balance1, AccNumber1, AccountSel2, Balance2,
			AccNumber2, TransferAmount, TransferDesc, NewBalance1, NewBalance2) {
		xmlhttp = GetXmlHttpObject();
		if (xmlhttp == null) {
			alert("Your browser does not support AJAX!");
			return;
		}
		var url = "transfer.jsp";
		url = url + "?AccountSel1=" + AccountSel1 + "&Balance1=" + Balance1 + "&AccNumber1=" + AccNumber1 + "&AccountSel2=" + AccountSel2 + "&Balance2=" + Balance2 + "&AccNumber2=" + AccNumber2 + "&TransferAmount=" + TransferAmount + "&TransferDesc=" + TransferDesc + "&NewBalance1=" + NewBalance1 + "&NewBalance2=" + NewBalance2;
		xmlhttp.onreadystatechange = stateChanged;
		xmlhttp.open("GET", url, true);
		xmlhttp.send(null);
	}

	function stateChanged() {
		if (xmlhttp.readyState == 4) {
			document.getElementById('result').innerHTML = xmlhttp.responseText;
			$("#result").fadeIn();
			 document.getElementById('Submit').style.visibility='hidden';
			 document.getElementById('Clear').style.visibility='hidden';
			setTimeout(location.reload,2000);									
		}
		if (xmlHttp.readyState==1 || xmlHttp.readyState=="loading") { 
			document.getElementById("result").innerHTML="<div align=center> <img src='../images/loading.gif' alt='Loading..'></div>";
		}
	}

	function showAcc(AccountType, Number) {
		xmlhttp1 = GetXmlHttpObject();
		if (xmlhttp1 == null) {
			alert("Your browser does not support AJAX!");
			return;
		}
		var url1 = "getAccount.jsp";
		url1 = url1 + "?AccountType=" + AccountType;
		xmlhttp1.onreadystatechange = stateChanged1;
		xmlhttp1.Number = Number;
		xmlhttp1.open("GET", url1, true);
		xmlhttp1.send(null);
	}

	function stateChanged1() {
		var Number = this.Number;
		if (xmlhttp1.readyState == 4) {
			var showdata = xmlhttp1.responseText;
			var data = showdata.split(",");
			if (data.length > 1) {
				document.getElementById('Id' + Number).innerHTML = data[1];
				document.getElementById("Balance" + Number).innerHTML = data[6];
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
	<jsp:useBean id="creditCard" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />
	<jsp:useBean id="loans" scope="page" class="sql.LoansRepositoryImpl" />
	<%
		String TypeAcc = "", TypeCc = "", TypeLoan = "";
		int CustomerId = 0;
		Float Orio,LoanAmount;
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
			rs = creditCard.selectAccount(CustomerId);
			while (rs.next()) {
				TypeCc = "Πιστωτική κάρτα";
				Orio = rs.getFloat("orio");
				session.setAttribute( "Orio", Orio );
			}
			rs = loans.selectAccount(CustomerId);
			while (rs.next()) {
				TypeLoan = rs.getString("type");
				LoanAmount = rs.getFloat("Loan_amount");
				session.setAttribute( "LoanAmount", LoanAmount );
			}
	%>
	<div class="pageTop"></div>
	<div class="pageMain">
		<div class="contentArea">
			<h1>Μεταφορά Μεταξύ Λογαριασμών μου</h1>
<div class="center" id="result" style="font-size: 17pt; overflow: auto; font-style:italic; color:red;"></div>
			<div class="left marginPX">
				<table class="table-2">
					Στοιχεία Λογαριασμού Εντολέα
					<tr>
						<td bgcolor="#fffaaa">Από Λογαριασμό:</td>
						<td><select id="AccountSel1">
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
						<td bgcolor="#fffaaa">Από Αριθμό Λογαριασμού:</td>
						<td id="Id1" />
					</tr>
					<tr>
						<td bgcolor="#fffaaa">Διαθέσιμο Υπόλοιπο:</td>
						<td id="Balance1" />
					</tr>
				</table>			
				<br> Στοιχεία Μεταφοράς
				<table class="table-2">
					<tr>
						<td bgcolor="#fffaaa">Ποσό Μεταφοράς::</td>
						<td><input type="text" id="TransferAmount" /></td>
					</tr>
					<tr>
						<td bgcolor="#fffaaa">Περιγραφή Μεταφοράς:</td>
						<td><input type="text" id="TransferDesc" /></td>
					</tr>
				</table>

			</div>
			<div class="left ">
				<table class="table-2">
					Δικαιούχος
					<tr>
						<td bgcolor="#fffaaa">Σε Λογαριασμό:</td>
						<td><select id="AccountSel2">
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
										if (TypeLoan != "") {
								%>
								<option value="TypeLoan">Δάνειο</option>
								<%
									}
								%>
						</select></td>
					</tr>
					<tr>
						<td bgcolor="#fffaaa">Σε Αριθμό Λογαριασμού:</td>
						<td id="Id2" />
					</tr>
					<tr>
						<td bgcolor="#fffaaa">Διαθέσιμο Υπόλοιπο:</td>
						<td id="Balance2" />
				</table>

			</div>			
			<br><br><br><br><br><br><br><br><br><br>
			<div class="left marginPX80">
				<button type="button" class="btn" id="Submit">
					<span>Μεταφορά..</span>
				</button>
				<button type="button" class="btn" id="Clear">
					<span>Ακύρωση..</span>
				</button>						
				</div>	
				
<script>
$(function() {
    $("#Submit").click( function()
    {     
    	var AccountSel1 = document.getElementById("AccountSel1");
    	AccountSel1 = AccountSel1.options[AccountSel1.selectedIndex].value;     	
        var AccountSel2 = document.getElementById("AccountSel2");
        AccountSel2 = AccountSel2.options[AccountSel2.selectedIndex].value;     		
    	var TransferAmount = document.getElementById('TransferAmount').value;
    	var TransferDesc = document.getElementById('TransferDesc').value;    	
    	var Balance1 = document.getElementById('Balance1').innerHTML;
    	var Balance2 = document.getElementById('Balance2').innerHTML;    
    	var BalanceLength1 = $("#Balance1").html();
    	BalanceLength1 = $.trim(BalanceLength1);    	
    	var BalanceLength2 = $("#Balance2").html();
    	BalanceLength2 = $.trim(BalanceLength2);
    	Balance1=parseFloat(Balance1);
    	Balance2=parseFloat(Balance2);
    	TransferAmount=parseFloat(TransferAmount);    
    	
    	var AccNumber1 = document.getElementById('Id1').innerHTML;    
    	var AccNumber2 = document.getElementById('Id2').innerHTML;     	    	    	    	 	
    	
    	if (BalanceLength1 == 0) {
    		$("#result").text('Παρακαλώ επιλέξτε λογαριασμό εντολέα');
    	} 
    	else if (BalanceLength2 == 0) {
    		$("#result").text('Παρακαλώ επιλέξτε λογαριασμό δικαιούχου');    	
    	}    
    	else if (AccountSel1 == AccountSel2) {
    		$("#result").text('Πρέπει να επιλέξετε διαφορετικούς λογαριασμούς');    		
    	}
    	else if(isNaN(TransferAmount)) {
    		$("#result").text('Παρακαλώ εισάγετε ποσό μεταφοράς');   
    	}
    	else if (TransferAmount > Balance1) {
    		$("#result").text('To υπόλοιπο του λογαριασμού είναι μικρότερο από το ποσό που θέλετε να μεταφέρετε');
    	}
        else if(answered == true) {
       		NewBalance1 = Balance1 - TransferAmount;
       		NewBalance2 = Balance2 + TransferAmount;       	       		
			transfer(AccountSel1, Balance1, AccNumber1, AccountSel2, Balance2, AccNumber2, TransferAmount, TransferDesc, NewBalance1, NewBalance2);       	 	
        }
    	else if (TransferAmount < Balance1) {   
    		$("#result").fadeOut();
    		$("#Submit span").text("Επιλέξτε για επιβεβαίωση");    		
    		document.getElementById("AccountSel1").disabled=true;
    		document.getElementById("AccountSel2").disabled=true;
    		document.getElementById("TransferAmount").disabled=true;
    		document.getElementById("TransferDesc").disabled=true;
    	    answered = true;   
    	    
    	}    
    });
}); 

</script>						
<script>
	var answered = false;
	$("#AccountSel1 option[value='noAccount']").attr('selected', 'selected');
	$("#AccountSel2 option[value='noAccount']").attr('selected', 'selected');
	document.getElementById('TransferAmount').value = "";
	document.getElementById('TransferDesc').value = "";
	document.getElementById('AccountSel1').disabled=false;
	document.getElementById('AccountSel2').disabled=false;
	document.getElementById('TransferAmount').disabled=false;
	document.getElementById('TransferDesc').disabled=false;
	$('#AccountSel1').change(function() {
		var noAccount = document.getElementById("AccountSel1");
		noAccount = noAccount.options[noAccount.selectedIndex].value;
		if (noAccount == "noAccount") {
			document.getElementById('Id1').innerHTML = "";
			document.getElementById('Balance1').innerHTML = "";						
		}
	var Number = 1;		 		  
	showAcc(this.value,Number);		   
	});
		
	$('#AccountSel2').change(function() {
		var noAccount = document.getElementById("AccountSel2");
		noAccount = noAccount.options[noAccount.selectedIndex].value;
		if (noAccount == "noAccount") {
			document.getElementById('Id2').innerHTML = "";
			document.getElementById('Balance2').innerHTML = "";
		}
		var Number = 2;
		showAcc(this.value,Number);
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
