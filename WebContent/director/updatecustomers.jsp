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


addressId1 = request.getParameter("addressId");
addressId = Integer.parseInt(addressId1);

System.out.println(addressId);
customerId1 = request.getParameter("customerId");
customerId = Integer.parseInt(customerId1);
System.out.println(customerId);

firstname = request.getParameter("firstname");
lastname = request.getParameter("lastname");
address = request.getParameter("address");
city = request.getParameter("city");
postalCode =  request.getParameter("postalCode");
telephone = request.getParameter("telephone");
		


	customer.updateCustomer(customerId, firstname, lastname);
	addressbean.updateAddress(addressId, address, city, postalCode, telephone);
	
//	session.setAttribute("update","Το δάνειο με κωδικό:(" + LoanId + ") ανανεώθηκε!");
 
%>

<jsp:forward page="sumloans.jsp">
	<jsp:param name="update" value="<%=customerId%>" />
</jsp:forward>
