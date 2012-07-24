<%@ page import="java.text.DecimalFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="SHORTCUT ICON" href="../images/favicon.ico"
	type="image/x-icon" />
</head>
<script type="text/javascript">
function showAcc(AccountType)
{ 
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
	xmlHttp.onreadystatechange=stateChanged;
	xmlHttp.open("GET",url,true);
	xmlHttp.send(null);
}

function stateChanged() 
{ 
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
	{
	$("#loading").show();
	$("#loading").html("<div> <img src='../images/loading.gif' alt='Loading..'></div>");
	document.getElementById("AccId").innerHTML= "";
	document.getElementById("LastTransaction").innerHTML= "";
	document.getElementById("Type").innerHTML= "";
	document.getElementById("FullName").innerHTML= "";
	document.getElementById("Address").innerHTML= "";
	document.getElementById("Balance").innerHTML= "";	
	var showdata = xmlHttp.responseText; 
	var data = showdata.split(",");        
	if(data.length>1)
		{	
		setTimeout(function() {
			document.getElementById("AccId").innerHTML= data[1];
			document.getElementById("LastTransaction").innerHTML= data[2];
			document.getElementById("Type").innerHTML= data[3];
			document.getElementById("FullName").innerHTML= data[4];
			document.getElementById("Address").innerHTML= data[5];
			document.getElementById("Balance").innerHTML= data[6];			
			$("#loading").hide();
		}, 300);
		}       
	}

}

</script>

<jsp:useBean id="account" scope="page" class="sql.AccountsRepositoryImpl" />
<jsp:useBean id="creditCard" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />
<jsp:useBean id="loans" scope="page" class="sql.LoansRepositoryImpl" />
<%
	String showDiv = "", TypeAcc = "", TypeCc = "", TypeLoan = "";
	int CustomerId;
%>
<body>
	<%@ include file="top.jsp"%>
<%
if (session.getAttribute("customerId") == null) {
}
else {
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
	showDiv = request.getParameter( "showDiv" );
%>

	<div class="pageTop"></div>
	<div class="pageMain">
		<div class="contentArea">
			<h1>Στοιχεία Λογαριασμού</h1>

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
		
	else if ( showDiv == "Acc" ) {
		showAcc("TypeAcc");
	    $("#AccountSel option[value='TypeAcc']").attr('selected', 'selected'); 
	}
	else if ( showDiv == "Cc" ) {
		showAcc("TypeCc");
		$("#AccountSel option[value='TypeCc']").attr('selected', 'selected');
	}
	else if ( showDiv == "Loan" ) {
		showAcc("TypeLoan");
		$("#AccountSel option[value='TypeLoan']").attr('selected', 'selected');
	}	
		
	});
</script>
<div class="center" id="loading"></div>	
			<table id="table-2">
				<tr>
					<td bgcolor="#fffaaa">Επιλογή Λογαριασμού:</td>
					<td><select id="AccountSel" onchange="showAcc(this.value);">
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
			</table>	
			<table id="table-2">				
				<tr>
					<td align='center' bgcolor="#fffaaa">Αριθμός Λογαριασμού:</td>
					<td align='center' id="AccId"></td>
				</tr>
				<tr>
					<td align='center' bgcolor="#fffaaa">Τελευταία Ενημέρωση:</td>
					<td align='center' id="LastTransaction"></td>
				</tr>
				<tr>
					<td align='center' bgcolor="#fffaaa">Είδος Λογαριασμού:</td>
					<td align='center' id="Type"></td>
				</tr>
				<tr>
					<td align='center' bgcolor="#fffaaa">Κάτοχος Λογαριασμού:</td>
					<td align='center' id="FullName"></td>
				</tr>
				<tr>
					<td align='center' bgcolor="#fffaaa">Διεύθυνση Αλληλογραφίας:</td>
					<td align='center' id="Address"></td>
				</tr>
				<tr>
					<td align='center' bgcolor="#fffaaa">Υπόλοιπο:</td>
					<td align='center' id="Balance"></td>
				</tr>
				
			</table>		
		</div>
		<div class="clear"></div>
	</div>
	<div class="clear"></div>
	<%@ include file="../footer.jsp"%>
</body>
</html>
<% } %>