<%@ page import="java.text.NumberFormat" %>    
<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="creditCards" scope="page" class="sql.CreditCardsRepositoryImpl" />
<%
	String firstname = "", lastname = "", cardNumber = "";
	float balance, orio;
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
	'frameWidth':400,
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
			<h1>Κατάθεση/Ανάληψη χρημάτων σε πιστωτική κάρτα κάρτα</h1>
			        <%
			        	String updatecc = "";
			        updatecc = (String) session.getAttribute("updatecc");
			        	session.removeAttribute("updatecc");
			        	if (updatecc != null)
			        		out.print(updatecc);
			        %>
			<div>
				<div style="max-height:500px; overflow: auto; width: 590px; margin:0 auto;">
					<table id="table-2" class="sortable">
						<caption>Στοιχεία πιστωτικών καρτών</caption>
						<thead>
							<tr>
								<th>Αριθμός κάρτας</th>
								<th>Όνομα</th>
								<th>Επώνυμο</th>
								<th>Υπόλοιπο</th>
								<th>Όριο</th>
								<th class="sorttable_nosort" colspan="2">Actions</th>								
							</tr>
						</thead>
						<tbody>
							<%
							ResultSet rs = creditCards.getResultWithName();
								while (rs.next()) {									
									cardNumber = rs.getString("card_number");
									firstname = rs.getString("Firstname");
									lastname = rs.getString("lastname");
									balance = rs.getFloat("balance");									
									orio = rs.getFloat("orio");
							%>
							<tr align='center'> 
								<td><%=cardNumber%></td>
								<td><%=firstname%></td>
								<td><%=lastname%></td>
 								<td><%=nf.format(balance)%></td>
								<td><%=nf.format(orio)%></td>								
								<td><a href="ccDeposit.jsp?cardNumber=<%=rs.getString("card_number")%>" class="editform" >Κατάθεση</a></td>                  				
								<td><a href="ccWithdrawals.jsp?cardNumber=<%=rs.getString("card_number")%>" class="editform" >Ανάληψη</a></td>                   				                  			
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