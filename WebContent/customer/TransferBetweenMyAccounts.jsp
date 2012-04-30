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
function showAcc(AccountType,Number) {

	if (typeof XMLHttpRequest != "undefined"){
		  xmlHttp= new XMLHttpRequest();
		      }
		      else if (window.ActiveXObject){
		  xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
		      }
		if (xmlHttp==null){
		   alert ("Browser does not support XMLHTTP Request");
		return
		} 
	var url="getAccount.jsp";
	url = url + "?AccountType=" + AccountType;
	xmlHttp.onreadystatechange = stateChanged;
	xmlHttp.Number = Number;
	xmlHttp.open("GET",url,true);
	xmlHttp.send(null);
}

function stateChanged(Number) 
{ 
var Number = this.Number;
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
	{         
	var showdata = xmlHttp.responseText; 
	var strar = showdata.split(",");     
	if(strar.length>1)
		{
		var strname = strar[1];
		document.getElementById('Id' + Number).innerHTML= strar[1];
		document.getElementById("Balance" + Number).innerHTML= strar[6];		
		}       
	}
}



</script>

<body>
	<jsp:useBean id="account" scope="page" class="sql.AccountsRepositoryImpl" />
	<jsp:useBean id="creditCard" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />
	<jsp:useBean id="loans" scope="page" class="sql.LoansRepositoryImpl" />
	<%
		String TypeAcc = "", TypeCc = "", TypeLoan = "";
		int CustomerId = 0;
	%>
	<%
		if (session.getAttribute("customerId") == null) {
		} else {
			CustomerId = (Integer) session.getAttribute("customerId");

			ResultSet rs = account.selectAccount(CustomerId);
			while (rs.next()) {
				TypeAcc = "Ταμιευτήριο";
			}
			rs = creditCard.selectAccount(CustomerId);
			while (rs.next()) {
				TypeCc = "Πιστωτική κάρτα";
			}
			rs = loans.selectAccount(CustomerId);
			while (rs.next()) {
				TypeLoan = rs.getString("type");
			}
	%>

	<div class="pageTop"></div>
	<div class="pageMain">
		<div class="contentArea">
			<h1>Μεταφορά Μεταξύ Λογαριασμών μουν</h1>


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
										if (TypeLoan != "") {
								%>
								<option value="TypeLoan">Δάνειο</option>
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
    	TransferAmount=parseFloat(TransferAmount);     	
    	
    	if (BalanceLength1 == 0) {
    		alert("Παρακαλώ επιλέξτε λογαριασμό εντολέα");
    	} 
    	else if (BalanceLength2 == 0) {
    		alert("Παρακαλώ επιλέξτε λογαριασμό δικαιούχου");
    	}    
    	else if (AccountSel1 == AccountSel2) {
    		alert("Πρέπει να επιλέξετε διαφορετικούς λογαριασμούς");
    	}
    	else if(isNaN(TransferAmount)) {
    		alert("Παρακαλώ εισάγετε ποσό μεταφοράς");
    	}
    	else if (TransferAmount > Balance1) {
    		alert("To υπόλοιπο του λογαριασμού είναι μικρότερο από το ποσό που θέλετε να μεταφέρετε");
    	}
        else if(answered == true) {
       	 alert("sql for tranfer");
        }
    	else if (TransferAmount < Balance1) {    		    		
    		$("#Submit span").text("Επιλέξτε για επιβεβαίωση");    		
    		document.getElementById("AccountSel1").disabled=true;
    		document.getElementById("AccountSel2").disabled=true;
    		document.getElementById("TransferAmount").disabled=true;
    		document.getElementById("TransferDesc").disabled=true;
    	    answered = true;   
    	    
    	}    
    });
}); 

function tranfer (){
	alert("asd");
	var TransactionTime = document.getElementById("ActionSel1");
	TransactionTime = TransactionTime.options[TransactionTime.selectedIndex].value;		
	var ActionSel1 = document.getElementById('TransferAmount').value;
	alert(TransactionTime);
}
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
				$('#AccountSel1').change(function()
				{
					var noAccount = document.getElementById("AccountSel1");
					noAccount = noAccount.options[noAccount.selectedIndex].value;
					if (noAccount == "noAccount") {
						document.getElementById('Id1').innerHTML = "";
						document.getElementById('Balance1').innerHTML = "";						
					}
		 			var Number = 1;		 		  
		   			showAcc(this.value,Number);		   
				});
		
				$('#AccountSel2').change(function()
				{
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
</body>
</html>
<%
	}
%>
