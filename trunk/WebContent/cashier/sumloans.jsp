<%@ page import="java.text.NumberFormat" %>
<%@ page import="sql.LoansRepository"%>
<%@ page import="bean.Loans"%> 
<%@ page import="sql.LoansRepositoryImpl"%> 
<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="loan" scope="page" class="sql.LoansRepositoryImpl" />
<jsp:useBean id="customer" scope="page" class="sql.CustomersRepositoryImpl" />
<%
	String Firstname = "", Lastname = "", customerId1 = "", sum = "", loan_id = "", customer_id = "", type = "", status = "";
	int y = 0, loanid = 0, customerId = 0;
	Float loan_amount;
	
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
					<table id="table-2" class="sortable">
						<caption>Στοιχεία δανείων</caption>
						<thead>
							<tr>
								<th>Αρ. Δανείου</th>
								<th>Αρ. Πελάτη</th>
								<th>Ποσό</th>
								<th>Τύπος</th>
								<th>Κατάσταση</th>
								<th colspan="2" class="sorttable_nosort">Επιλογές</th>
								
							</tr>
						</thead>
						<tbody>
							<%
								rs = loan.getResult();
								while (rs.next()) {
									loan_id = rs.getString("loan_id");
									customer_id = rs.getString("customer_id");
									loan_amount = rs.getFloat("loan_amount");
									type = rs.getString("type");
									status = rs.getString("status");									
							%>
							<tr>
								<td align='center'><%=loan_id%></td>
								<td align='center'><%=customer_id%></td>
								<td align='center'><%=nf.format(loan_amount)%></td>
								<td align='center'><%=type%></td>
								<td align='center'><%=status%></td>
								<td align='center'><a href="editloans.jsp?loanId=<%=rs.getInt("loan_id")%>" class="editform" >Aλλαγή</a></td>
                  				<td align='center'><a href="sumloans.jsp?delete=yes&deleteid=<%=rs.getInt("loan_id")%>" onclick="return del()">Διαγραφή</a></td>
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