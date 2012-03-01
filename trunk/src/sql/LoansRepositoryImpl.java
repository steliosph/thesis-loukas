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
		sqlQuery_ = "select * from loans inner join loan_status on loans.loan_id = loan_status.loan_id where loans.loan_id = '"
				+ loanId + "' ORDER BY loans.loan_id";
		System.out.println(sqlQuery_);
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}

	public ResultSet SumOfLoans() {
		sqlQuery_ = "select sum(loan_amount) as SumOfLoans from loans ";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}

	public void updateLoan(Integer LoanId, Integer CustomerId, Float LoanAmount) {
		try {
			sqlQuery_ = "update loans set customer_id= '" + CustomerId
					+ "', loan_amount = '" + LoanAmount + "' where loan_id='"
					+ LoanId + "'";
			System.out.println(sqlQuery_);
			database_.update(sqlQuery_);
		} catch (Exception e) {			
			e.printStackTrace();
		}
	}
}
