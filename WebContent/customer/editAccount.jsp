<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<html>
<head>
<%@ include file="top.jsp"%>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="SHORTCUT ICON" href="../images/favicon.ico" type="image/x-icon" />
<script type="text/javascript">
var xmlhttp,xmlhttp1;

function updateAccount(firstname,lastname,address,city,postalCode,phone,password,username) {
	xmlhttp = GetXmlHttpObject();	
	if (xmlhttp == null) {
		alert("Your browser does not support AJAX!");
		return;
	}
	var url = "updateAccount.jsp";
	url = url + "?firstname=" + firstname + "&lastname=" + lastname + "&address=" + address + "&city=" + city + "&postalCode=" + postalCode + "&phone=" + phone + "&password=" + password + "&username=" + username;
	xmlhttp.onreadystatechange = stateChanged;
	xmlhttp.open("GET", url, true);
	xmlhttp.send(null);
}

function stateChanged() {
	if (xmlhttp.readyState == 4) {
		 $("#result").html("<div> <img src='../images/loading.gif' alt='Loading..'></div>");	
		 
		setTimeout(function() {
			$("#result").fadeIn();	
			$("#result").text('Τα προσωπικά σας στοιχεία έχουν ανανεωθεί');
		}, 1500);
		//var answered = false;
		//setTimeout(location.reload,3000);
		
	}

}

function GetXmlHttpObject() {
	if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	}
	if (window.ActiveXObject) {
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	return null;
}
</script>
</head>
 <body>
 <jsp:useBean id="account" scope="page" class="sql.AccountsRepositoryImpl" />
 <%
 	String Firstname = "" , Lastname = "" ,Address = "" ,City = "" ,PostalCode = "" ,Phone = "" ,Username = "" ,Password = "" ;
	int AddressId, CustomerId;
%>
<%

 
	if (session.getAttribute("customerId") == null) {
	} else {
		CustomerId = (Integer) session.getAttribute("customerId") ;
		ResultSet rs = account.editAccountWithWebLogin(CustomerId);
		if (rs.next()) {
			Firstname = rs.getString("firstname");
			Lastname = rs.getString("lastname");
			Address = rs.getString("address");
			City = rs.getString("city");
			PostalCode = rs.getString("postal_code");
			Phone = rs.getString("telephone");
			Username = rs.getString("username");
			Password = rs.getString("password");
			AddressId = rs.getInt("address_id");
			
			session.setAttribute("addressId", AddressId);
			session.setAttribute("customerId", CustomerId);
		}
%>   
<div class="pageTop"></div>
<div class="pageMain">
	<div class="contentArea">
	<h1>Ρυθμίσεις Λογαριασμού</h1>
	<div class="center" id="result" style="font-size: 17pt; overflow: auto; font-style:italic; color:red;"></div>	
<img src="edit.png" style="float: left; height:250px;"/>
<div class="left">	
	<table id="table-2">
		<tr>
			<td bgcolor="#fffaaa">Όνομα:</td>
			<td><input type="text" id="firstname" value="<%=Firstname%>" onkeydown="if (event.keyCode == 13) document.getElementById('Submit').click()"/></td>
			<td>Το πραγματικό σας όνομα</td>
		</tr>
		<tr>
			<td bgcolor="#fffaaa">Επώνυμο:</td>
			<td><input type="text" id="lastname" value="<%=Lastname%>" onkeydown="if (event.keyCode == 13) document.getElementById('Submit').click()"/></td>
			<td>Το πραγματικό σας επώνυμο</td>
		</tr>
		<tr>
			<td bgcolor="#fffaaa">Διεύθυνση:</td>
			<td><input type="text" id="address" value="<%=Address%>" onkeydown="if (event.keyCode == 13) document.getElementById('Submit').click()" /></td>
			<td>Η πραγματική σας διεύθυνση σπιτιού</td>
		</tr>
		<tr>
			<td bgcolor="#fffaaa">Πόλη:</td>
			<td><input type="text" id="city" value="<%=City%>" onkeydown="if (event.keyCode == 13) document.getElementById('Submit').click()" /></td>
			<td>Η πραγματική σας πόλη του σας</td>
		</tr>
		<tr>
			<td bgcolor="#fffaaa">Ταχ. Κώδ.:</td>
			<td><input type="text" id="postalCode" value="<%=PostalCode%>" onkeydown="if (event.keyCode == 13) document.getElementById('Submit').click()" /></td>
			<td>Ο πραγματικός σας ταχυδρομικός κώδικας</td>
		</tr>
		<tr>
			<td bgcolor="#fffaaa">Τηλέφωνο:</td>
			<td><input type="text" id="phone" value="<%=Phone%>" onkeydown="if (event.keyCode == 13) document.getElementById('Submit').click()" /></td>
			<td>Τηλέφωνο</td>
		</tr>
		<tr>
			<td bgcolor="#fffaaa">Username:</td>
			<td><input type="text" id="username" value="<%=Username%>" disabled="disabled"/></td>
			<td>Το username σας δεν μπορεί να αλλάξει και καθόρίζετε από τον αρ. πελάτη</td>
		</tr>
		<tr>
			<td bgcolor="#fffaaa">Νέος κωδικός:</td>
			<td><input type="password" id="password" onkeydown="if (event.keyCode == 13) document.getElementById('Submit').click()" /></td>
			<td>Εισαγωγή νέου κωδικόυ</td>
		</tr>
		<tr>
			<td bgcolor="#fffaaa">Επαλήθευση:</td>
			<td><input type="password" id="confirPassword" onkeydown="if (event.keyCode == 13) document.getElementById('Submit').click()" /></td>
			<td>Επαλήθευση νέου κωδικόυ</td>
		</tr>
	</table>
	
	<button type="button" class="btn" id="Submit">
		<span>Αποθήκευση..</span>
	</button>
	<button type="button" class="btn" id="Clear" onClick="location.href='customer.jsp'">
		<span>Ακύρωση..</span>
	</button>
</div>

<script>
$(function() {
    $("#Submit").click( function()
    {     
    	var firstname = document.getElementById('firstname').value ;
    	var lastname = document.getElementById('lastname').value;
    	var address = document.getElementById('address').value;
    	var city = document.getElementById('city').value;      	
    	var postalCode = document.getElementById('postalCode').value;
    	var phone = document.getElementById('phone').value;
    	var username = document.getElementById('username').value;
    	var password = document.getElementById('password').value;
    	var confirmPassword = document.getElementById('confirPassword').value;		    	
   		var x = 0;
if (firstname == "" || firstname.length <= 2) {
	$("#result").text('To όνομα δεν μπορεί να είναι κενό');
	$("#firstname").focus();

}
else {
	x = x + 1;
}
if (lastname == "" || lastname.length <= 3) {
	$("#result").text('To επώνυμο δεν μπορεί να είναι κενό');
	$("#lastname").focus();
}
else {
	x = x + 1;
}
if (address == "" || address.length <= 7) {
	$("#result").text('H διεύθυνση δεν μπορεί να είναι κενή');
	$("#address").focus();
}
else {
	x = x + 1;
}
if (city == "" || city.length <= 3) {
	$("#result").text('Η πόλη δεν μπορεί να είναι κενή');
	$("#city").focus();
}
else {
	x = x + 1;
}
if (postalCode == "" || postalCode.length <= 3) {
	$("#result").text('Ο ταχυδρομικός κώδικας δεν μπορεί να είναι κενός');
	$("#postalCode").focus();
}
else {
	x = x + 1;
}
if (phone == "" || phone.length <= 9) {
	$("#result").text('To τηλέφωνο δεν μπορεί να είναι κενό η λιγότερο από 10 χαρακτήρες');
	$("#phone").focus();
}
else {
	x = x + 1;
}

if (password != "" || confirmPassword != "") {	
		if (password == confirmPassword) {
			x = x + 1;
		}
		else if (confirmPassword == "") {		
			$("#result").text('Επαληθεύστε τον νέο σας κωδικό');
			$("#confirmPassword").focus();
			x = x - 1;
		}
		else if (password == "") {			
			$("#result").text('Παρακαλώ εισάγετε τον νέο σας κωδικό και στη συνέχεια την επαλήθευση του');
			$("#password").focus();
			x = x - 1;
		}
		else if (password != confirmPassword) {
			$("#result").text('Η επαλήθευση του κωδικού δεν είναι σωστή');
			$("#confirmPassword").focus();
			x = x - 1;			
		}
}




if (password == "" && confirmPassword == "") {
	var password = '<%=Password%>';
}

if (x >= 6 )
 {	
	updateAccount(firstname,lastname,address,city,postalCode,phone,password,username);
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