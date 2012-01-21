<%@ page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");%>

<jsp:useBean id="customer" scope="page" class="sql.CustomersRepositoryImpl" />
<jsp:useBean id="addressbean" scope="page" class="sql.AddressRepositoryImpl" />

<%!String customerId1 = "", addressId1 = "", firstname = "", lastname = "", address = "",
			city = "", postalCode = "", telephone = "";
	int customerId = 0, addressId = 0;%>

<%


addressId = (Integer) session.getAttribute("addressId");
System.out.println(addressId);


customerId = (Integer) session.getAttribute("customerId");
System.out.println(customerId);

firstname = request.getParameter("firstname");
lastname = request.getParameter("lastname");
address = request.getParameter("address");
city = request.getParameter("city");
postalCode =  request.getParameter("postalCode");
telephone = request.getParameter("telephone");
		


	customer.updateCustomer(customerId, firstname, lastname);
	addressbean.updateAddress(addressId, address, city, postalCode, telephone);
	
	session.setAttribute("updatecustomer","O πελάτης με κωδικό:(" + customerId + ") ανανεώθηκε!");
 
%>

<jsp:forward page="customers.jsp">
	<jsp:param name="update" value="<%=customerId%>" />
</jsp:forward>
