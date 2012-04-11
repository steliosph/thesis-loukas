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
<%@ page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");%>

<jsp:useBean id="employee" scope="page" class="sql.EmployeeRepositoryImpl" />
<jsp:useBean id="addressbean" scope="page" class="sql.AddressRepositoryImpl" />

<%
	 String salary1="", firstname = "", lastname = "", type= "", empAddress = "", empCity = "", empPostalCode = "", empTelephone = "", branchAddress= "", branchCity="", branchPostalCode= "", branchTelephone= "";
	 int employeeId = 0, empAddressId = 0, branchAddressId = 0;
	 double salary = 0;
	 Timestamp dataHired;
%>	

<%


	employeeId = (Integer) session.getAttribute("employeeId");
	empAddressId = (Integer) session.getAttribute("empAddressId");
	branchAddressId = (Integer) session.getAttribute("branchAddressId");
	firstname = request.getParameter("firstname");
	lastname = request.getParameter("lastname");
	salary1 = request.getParameter("salary");
	salary = Double.parseDouble(salary1);
	// dateHired = request.getParameter("dateHired");
	type = request.getParameter("type");
	empAddress = request.getParameter("empAddress");
	empCity = request.getParameter("empCity");
	empPostalCode = request.getParameter("empPostalCode");
	empTelephone = request.getParameter("empTelephone");
	branchAddress = request.getParameter("branchAddress");
	branchCity = request.getParameter("branchCity");
	branchPostalCode = request.getParameter("branchPostalCode");
	branchTelephone = request.getParameter("branchTelephone");
	
	employee.updateEmployee(employeeId, firstname, lastname, salary);
	addressbean.updateAddress(empAddressId, empAddress, empCity, empPostalCode, empTelephone);
	addressbean.updateAddress(branchAddressId, branchAddress, branchCity, branchPostalCode, branchTelephone);
	out.println("correct");
	
	break;
	case CASHIER:
	case NOACCESS:
	case CUSTOMER:
		response.sendRedirect("../errorpage.jsp");
	break;
	}}
%>