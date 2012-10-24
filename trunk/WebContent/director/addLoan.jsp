<%@ page import="enums.AccessRightsEnum"%>
<%@ page import="bean.AccessRights"%>
<%@page import="enums.LoanStatus"%>
<%@page import="enums.LoanOptions"%>

<%	
	Integer accountTypeId = (Integer) session.getAttribute("accountTypeId");
	AccessRights accessRights = new AccessRights();
	if (accountTypeId == null) {
		response.sendRedirect("../errorpage.jsp");
	} else {
	switch (accessRights.getAccessRights(accountTypeId)) {
	case DIRECTOR:
%>
<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="../css/fancybox.css" />
<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../js/jquery.overlabel.min.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="../css/jquery.autocomplete.css" />
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script src="../js/jquery.autocomplete.js"></script>
</head>
<div id="reload">
<jsp:useBean id="loans" scope="page" class="sql.LoansRepositoryImpl" />
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("loanOptions",enums.LoanOptions.values());
	pageContext.setAttribute("loanStatus",enums.LoanStatus.values());
%>
	
<%
	
%>

<form name="editform" method="post" id="addLoans" action="">
	<table width="300px">
		<tr>
			<td colspan=2 style="font-weight: bold;" align="center"><h2
					style="margin-bottom: -3px;">Εισαγωγή Δανείου</h2>
				<div class="hr" style="margin-bottom: -3px;"></div></td>
		</tr>
		<tr>
			<td colspan=2 align="center" height="10px"></td>
		</tr>
		<tr>
			<td>Όνοματεπώνυμο:</td>
			<td><input type="text" id="autoComplete" name="autoComplete" class="input_text_search"/>

    		</td>
    	</tr>
				
		<tr>
			<td>Ποσό:</td>
			<td><input type="text" name="amount" id="amount" class="input_text"></td>
		</tr>
		<tr>
			<td>Tύπος:</td>
			<td><select name='type' id="type" class="select">
					<c:forEach items="${loanOptions}" var="loanOptions">
						<option value="${loanOptions.type}" ${loanOptions.type==type? 'selected' : ''}>${loanOptions.type}</option>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td>Κατάσταση:</td>
			<td><select name=status id="status" class="select">
					<c:forEach items="${loanStatus}" var="loanStatus">
						<option value="${loanStatus.status}" ${loanStatus.status==status? 'selected' : ''}>${loanStatus.status}</option>
					</c:forEach>
			</select></td>
		</tr>
	</table>
	<div class="hr" style="margin-bottom: -3px;"></div>
	<p class="right noMargin">
		<button type="submit" class="btn" value="Submit">
			<span>Αποθήκευση..</span>
		</button>
		<br>
</form>
</div>


<script>
	$("#autoComplete").autocomplete("autoComplete.jsp");
		
	$(document).ready(function(){
		$("form#addLoans").submit(function() {
		var amount = $('#amount').attr('value');
		var type = $('#type').attr('value');	
		var status = $('#status').attr('value');
		var fullname = $('#autoComplete').attr('value');
			$.ajax({
				type: "POST",
				url: "addLoanExecute.jsp",
				data: {"Amount": amount, "Type": type, "Status": status, "Fullname": fullname},	
				success: function(result){
					var result = $.trim(result);														
					setTimeout(function(){				
					if (result=='correct'){								
						$('#correct').fadeIn(500).show();
						setTimeout(function() {
						    $('#correct').fadeOut(1600, "linear");
						}, 3000);
					} else {}			
				;},150);
					}
			});
		return false;
		});
	});
	;
</script>


 <div id="correct" style="display: none; color: red; ">
	<strong>To δάνειο προσθέθηκε!
	</strong>
</div>

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