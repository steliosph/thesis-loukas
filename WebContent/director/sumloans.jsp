<%@ page import="sql.LoansRepository"%>
<%@ page import="bean.Loans"%>
<%@ page import="sql.LoansRepositoryImpl"%>
<%@ page language="java" import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="loan" scope="page" class="sql.LoansRepositoryImpl" />

<%
	String sum = "" , loan_id = "", customer_id= "", loan_amount= "", type="", status= "";
%>

<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" href="style.css" type="text/css" />
<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />
<script src="../js/jquery.min.js" type="text/javascript" ></script>
<script type="text/javascript">
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
							<li><a href="deposits.jsp">Συνολική εικόνα καταθέσεων</a></li>
							<li><a href="egkrisi.jsp">Δάνεια προς έγκριση</a></li>
						</ul></li>
				</ul>
			</div>
			<h1>Συνολική εικόνα Δανείων</h1>
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
									<% }  %> 
					</h2>
				</div>
				<br>
				<form action="">
					<label for="customerID" class="overlabel">Eισαγωγή ID
						πελάτη</label> <input type="text" name="customerID" id="customerID"
						class="aInput textInput" /> <br>
					<button style="width: 236px" class="btn" type="submit">
						<span>Αναζήτηση Πελάτη.</span>
					</button>
					<br>





				</form>


			</div>
			<div class="left ">
				<div style="overflow: auto; height: 500px;">
					<table id="table-2">
						<caption>Στοιχεία δανείου</caption>
						<thead>
							<tr>
								<th>Αριθμός Δανείου</th>
								<th>ΙD Πελάτη</th>
								<th>Ποσό</th>
								<th>Τύπος</th>
								<th>Κατάσταση</th>
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
						status= rs.getString("status");

						
				%>

							<tr>
								<td><%=loan_id%></td>
								<td><%=customer_id%></td>
								<td><%=loan_amount%></td>
								<td><%=type%></td>
								<td><%=status%></td>
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
