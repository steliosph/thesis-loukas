package sql;

import java.sql.Timestamp;

import bean.LoanTransactions;

public class LoanTransactionsRepositoryImpl implements
		LoanTransactionsRepository {

	private DatabaseClass database_ = new DatabaseClass();
	private String sqlQuery_;

	@Override
	public LoanTransactions create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getResultSet(String table) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(LoanTransactions bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(LoanTransactions bean) {
		// TODO Auto-generated method stub

	}

	@Override
	public LoanTransactions create(Integer LoanTransactionId,
			Integer LoanId, Timestamp LoanTransactionTime, Float InitialLoanAmount, Float TotalPayedAmount, Float RemainingPayeeAmount) {
		// TODO Auto-generated method stub
		return null;
	}

	public void loanTransaction(Integer LoanId, Integer CustomerId, Float LoanAmount, Float LoanBalance,
			Float TotalPayedAmount, Float RemainingPayeeAmount) {
		try {
			sqlQuery_ = "insert into loan_transactions (loan_id,customer_id,loan_amount,loan_balance,total_payed_amount,remaining_payee_amount) values ('"
					+ LoanId
					+ "','"
					+ CustomerId
					+ "','"
					+ LoanAmount
					+ "','"
					+ LoanBalance
					+ "','"
					+ TotalPayedAmount
					+ "','"
					+ RemainingPayeeAmount + "')";			 
			database_.update(sqlQuery_);
			
		} catch (Exception e) {
			e.getMessage();
		}
	}

}
