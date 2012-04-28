<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<jsp:useBean id="account" scope="page" class="sql.AccountsRepositoryImpl" />
<jsp:useBean id="creditCard" scope="page" class="sql.CreditCardsTransactionRepositoryImpl" />
<jsp:useBean id="loans" scope="page" class="sql.LoansRepositoryImpl" />
<%
	// TODO Limit availiability
	String Action, data = "" ;
	int CustomerId, AccountId = 0, LoanId = 0;
	float AccLimit, AccBalance, CcLimit, CcBalance, LoanLimit, LoanBalance;
%>
      <%
      CustomerId = (Integer) session.getAttribute("customerId");
      Action = request.getParameter("AccountType");
      ResultSet rs;
      if (Action.equals("TypeAcc")) {
      rs = account.selectAccount(CustomerId);
		while (rs.next()) {
                    data = "," + rs.getInt("account_id") + "," + rs.getTimestamp("account_transacion_time") + ","  + "Ταμιευτήριο" + ","  + rs.getString("Firstname") + " "  + rs.getString("Lastname") + ","  + rs.getString("address") + " "  + rs.getString("city") + "," + rs.getFloat("balance");
                }
                out.println(data);
      }
      else if (Action.equals("TypeCc")) { 
    	rs = creditCard.selectAccount(CustomerId);
			while (rs.next()) {
                data = "," + rs.getString("card_number") + "," + rs.getTimestamp("credit_car_transaction_time") + ","  + "Πιστωτική κάρτα" + ","  + rs.getString("Firstname") + " "  + rs.getString("Lastname") + ","  + rs.getString("address") + " "  + rs.getString("city") + "," + rs.getFloat("balance") ;
            }
			out.println(data);
      }
      else if (Action.equals("TypeLoan")) { 
    	  rs = loans.selectAccount(CustomerId);
			while (rs.next()) {
                data = "," + rs.getInt("loan_id") + "," + rs.getTimestamp("loan_transaction_time") + ","  + rs.getString("type") + ","  + rs.getString("Firstname") + " "  + rs.getString("Lastname") + ","  + rs.getString("address") + " "  + rs.getString("city") + "," + rs.getFloat("remaining_payee_amount") ;				
			}
			out.println(data);
			}                           
 %>
