<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="creditCards" scope="page" class="sql.CreditCardsRepositoryImpl" />
<%
	String firstname = "", lastname = "", cardNumber = "";
	float balance, orio;
%>

<html>
<head>
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
			<h1>Συνολική εικόνα πιστωτικών καρτών</h1>
			        <%
			        	String updatecc = "";
			        updatecc = (String) session.getAttribute("updatecc");
			        	session.removeAttribute("updatecc");
			        	if (updatecc != null)
			        		out.print(updatecc);
			        %>
			<div>
				<div style="overflow: auto; height: 500px;">
					<table id="table-2">
						<caption>Στοιχεία πιστωτικών καρτών</caption>
						<thead>
							<tr>
								<th>Αριθμός κάρτας</th>
								<th>Όνομα</th>
								<th>Επώνυμο</th>
								<th>Υπόλοιπο</th>
								<th>Όριο</th>
								<th colspan="2">Actions</th>								
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
							<tr> 
								<td><%=cardNumber%></td>
								<td><%=firstname%></td>
								<td><%=lastname%></td>
 								<td><%=balance%></td>
								<td><%=orio%></td>								
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