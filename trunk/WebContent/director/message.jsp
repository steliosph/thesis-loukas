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
<%@ page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="message" scope="page" class="sql.MessagesRepositoryImpl" />
<%
	String Message = "", Fullname = "", Email = "", Time = "";
	int Id;
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
			<h1>Μηνύματα από πελάτες</h1>
				<div style="max-height:500px; overflow: auto; width: 66%; margin:0 auto;">
				
					<table id="table-2" class="sortable">
						<thead>
							<tr>
								<th>Ονοματεπώνυμο</th>
								<th>Εmail</th>
								<th>Hμερομηνία</th>
								<th>Μήνυμα</th>						
								<th colspan="2" class="sorttable_nosort">Επιλογές</th>
								
							</tr>
						</thead>

						<tbody>


							<%
								ResultSet rs = message.getResult();
								while (rs.next()) {	
									Id = rs.getInt("Id");
									Message = rs.getString("message");
									Fullname = rs.getString("fullname");
									Email = rs.getString("email");
									Time = rs.getString("time");
									Message = Message.substring(0, Math.min(25, Message.length()));													
							%>

							<tr>
								<td><%=Fullname%></td>
								<td><%=Email%></td>
								<td><%=Time%></td>
								<td><%=Message%><a href="editMessage.jsp?MessageId=<%=Id%>" class="editform" >...</a></td>
								<td><a href="editMessage.jsp?MessageId=<%=Id%>" class="editform" >Aλλαγή</a></td>
								<td class="record" id="<%=Id%>"><a href="?delete='<%=Id%>'" class="delete">Διαγραφή</a></td>
							</tr>

							<%
								}
							%>			

						</tbody>
<script>
$(document).ready(function() {	
	$('a.delete').click(function(e) {
		if(confirm("Θέλετε να διαγράψετε το συγκεκριμένο μήνυμα?")) {
		e.preventDefault();
		var parent = $(this).parent();
		var aa = $(this).closest('tr'); 	


		
		$.ajax({
			type: 'get',
			url: 'deleteMessage.jsp?',
			data: 'deleteMessage=yes&messageId=' + parent.attr('id'),
			beforeSend: function() {
				aa.animate({'backgroundColor':'#fb6c6c'},300);
			},
			success: function() {
				aa.slideUp(300,function() {
					aa.remove();
				});
			}
		});
		}
		else {
		return false; }
		});
});
</script>


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
