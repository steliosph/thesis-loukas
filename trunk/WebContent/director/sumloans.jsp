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

<jsp:useBean id="loan" scope="page" class="sql.LoansRepositoryImpl" />
<jsp:useBean id="customer" scope="page" class="sql.CustomersRepositoryImpl" />

<%
	String Firstname = "", Lastname = "", customerId1 = "", sum = "", loan_id = "", customer_id = "", loan_amount = "", type = "", status = "";
	int y = 0, x = 0, loanid = 0, customerId = 0;
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
			<div id="director">
				<ul class="navmain">
					<li class="list"><a href="director.jsp">Γενικός Διευθυντής</a>
						<ul class="navsub">
							<li><a href="sumloans.jsp">Συνολική εικόνα δανείων</a></li>
							<li><a href="customers.jsp">Κατάσταση Πελατών</a></li>
							<li><a href="employee.jsp">Κατάσταση εργαζομένων</a></li>
						</ul></li>
				</ul>
			</div>
			<h1>Συνολική εικόνα Δανείων</h1>
			        <%
			        	String updateloans = "";
			        updateloans = (String) session.getAttribute("updateloans");
			        	session.removeAttribute("updateloans");
			        	if (updateloans != null)
			        		out.print(updateloans);
			        %>
			<div class="left noMargin">
				<script language="javascript">
					function toggle() {
						var sum = document.getElementById("toggleText");
						var text = document.getElementById("displayText");
						if (sum.style.display == "block") {
							sum.style.display = "none";
						} else {
							sum.style.display = "block";
						}
					}
				</script>
				<button class="btn"
					ONCLICK="window.location.href='javascript:toggle();'">
					<span>Συνολικό Άθροισμα Δανείων.</span>
				</button>
				<div id="toggleText" style="display: none">
					<h2>
				<%
					ResultSet rs = loan.SumOfLoans();
					while (rs.next()) {
						sum = rs.getString("SumOfLoans");
				%>

						Η τράπεζα μας έχει δώσει <br>δάνεια αξίας: <strong>
						<%=sum%></strong><br> ευρώ!!
									<%
							}
						%> 
					</h2>
				</div>
				<br>
				<form action="">
					<label for="customerId" class="overlabel">Eισαγωγή ID
						πελάτη</label> <input type="text" name="customerId" id="customerId"
						class="bInput textInput" /> <br>
					<button style="width: 236px" class="btn" type="submit">
						<span>Αναζήτηση Πελάτη.</span>
					</button>
					<br>
					<%
						customerId1 = request.getParameter("customerId");
					if (customerId1 == "")
						customerId1 = null;
					if(customerId1 != null) {						
						customerId = Integer.parseInt(customerId1);
						rs = customer.customerSearch(customerId);
						if (rs.next()) {
							y = 1;
							Firstname = rs.getString("firstname");
							Lastname = rs.getString("lastname");
						}}
					else y = 0;
						if (y == 1) {
							y = 0;
					%>

					Όνομα:<%=Firstname%><br> Επώνυμο:<%=Lastname%><br>

					<%
						}
					%>



				</form>


			</div>
			<div class="left ">
				<div style="overflow: auto; height: 500px;">
					<table id="table-2">
						<caption>Στοιχεία δανείου</caption>
						<thead>
							<tr>
								<th>Αριθμός Δανείου</th>
								<th>Αριθμός Πελάτη</th>
								<th>Ποσό</th>
								<th>Τύπος</th>
								<th>Κατάσταση</th>
								<th colspan="2">Actions</th>
								
							</tr>
						</thead>

						<tbody>


							<%
								rs = loan.getResult();
								while (rs.next()) {
									loan_id = rs.getString("loan_id");
									customer_id = rs.getString("customer_id");
									loan_amount = rs.getString("loan_amount");
									type = rs.getString("type");
									status = rs.getString("status");
							%>

							<tr>
								<td><%=loan_id%></td>
								<td><%=customer_id%></td>
								<td><%=loan_amount%></td>
								<td><%=type%></td>
								<td><%=status%></td>
								<td><a href="editloans.jsp?loanId=<%=rs.getInt("loan_id")%>" class="editform" >Edit</a></td>
                  				<td><a href="sumloans.jsp?delete=yes&deleteid=<%=rs.getInt("loan_id")%>" onclick="return del()">Delete</a></td>
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
	case CASHIER:
	case NOACCESS:
		response.sendRedirect("errorpage.jsp");
	break;
	}}
%>
