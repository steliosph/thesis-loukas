package sql;

import java.sql.ResultSet;

import bean.Loans;

public class LoansRepositoryImpl implements LoansRepository {

	private DatabaseClass database = new DatabaseClass();
	private String sqlQuery;
	
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
		sqlQuery = "select * from loans inner join loan_status on loans.loan_id = loan_status.loan_id ORDER BY loans.loan_id";
		ResultSet rs = database.getResultSet(sqlQuery);
		return rs;
	}
	
	public ResultSet SumOfLoans() {
		sqlQuery = "select sum(loan_amount) as SumOfLoans from loans ";
		ResultSet rs = database.getResultSet(sqlQuery);
		return rs;
	}

}
