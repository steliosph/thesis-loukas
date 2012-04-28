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
		   alert ("Browser does not support XMLHTTP Request")
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
						<td bgcolor="#fffaaa">Από Λογαριασμό:</td>
						<td><select id="AccountSel2">
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
					<span>Search..</span>
				</button>
				<button type="button" class="btn">
					<span>Cancel..</span>
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

    	alert(Balance1);
    	if (AccountSel1 == AccountSel2) {
    		alert("Πρέπει να επιλέξετε διαφορετικούς λογαριασμούς");
    	}
    	else if (Balance1 == "") {
    		alert("Παρακαλώ επιλέξτε λογαριασμό εντολέα");
    	} 
    	else if (TransferAmount > Balance1) {
    		alert("To υπόλοιπο του λογαριασμού είναι μεγαλύτερο από το ποσό που θέλετε να μεταφέρετε");
    	}
    }
    );
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
				$('#AccountSel1').change(function()
				{
		 			var Number = 1;
		   			showAcc(this.value,Number);		   
				});
		
				$('#AccountSel2').change(function()
				{
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
