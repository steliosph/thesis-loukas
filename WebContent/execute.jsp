<jsp:useBean id="webLogin" scope="page" class="sql.WebLoginRepositoryImpl" />
<jsp:useBean id="address" scope="page" class="sql.AddressRepositoryImpl" />
<jsp:useBean id="customer" scope="page" class="sql.CustomersRepositoryImpl" />

 <%@ page import="bean.Customer"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	String Username = request.getParameter("username");
	String Password = request.getParameter("password");
	String Lastname = request.getParameter("lastname");
	String Firstname = request.getParameter("firstname");
	
	
	Integer AddressId = address.addNullAddress();
	Integer CustomerId = customer.addUser(Firstname, Lastname, AddressId);
	webLogin.addUser(Username, Password,CustomerId);
%>


<%@ include file="top.jsp"%>
<div class="pageTop"></div>
<div class="pageMain">
	<div class="contentArea">
		<div class="full-page">
			<h1>
				Η εγγραφή σας ολοκληρώθηκε.<br> Πατήστε <a
					HREF="login popup.jsp">εδώ</a> για να συνδεθείτε.<br>
				<span>Στοιχεία λογαριαγμού:</span>
			</h1>
 

		</div>
		<div class="clear"></div>

	</div>
</div>
<%@ include file="footer.jsp"%>