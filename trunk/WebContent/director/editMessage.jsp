<%@ page import="enums.AccessRightsEnum"%>
<%@ page import="bean.AccessRights"%>
<%
	Integer accountTypeId = (Integer) session
			.getAttribute("accountTypeId");
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
<link rel="SHORTCUT ICON" href="../images/favicon.ico" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../js/jquery.overlabel.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var overlayColor = $('#fancybox-overlay')
		$(document).ready(function() {
			$("label.overlabel").overlabel();
		});
	});
</script>
</head>
<div id="reload">
<jsp:useBean id="message" scope="page" class="sql.MessagesRepositoryImpl" />
<%!String MessageId1 = "", Fullname = "", Email = "", Message = "";
	int MessageId = 0; %>
<%
		MessageId1 = request.getParameter("MessageId");
		MessageId = Integer.parseInt(MessageId1);
		ResultSet rs = message.editMessage(MessageId);
			if (rs.next()) {
				MessageId = rs.getInt("Id");
				Fullname = rs.getString("Fullname");
				Email = rs.getString("Email");
				Message = rs.getString("Message");
				session.setAttribute("MessageId", MessageId);
				session.setAttribute("Fullname", Fullname);
				session.setAttribute("Email", Email);
				session.setAttribute("Message", Message);
				}
%>

<form name="editform" method="post" id="editMessage" action="">
	<table width="300px">
		<tr>
			<td colspan=2 style="font-weight: bold;" align="center"><h2
					style="margin-bottom: -3px;">Επεξεργασία μηνύματος</h2>
				<div class="hr" style="margin-bottom: -3px;"></div></td>
		</tr>
		<tr>
			<td colspan=2 align="center" height="10px"></td>
		</tr>
		<tr>
			<td>Id μηνύματος:</td>
			<td><input type="text" name="MessageId" value="<%=MessageId%>" disabled="true"></td>
		</tr>
		<tr>
			<td>Ονοματεπώνυμο:</td>
			<td><input type="text" name="Fullname" id="Fullname" value="<%=Fullname%>" style= 'border: 1px solid #999; background-color: #ddd;'></td>
		</tr>
		<tr>
			<td>Email:</td>
			<td><input type="text" name="Email" id="Email" value="<%=Email%>" style= 'border: 1px solid #999; background-color: #ddd;'></td>
		</tr>
		<tr>
			<td>Μήνυμα:</td>
			<td><textarea name="Message" id="Message"style='resize: none; width: 147px; height: 90px;'><%=Message%></textarea></td>
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


$(document).ready(function(){
	$("form#editMessage").submit(function() {
	var Fullname = $('#Fullname').attr('value');
	var Email = $('#Email').attr('value');	
	var Message = $('#Message').attr('value');
	$.ajax({
			type: "POST",
			url: "updateMessage.jsp",
			data: {"Fullname": Fullname, "Email": Email, "Message": Message},	
			success: function(result){
				var result = $.trim(result);
				$('#reload').load('editMessage.jsp', {'MessageId' : <%=MessageId%>,});									
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
<script>	
	$(document).ready(function() {
	$('a.delete').click(function(e) {
		e.preventDefault();
		var parent = $(this).parent();
		$.ajax({
			type: 'get',
			url: 'jquery-record-delete.php',
			data: 'ajax=1&delete=' + parent.attr('id').replace('record-',''),
			beforeSend: function() {
				parent.animate({'backgroundColor':'#fb6c6c'},300);
			},
			success: function() {
				parent.slideUp(300,function() {
					parent.remove();
				});
			}
		});
	});
});
</script>
	
	
<div id="correct" style="display: none; color: red; ">
	<strong>Το μήνυμα έχει ανανεωθή!</strong>
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