<%@ page import="sql.WebLoginRepositoryImpl"%>
<%@ page import="sql.WebLoginRepository"%>
<%@ page import="sql.EmployeeRepositoryImpl"%>
<%@ page import="sql.EmployeeRepository"%>
<%@ page import="sql.CustomersRepositoryImpl"%>
<%@ page import="sql.CustomersRepository"%> 
<%@ page import="bean.WebLogin"%>
<%@ page import="bean.Employee"%>
<%@ page import="bean.Customer"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!-- Limit availability , redirect -->
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	WebLoginRepository webLoginRepository = new WebLoginRepositoryImpl();
	EmployeeRepository employeeRepository = new EmployeeRepositoryImpl();
	CustomersRepository customerRepository = new CustomersRepositoryImpl();
	
	if (username.isEmpty() || password.isEmpty()) {
		// TODO : Show him something else
	} else {
		switch (webLoginRepository.checkLogin(username, password)) {
		case WRONG_USERNAME_PASSWORD:
			session.setAttribute("isValid", "no");
%>
<jsp:forward page="epistrofi.jsp"></jsp:forward>
<%
	break;
		case CORRECT_EMPLOYEE:
			session.setAttribute("isValid", "yes");
			int employeeId = webLoginRepository.getEmployeeId(username,password);
			
			Employee employee = employeeRepository.retrieveEmployee(employeeId);
			
			session.setAttribute("employeeId", employee.getEmployeeId());
			session.setAttribute("firstname", employee.getFirstname());
			session.setAttribute("lastname", employee.getLastname());
			session.setAttribute("salary", employee.getSalary());
			session.setAttribute("dateHired", employee.getDateHired());
			session.setAttribute("branchId", employee.getBranchId());
			session.setAttribute("accountTypeId", employee.getAccountTypeId());
			session.setAttribute("addressId", employee.getAddressId());
			
			switch (webLoginRepository.getAdministratorType(employeeId)) {
			case CASHIER:
				response.sendRedirect("cashier/cashier.jsp");
	break;
			case DIRECTOR:
				response.sendRedirect("director/director.jsp");
 
	break;
			}
			break;
		case CORRECT_USER:
			session.setAttribute("isValid", "yes");
			int customerId = webLoginRepository.getCustomerId(username,password);
			
			Customer customer = customerRepository.retrieveCustomer(customerId);
			
			session.setAttribute("customerId", customer.getCustomerId());
			session.setAttribute("firstname", customer.getFirstname());
			session.setAttribute("lastname", customer.getLastname());
			session.setAttribute("addressId", customer.getAddressId());
%>

<jsp:forward page="index.jsp"></jsp:forward>

<%
	break;
		}

	}
%>

