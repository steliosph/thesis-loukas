<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<html>
<head>
<%@ include file="top.jsp"%>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="SHORTCUT ICON" href="../images/favicon.ico" type="image/x-icon" />
 <%
 	String Username = "" ,Password = "" ;
	int CustomerId;
%>


</head>
 <body>
 <jsp:useBean id="account" scope="page" class="sql.AccountsRepositoryImpl" />

<%

 
	if (session.getAttribute("customerId") == null) {
	} else {
		CustomerId = (Integer) session.getAttribute("customerId") ;
		ResultSet rs = account.editAccountWithWebLogin(CustomerId);
		if (rs.next()) {			
			Username = rs.getString("username");
			Password = rs.getString("password");
		}
%>   
<div class="pageTop"></div>
<div class="pageMain">
	<div class="contentArea">
	<h1>Εισαγωγή του κωδικού σας <span> για να μπορέσετε να συνεχίσετε </span></h1>
<div class="center" id="result" style="font-size: 17pt; overflow: auto; font-style:italic; color:red;"></div>	
	<table id="table-2">
		<tr>
			<td bgcolor="#fffaaa">Username:</td>
			<td bgcolor="#fffaaa">Password:</td>			
		</tr>
		<tr>
			<td><input type="text" id="username" value="<%=Username%>" disabled="disabled"/></td>
			<td><input type="password" id="password" onkeydown="if (event.keyCode == 13) document.getElementById('Submit').click()"/></td>
			
		</tr>
	</table>
<div class = "center">
				<button type="button" class="btn" id="Submit"> 
					<span>Submit..</span>
				</button>
				<button type="button" class="btn" id="Clear" onClick="location.href='customer.jsp'">
					<span>Ακύρωση..</span>
				</button>
</div>
<script>
$("#password").focus();
var count = 1;
var x = 0;
$(function() {
    $("#Submit").click( function()
    {       
	var corPass = '<%=Password%>';
	var pass = document.getElementById('password').value;
	if (pass == "" ) {
		$("#result").text('Εισάγετε τον κωδικό σας για να συνεχίσετε');
    }
    else if (pass == corPass ) {		
		window.location = "editAccount.jsp";
	}
	else if ( pass != corPass ) 
		{
		count = count +1;
		x = 4 - count;
		$("#result").text('Εισάγατε λάθος κωδικό. Yπολοιπόμενες προσπάθειες: ' + x );
		}
	if (count > 3) {
			$("#result").text('Εισάγατε λάθος κωδικό. Για λόγους ασφαλείας θα αποσυνδεθείτε από το σύστημα');
			setTimeout(function() { 
				window.location = "../logout.jsp"; 
			}, 2000);
		}
    });
}); 
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