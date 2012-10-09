package sql;

import java.sql.ResultSet;

import bean.Loans;

public class LoansRepositoryImpl implements LoansRepository {

	private DatabaseClass database_ = new DatabaseClass();
	private String sqlQuery_;

	@Override
	public Loans create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getResultSet(String table) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Loans bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(Loans bean) {
		// TODO Auto-generated method stub

	}

	@Override
	public Loans create(Integer LoanId, Integer CustomerId, Float LoanAmount) {
		// TODO Auto-generated method stub
		return null;
	}

	public ResultSet getResult() {
		sqlQuery_ = "select * from loans inner join loan_status on loans.loan_id = loan_status.loan_id ORDER BY loans.loan_id";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}
	
	public ResultSet getResultWithName() {
		sqlQuery_ = "select * from loans inner join loan_status on loans.loan_id = loan_status.loan_id inner join customers on loans.customer_id = customers.customer_id ORDER BY loans.loan_id";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}

	public ResultSet editLoan(Integer loanId) {
		sqlQuery_ = "select * from loans inner join loan_status on loans.loan_id = loan_status.loan_id inner join customers on loans.customer_id = customers.customer_id where loans.loan_id =  '"
				+ loanId + "'";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}

	public ResultSet SumOfLoans() {
		sqlQuery_ = "select sum(loan_amount) as SumOfLoans from loans ";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}

	public void updateLoan1(Integer LoanId, Integer CustomerId, Float RemainingPayeeAmount) {
		try {
			sqlQuery_ = "update loans set customer_id= '" + CustomerId
					+ "', loan_amount = '" + RemainingPayeeAmount + "' where loan_id='"
					+ LoanId + "'"; 			
			database_.update(sqlQuery_);
			System.out.println(sqlQuery_);
		} catch (Exception e) {			
			e.printStackTrace();
		}
	}
	
	public void updateLoan2(Integer LoanId, Integer CustomerId, Float RemainingPayeeAmount) {
		try {
			sqlQuery_ = "update loans set customer_id= '" + CustomerId
					+ "', remaining_payee_amount = '" + RemainingPayeeAmount + "' where loan_id='"
					+ LoanId + "'"; 			
			database_.update(sqlQuery_);
			System.out.println(sqlQuery_);
		} catch (Exception e) {			
			e.printStackTrace();
		}
	}
	
	public ResultSet selectAccount(Integer CustomerId) {
		sqlQuery_ = "SELECT loans.loan_amount,loan_status.type,loans.loan_id,loans.remaining_payee_amount,DATE_FORMAT(loan_transactions.loan_transaction_time, '%H:%i:%s %d/%m/%Y') AS loan_transaction_time,customers.firstname,customers.lastname,address.address,address.city FROM loans inner join customers on loans.customer_id = customers.customer_id inner join loan_status on loans.loan_id = loan_status.loan_id inner join address on customers.address_id = address.address_id LEFT OUTER JOIN loan_transactions on customers.customer_id = loan_transactions.customer_id where loans.customer_id='"
				+ CustomerId + "'limit 1";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}
	
	public void updateLoanTransfer(Integer LoanId, Float RemainingPayeeAmount) {
		try {
			sqlQuery_ = "update loans set remaining_payee_amount = '" + RemainingPayeeAmount + "' where loan_id='"
					+ LoanId + "'"; 			
			database_.update(sqlQuery_);
			System.out.println(sqlQuery_);
		} catch (Exception e) {			
			e.printStackTrace();
		}
	}
}
