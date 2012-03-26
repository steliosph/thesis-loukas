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
		case CASHIER:
%>
<%@ page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>

<jsp:useBean id="loan" scope="page" class="sql.LoansRepositoryImpl" />
<jsp:useBean id="loantransactions" scope="page" class="sql.LoanTransactionsRepositoryImpl" />
<%!String TotalPayedAmount1;
	int LoanId, CustomerId;
	float remainingPayeeAmount, LoanAmount, LoanBalance, TotalPayedAmount, RemainingPayeeAmount;
%> 

<%
			LoanId = (Integer) session.getAttribute("loanId");	

			CustomerId = (Integer) session.getAttribute("customerId");
			LoanAmount = (Float) session.getAttribute("amount");
			LoanBalance = (Float) session.getAttribute("remainingPayeeAmount");										
			TotalPayedAmount1 = request.getParameter("TotalPayedAmount");
			TotalPayedAmount = Float.parseFloat(TotalPayedAmount1);	
			
			RemainingPayeeAmount = LoanBalance - TotalPayedAmount;			
			System.out.println(LoanId);
			System.out.println(CustomerId);
			System.out.println(LoanAmount);
			System.out.println(LoanBalance);
			System.out.println(TotalPayedAmount);
			System.out.println(RemainingPayeeAmount);
			
			loantransactions.loanTransaction(LoanId, CustomerId, LoanAmount, LoanBalance, TotalPayedAmount, RemainingPayeeAmount);
			loan.updateLoan(LoanId, CustomerId, RemainingPayeeAmount);
			
			out.println("correct");
			
			break;
		case NOACCESS:
			response.sendRedirect("../errorpage.jsp");
			break;
		}
	}
%>