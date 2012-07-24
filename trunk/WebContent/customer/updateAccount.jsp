
<%@ page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>

<jsp:useBean id="customer" scope="page" class="sql.CustomersRepositoryImpl" />
<jsp:useBean id="addressbean" scope="page" class="sql.AddressRepositoryImpl" />
<jsp:useBean id="webLogin" scope="page" class="sql.WebLoginRepositoryImpl" />

<%!String firstname, lastname, address, city, postalCode, phone, username, password;
	int customerId, addressId;%>

<%
	addressId = (Integer) session.getAttribute("addressId");
	customerId = (Integer) session.getAttribute("customerId");

	firstname = request.getParameter("firstname");
	lastname = request.getParameter("lastname");
	address = request.getParameter("address");
	city = request.getParameter("city");
	postalCode =  request.getParameter("postalCode");
	phone = request.getParameter("phone");
	username = request.getParameter("username");
	password = request.getParameter("password");
		
	customer.updateCustomer(customerId, firstname, lastname);
	addressbean.updateAddress(addressId, address, city, postalCode, phone);
	webLogin.updateWebLogin(username, password, customerId);
 


%>
