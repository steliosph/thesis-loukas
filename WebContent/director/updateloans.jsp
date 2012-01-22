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
<%@ page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
%>

<jsp:useBean id="loan" scope="page" class="sql.LoansRepositoryImpl" />
<jsp:useBean id="loanstatus" scope="page"
	class="sql.LoanStatusRepositoryImpl" />
<%!String LoanAmount1 = "", CustomerId1 = "", LoanId1 = "", Type = "",
			Status = "";
	int LoanId = 0, CustomerId = 0;
	float LoanAmount;%>

<%
			LoanId = (Integer) session.getAttribute("loanId");
			System.out.println(LoanId);

			CustomerId1 = request.getParameter("customerId");
			CustomerId = Integer.parseInt(CustomerId1);
			System.out.println(CustomerId);

			LoanAmount1 = request.getParameter("amount");
			LoanAmount = Float.parseFloat(LoanAmount1);
			System.out.println(LoanAmount);

			Type = request.getParameter("type");
			Status = request.getParameter("status");

			System.out.println(Type);
			System.out.println(Status);

			loan.updateLoan(LoanId, CustomerId, LoanAmount);
			loanstatus.updateLoan(LoanId, Status, Type);
			session.setAttribute("updateloans", "Το δάνειο με κωδικό:("
					+ LoanId + ") ανανεώθηκε!");

			response.sendRedirect("sumloans.jsp");

			break;
		case CASHIER:
		case NOACCESS:
			response.sendRedirect("errorpage.jsp");
			break;
		}
	}
%>