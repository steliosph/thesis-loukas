<%@ page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");%>

<jsp:useBean id="loan" scope="page" class="sql.LoansRepositoryImpl" />
<jsp:useBean id="loanstatus" scope="page" class="sql.LoanStatusRepositoryImpl" />
<%!String LoanAmount1 = "", CustomerId1 = "", LoanId1 = "", Type = "",
			Status = "";
	int LoanId = 0, CustomerId = 0;
	float LoanAmount;%>

<%
	LoanId1 = request.getParameter("loanId");
	LoanId = Integer.parseInt(LoanId1);
	CustomerId1 = request.getParameter("customerId");
	CustomerId = Integer.parseInt(CustomerId1);
	LoanAmount1 = request.getParameter("amount");
	LoanAmount = Float.parseFloat(LoanAmount1);	
	Type = request.getParameter("type");
	Status = request.getParameter("status");
 
	System.out.println(Type);
	System.out.println(Status);
	
	loan.updateLoan(LoanId, CustomerId, LoanAmount);
	loanstatus.updateLoan(LoanId, Status, Type);
	session.setAttribute("updateloans","Το δάνειο με κωδικό:(" + LoanId + ") ανανεώθηκε!");
 
%>

<jsp:forward page="sumloans.jsp">
	<jsp:param name="update" value="<%=LoanId%>" />
</jsp:forward>
