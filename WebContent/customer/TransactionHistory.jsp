<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="SHORTCUT ICON" href="../images/favicon.ico"
	type="image/x-icon" />
</head>
<script language="javascript" type="text/javascript">  
var xmlHttp;  
var xmlHttp;
function showState(){ 
	var AccountType = document.getElementById("AccountSel");
		AccountType = AccountType.options[AccountType.selectedIndex].value;
	var TransactionTime = document.getElementById("ActionSel");
		TransactionTime = TransactionTime.options[TransactionTime.selectedIndex].value;	
		
	var TransactionTimeText =  document.getElementById("ActionSel");
	TransactionTimeText = TransactionTimeText.options[TransactionTimeText.selectedIndex].text;		

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
var url="getTransactions.jsp";
url = url + "?AccountType=" + AccountType + "&TransactionTime=" +TransactionTime + "&TransactionTimeText=" + TransactionTimeText; 

xmlHttp.onreadystatechange = stateChange;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}
function stateChange(){   
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
document.getElementById("result").innerHTML=xmlHttp.responseText;  
}   
}

</script>
<body>
	<%@ include file="top.jsp"%>
	<jsp:useBean id="account" scope="page" class="sql.AccountsRepositoryImpl" />
	<jsp:useBean id="creditCard" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />
	<jsp:useBean id="loans" scope="page" class="sql.LoansRepositoryImpl" />
	<%
		String CustomerId1, showDiv = "", TypeAcc = "", TypeCc = "", TypeLoan = "";
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
			showDiv = request.getParameter("showDiv");
	%>

	<div class="pageTop"></div>
	<div class="pageMain">
		<div class="contentArea">
			<h1>Ιστορικό Κινήσεων</h1>

			<script type="text/javascript">
	$(document).ready(function() {
		var showDiv="<%=showDiv%>";
		var TypeAcc='<%=TypeAcc%>';
		var TypeCc='<%=TypeCc%>';
		var TypeLoan='<%=TypeLoan%>';		 
	if ( "null" == showDiv ) {
		if ( TypeAcc != "" ) {
		showAcc("TypeAcc");
	    $("#AccountSel option[value='TypeAcc']").attr('selected', 'selected'); 
		}
		else if ( TypeCc != "" ) {
			showAcc("TypeCc");
			$("#AccountSel option[value='TypeCc']").attr('selected', 'selected');
			}
		else if ( TypeLoan != "" ) {
			showAcc("TypeLoan");
			$("#AccountSel option[value='TypeLoan']").attr('selected', 'selected');			
		}
	}
		
	else if ( showDiv == "l1t0" ) {
		showAcc("TypeAcc");
	    $("#AccountSel option[value='TypeAcc']").attr('selected', 'selected'); 
	    $("#ActionSel option[value='limit 10']").attr('selected', 'selected'); 
	}	
	});
</script>
			<div class="left">
				<table class="table-2">
					<tr>
						<td bgcolor="#fffaaa">Επιλογή Λογαριασμού:</td>
						<td><select id="AccountSel" onchange="showState();">
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
						<td bgcolor="#fffaaa">Επιλέξτε Περίοδο:</td>
						<td><select id="ActionSel" onchange="showState();">
								<option value="limit 10">Τελευταίες 10 Συναλλαγές</option>
								<option value="limit 20">Τελευταίες 20 Συναλλαγές</option>
								<option value=">= DATE_SUB(CURDATE(), INTERVAL 5 DAY)">Τελευταίες 5 Ημέρες</option>
								<option value=">= DATE_SUB(CURDATE(), INTERVAL 10 DAY)">Τελευταίες 10 Ημέρες</option>
								<option value=">= DATE_SUB(CURDATE(), INTERVAL 20 DAY)">Τελευταίες 20 Ημέρες</option>
								<option value=">= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)">Προηγούμενος Μήνας</option>
								<option value=">= DATE_SUB(CURDATE(), INTERVAL 2 MONTH)">Τελευταίοι 2 Μήνες</option>
								<option value=">= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)">Τελευταίοι 3 Μήνες</option>
								<option value=">= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)">Τελευταίοι 12 Μήνες</option>
								<option value="date">Επιλέξτε Ημερομηνίες</option>
						</select></td>
					</tr>
					<tr>
						<td bgcolor="#fffaaa">Από Ημερομηνία</td>
						<td>date</td>
					</tr>
					<tr>
						<td bgcolor="#fffaaa">Έως Ημερομηνία</td>
						<td>date</td>
					</tr>
				</table>
				<br>
				<button type="button" class="btn" onClick="showState();">
					<span>Search..</span>
				</button>
			</div>
			<form name="form">
				<div id="result" style="overflow: auto; height: 250px;"></div>
			</form>
		</div>
		<div class="clear"></div>
	</div>
	<div class="clear"></div>
	<%@ include file="../footer.jsp"%>
</body>
</html>
<%
	}
%>
