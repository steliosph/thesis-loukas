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
<jsp:useBean id="loanstatus" scope="page" class="sql.LoanStatusRepositoryImpl" />
<%!String Fullname, LoanAmount1 = "", Type = "", Status = "";
	int CustomerId, LoanId = 0;
	float LoanAmount;%>

<%
					
			Fullname = request.getParameter("Fullname");
			Fullname = Fullname.substring(0, Math.min(2, Fullname.length()));
			Fullname = Fullname.trim();
			CustomerId = Integer.parseInt(Fullname);
			
			LoanAmount1 = request.getParameter("Amount");
			LoanAmount = Float.parseFloat(LoanAmount1);
			Type = request.getParameter("Type");
			Status = request.getParameter("Status");
			
			
			loan.addLoan(CustomerId, LoanAmount);
			
			ResultSet rs = loan.selectLoanId();
			if (rs.next()) {
			LoanId = rs.getInt("loanId");
			}
		
						
			loanstatus.addLoan(LoanId, Status, Type);
			
			out.println("correct");
			break;
		case NOACCESS:
		case CASHIER:
		case CUSTOMER:
			response.sendRedirect("../errorpage.jsp");
			break;
		}
	}
%>