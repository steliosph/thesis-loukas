<%@ page import="java.text.NumberFormat" %> 
<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="account" scope="page" class="sql.AccountsRepositoryImpl" />
<%
	String Firstname = "", Lastname = "", cardNumber = "";
	int AccountId = 0;
	float Balance;
	Timestamp DateCreated;
	NumberFormat nf = NumberFormat.getInstance();
	nf.setMaximumFractionDigits(2);
	nf.setMinimumFractionDigits(2);	
%>

<html>
<head>
<script src="../js/sorttable.js"></script>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />
<script src="../js/jquery.min.js" type="text/javascript" ></script>
<link rel="stylesheet" type="text/css" href="../css/fancybox.css" />       
    
<script type="text/javascript">
$(document).ready(function() {
    var overlayColor=$('#fancy_overlay')
$("a.editform").fancybox({
	'padding':3,
	'overlayOpacity':0.2,
	'overlayColor':overlayColor,
	'frameWidth':430,
	'frameHeight':208,
	'hideOnContentClick':false,
	'callbackOnShow':modalStart,
	 'onClosed': function() {
		   parent.location.reload(true);
		  } 	
});
                 
function modalStart(){
    Cufon.replace('.fancy_title > div')};                                                          
});

$(document).ready(function() {
    $("label.overlabel").overlabel();
});      
</script>   
</head>
<body>
	<%@ include file="top.jsp"%>
	<div class="pageTop"></div>
	<div class="pageMain">
		<div class="contentArea">
			<!-- Main Menu Links -->
		<%@ include file="menu.jsp"%>
			<h1>Κατάθεση/Ανάληψη χρημάτων σε λογαριασμό</h1>
			<div>
				<div id="result" style="overflow: auto; height: 500px;">
					<table id="table-2" class="sortable">
						<caption>Στοιχεία λογαριασμών πελατών</caption>
						<thead>
							<tr>
								<th>Αρ. Λογ.</th>
								<th>Όνομα</th>
								<th>Επώνυμο</th>
								<th>Υπόλοιπο</th>								
								<th>Ημ. Τελ. Κίν.</th>
								<th class="sorttable_nosort" colspan="2">Actions</th>								
							</tr>
						</thead>
						<tbody>
							<%
							ResultSet rs = account.getResult();
								while (rs.next()) {									
									AccountId = rs.getInt("Account_Id");
									Firstname = rs.getString("Firstname");
									Lastname = rs.getString("lastname");
									Balance = rs.getFloat("balance");									
									DateCreated = rs.getTimestamp("date_created");
							%>
							<tr  align='center'> 
								<td><%=AccountId%></td>
								<td><%=Firstname%></td>
								<td><%=Lastname%></td>
 								<td><%=nf.format(Balance)%></td>
								<td><%=DateCreated%></td>								
								<td><a href="accountDeposit.jsp?AccountId=<%=rs.getInt("Account_Id")%>" class="editform" >Κατάθεση</a></td>                  				
								<td><a href="accountWithdrawals.jsp?AccountId=<%=rs.getInt("Account_Id")%>" class="editform" >Ανάληψη</a></td>                   				                  			
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>
