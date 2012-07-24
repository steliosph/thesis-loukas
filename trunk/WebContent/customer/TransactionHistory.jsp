<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<html>
<head>
<%@ include file="top.jsp"%>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="SHORTCUT ICON" href="../images/favicon.ico" type="image/x-icon" />

<script type="text/javascript" src="../js/datepicker/jquery-ui-1.8.19.custom.min.js"></script>
<link type="text/css" rel="stylesheet" href="../js/datepicker/smoothness/jquery-ui-1.8.19.custom.css" />


</head>
<script language="javascript" type="text/javascript">  
var xmlHttp;  
function showTransactions(){ 	
	var TransactionTime = document.getElementById("ActionSel");
		TransactionTime = TransactionTime.options[TransactionTime.selectedIndex].value;		
	var StartDate = document.getElementById('txtStartDate').value ;
	var EndDate = document.getElementById('txtEndDate').value ;
	
	if (TransactionTime == "date") {
		$("#txtStartDate ").removeAttr('disabled');
		$("#txtEndDate ").removeAttr('disabled');
	}	
	else if ( TransactionTime != "date" ) {
		$("#txtStartDate").attr("disabled", "disabled");
		$("#txtEndDate").attr("disabled", "disabled");
		document.getElementById('txtStartDate').value = "";
		document.getElementById('txtEndDate').value = "";	
	}	
	var AccountType = document.getElementById("AccountSel");
		AccountType = AccountType.options[AccountType.selectedIndex].value;
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
url = url + "?AccountType=" + AccountType + "&TransactionTime=" +TransactionTime + "&TransactionTimeText=" + TransactionTimeText + "&StartDate=" + StartDate + "&EndDate=" + EndDate;
xmlHttp.onreadystatechange = stateChange;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}
function stateChange(){   
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
		$("#loading").show();		
		$("#result").hide();
		$("#loading").html("<div> <img src='../images/loading.gif' alt='Loading..'></div>");
		setTimeout(function() {
		document.getElementById("result").innerHTML=xmlHttp.responseText;
		$("#loading").hide();
		$("#result").show();
		}, 500);
	} 

}

</script>
<body>
	<jsp:useBean id="account" scope="page" class="sql.AccountsRepositoryImpl" />
	<jsp:useBean id="creditCard" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />
	<jsp:useBean id="loans" scope="page" class="sql.LoansRepositoryImpl" />
	<%
		String TransactionsSelect, showDiv = "", TypeAcc = "", TypeCc = "", TypeLoan = "";
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
			TransactionsSelect = request.getParameter("TransactionsSelect");
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
		var TransactionsSelect='<%=TransactionsSelect%>';
	if ( "null" == showDiv ) {
		if ( TypeAcc != "" ) {
	    $("#AccountSel option[value='TypeAcc']").attr('selected', 'selected'); 
		}
		else if ( TypeCc != "" ) {
			$("#AccountSel option[value='TypeCc']").attr('selected', 'selected');
			}
		else if ( TypeLoan != "" ) {
			$("#AccountSel option[value='TypeLoan']").attr('selected', 'selected');			
		}
	}
	else if ( TransactionsSelect == "l10t" && showDiv == "Acc") {
	    $("#AccountSel option[value='TypeAcc']").attr('selected', 'selected'); 
	    $("#ActionSel option[value='limit 10']").attr('selected', 'selected');
	    showTransactions();
	}
	else if ( TransactionsSelect == "l10t" && showDiv == "Cc") {
	    $("#AccountSel option[value='TypeCc']").attr('selected', 'selected'); 
	    $("#ActionSel option[value='limit 10']").attr('selected', 'selected');
	    showTransactions();
	}
	else if ( TransactionsSelect == "l10t" && showDiv == "Loan") {
	    $("#AccountSel option[value='TypeLoan']").attr('selected', 'selected'); 
	    $("#ActionSel option[value='limit 10']").attr('selected', 'selected');
	    showTransactions();
	}
	});
</script>
			<div class="left">
				<table class="table-2">
					<tr>
						<td bgcolor="#fffaaa">Επιλογή Λογαριασμού:</td>
						<td><select id="AccountSel">
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
						<td><select id="ActionSel">
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
						<td><input type="text" id="txtStartDate" disabled="disabled" ></input></td>
					</tr>
					<tr>
						<td bgcolor="#fffaaa">Έως Ημερομηνία</td>
						<td><input type="text" id="txtEndDate" disabled="disabled" ></input></td>
					</tr>
				</table>
				<br>
				<button type="button" class="btn" onClick="showTransactions();">
					<span>Αναζήτηση..</span>
				</button>
<script type="text/javascript">
$(document).change(function() {
	var TransactionTime = document.getElementById("ActionSel");
	TransactionTime = TransactionTime.options[TransactionTime.selectedIndex].value;		
if (TransactionTime == "date") {
	$("#txtStartDate ").removeAttr('disabled');
	$("#txtEndDate ").removeAttr('disabled');
}
else {
	$("#txtStartDate").attr("disabled", "disabled");
	$("#txtEndDate").attr("disabled", "disabled");
	document.getElementById('txtStartDate').value = "";
	document.getElementById('txtEndDate').value = "";
}
});
</script>				
			</div>
			<div class="center" id="loading"></div>	
			<div id="result" style="overflow: auto; height: 350px;"></div>	
														

<script>
jQuery(function () 
{

    $('#txtStartDate, #txtEndDate').datepicker(
    {
    	changeMonth: true,
		changeYear: true,
        showOn: "both",
        buttonImage: '../js/datepicker/smoothness/images/calendar.gif',
        beforeShow: customRange,
        dateFormat: "dd/mm/yy",
        firstDay: 1, 
        changeFirstDay: false, 
        buttonImageOnly: true
    });

});

function customRange(input) 
{ 
    var min = '-2Y'; //Set this to your absolute minimum date
        var dateMin = min;
        var dateMax = null;
        var dayRange = 730;  // Set this to the range of days you want to restrict to
    
        
        if (input.id == "txtStartDate") 
        {
            if ($("#txtEndDate").datepicker("getDate") != null)
            {
                dateMax = $("#txtEndDate").datepicker("getDate");
                dateMin = $("#txtEndDate").datepicker("getDate");
                dateMin.setDate(dateMin.getDate() - dayRange);
                if (dateMin < min)
                {
                        dateMin = min;
                }
             }
             else
             {
                dateMax = new Date(); //Set this to your absolute maximum date
             }                      
        }
        else if (input.id == "txtEndDate")
        {
                dateMax = new Date(); //Set this to your absolute maximum date
                if ($("#txtStartDate").datepicker("getDate") != null) 
                {
                        dateMin = $("#txtStartDate").datepicker("getDate");
                        var rangeMax = new Date(dateMin.getFullYear(), dateMin.getMonth(), dateMin.getDate() + dayRange);

                        if(rangeMax < dateMax)
                        {
                            dateMax = rangeMax; 
                        }
                }
        }
    return {
                minDate: dateMin, 
                maxDate: dateMax,
            }; 

}

</script>
			
			
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
