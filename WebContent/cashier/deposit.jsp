<%@ page import="enums.AccessRightsEnum"%>
<%@ page import="bean.AccessRights"%>

<%	
	Integer accountTypeId = (Integer) session.getAttribute("accountTypeId");
	AccessRights accessRights = new AccessRights();
	if (accountTypeId == null) {
		response.sendRedirect("../errorpage.jsp");
	} else {
	switch (accessRights.getAccessRights(accountTypeId)) {
	case DIRECTOR:
	case CASHIER:
%>
<%@ page import="sql.LoansRepository"%>
<%@ page import="bean.Loans"%> 
<%@ page import="sql.LoansRepositoryImpl"%> 
<%@ page language="java" import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="loan" scope="page" class="sql.LoansRepositoryImpl" />
<jsp:useBean id="customer" scope="page" class="sql.CustomersRepositoryImpl" />

<%
	String firstname = "", lastname = "", loan_id = "", type = "", status = "";
	int loanid = 0;
	float remaingPayeeAmount, loan_amount;
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
	'callbackOnShow':modalStart         
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
			<h1>Συνολική εικόνα Δανείων</h1>
			        <%
			        	String updateloans = "";
			        updateloans = (String) session.getAttribute("updateloans");
			        	session.removeAttribute("updateloans");
			        	if (updateloans != null)
			        		out.print(updateloans);
			        %>
			<div>
				<div style="overflow: auto; height: 500px;">
					<table id="table-2">
						<caption>Στοιχεία δανείών</caption>
						<thead>
							<tr>
								<th>Αριθμός Δανείου</th>
								<th>Όνομα</th>
								<th>Επώνυμο</th>
								<th>Αρχικό Ποσό</th>
								<th>Ποσό για εξόφληση</th>
								<th>Κατάσταση</th>
								<th>Τύπος</th>
								<th>Actions</th>
								
							</tr>
						</thead>

						<tbody>


							<%
							ResultSet rs = loan.getResultWithName();
								while (rs.next()) {
									loan_id = rs.getString("loan_id");
									firstname = rs.getString("Firstname");
									lastname = rs.getString("lastname");
									remaingPayeeAmount = rs.getFloat("remaining_payee_amount");
									loan_amount = rs.getFloat("loan_amount");
									type = rs.getString("type");
									status = rs.getString("status");
							%>

							<tr> 
								<td><%=loan_id%></td>
								<td><%=firstname%></td>
								<td><%=lastname%></td>
 								<td><%=loan_amount%></td>
 								<td><%=remaingPayeeAmount%></td>
								<td><%=type%></td>
								<td><%=status%></td>
								<td><a href="amountOfDeposit.jsp?loanId=<%=rs.getInt("loan_id")%>" class="editform" >Κατάθεση</a></td>                  				
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
<%
	break;
	case NOACCESS:
		response.sendRedirect("errorpage.jsp");
	break;
	}}
%>
