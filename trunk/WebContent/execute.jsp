<jsp:useBean id="webLogin" scope="page" class="sql.WebLoginRepositoryImpl" />
 <%@ page import="bean.Customer"%>
  <%@ page import="sql.CustomersRepository"%>
  <%@ page import="sql.CustomersRepositoryImpl"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	String Username = request.getParameter("username");
	String Password = request.getParameter("password");
	String Lastname = request.getParameter("lastname");
	String Firstname = request.getParameter("firstname");

	
	CustomersRepository customerRepository = new CustomersRepositoryImpl();
	Integer CustomerId = customerRepository.addUser(Firstname, Lastname);
	
webLogin.addUser(Username, Password,CustomerId);
%>


<%@ include file="top.jsp"%>
<div class="pageTop"></div>
<div class="pageMain">
	<div class="contentArea">
		<div class="full-page">
			<h1>
				Η εγγραφή σας ολοκληρώθηκε.<br> Πατήστε <a
					HREF="login popup.jsp" class="login">εδώ</a> για να συνδεθήτε.<br>
				<span>Στοιχεία λογαριαγμού:</span>
			</h1>
 

		</div>
		<div class="clear"></div>

	</div>
</div>
<%@ include file="footer.jsp"%>