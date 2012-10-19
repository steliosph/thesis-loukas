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
%>

<%@ page import="sql.LoansRepository"%>
<%@ page import="bean.Loans"%> 
<%@ page import="sql.LoansRepositoryImpl"%>
<%@ page language="java" import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="customer" scope="page" class="sql.CustomersRepositoryImpl" />

<%
	String firstname = "", lastname = "", address = "", city = "", postalCode = "", telephone = "";
	int customerId = 0;
%>
 
<html>
<head>
<script src="../js/sorttable.js"></script>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="SHORTCUT ICON" href="../images/favicon.ico" type="image/x-icon" />
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
			<div id="director">
				<ul class="navmain">
					<li class="list"><a href="director.jsp">Γενικός Διευθυντής</a>
						<ul class="navsub">
							<li><a href="sumloans.jsp">Συνολική εικόνα δανείων</a></li>
							<li><a href="customers.jsp">Κατάσταση Πελατών</a></li>
							<li><a href="employee.jsp">Κατάσταση εργαζομένων</a></li>
							<li><a href="message.jsp">Mηνύματα</a></li>
						</ul></li>
				</ul>
			</div>
			<h1>Kατάσταση πελατών της τράπεζας</h1>
				<div style="overflow: auto; height: 500px;">
					<table id="table-2" class="sortable">
						<thead>
							<tr>
								<th>Αρ. Πελ.</th>
								<th>Όνομα</th>
								<th>Επώνυμο</th>
								<th>Διεύθ.</th>
								<th>Πόλη</th>
								<th>Τ.Κ</th>
								<th>Τηλέφωνο</th>
								<th colspan="2" class="sorttable_nosort">Επιλογές</th>
								
							</tr>
						</thead>

						<tbody>


							<%
								ResultSet rs = customer.getResult();
								while (rs.next()) {								
									customerId = rs.getInt("customer_id");
									firstname = rs.getString("firstname");
									lastname = rs.getString("lastname");
									address = rs.getString("address");
									city = rs.getString("city");
									postalCode = rs.getString("postal_code");
									telephone = rs.getString("telephone");
							%>

							<tr>
								<td><%=customerId%></td>
								<td><%=firstname%></td>
								<td><%=lastname%></td>
								<td><%=address%></td>
								<td><%=city%></td>
								<td><%=postalCode%></td>
								<td><%=telephone%></td>
								<td><a href="editcustomer.jsp?customerId=<%=rs.getInt("customer_id")%>" class="editform" >Aλλαγή</a></td>
                  			</tr>

							<%
								}
							%>			

						</tbody>

					</table>
				</div>
				<div class="clear"></div>
		</div>
		<div class="clear"></div>
	</div>
	<%@ include file="../footer.jsp"%>

</body>
</html>
<%
	break;
	case CASHIER:
	case NOACCESS:
	case CUSTOMER:
		response.sendRedirect("../errorpage.jsp");
	break;
	}}
%>
