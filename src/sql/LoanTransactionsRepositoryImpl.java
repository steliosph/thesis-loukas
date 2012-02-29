package sql;

import java.sql.Timestamp;

import bean.LoanTransactions;

public class LoanTransactionsRepositoryImpl implements
		LoanTransactionsRepository {

	private DatabaseClass database_ = new DatabaseClass();

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
			Integer CustomerId, Integer LoanId, Timestamp LoanTransactionTime,
			Float Amount) {
		// TODO Auto-generated method stub
		return null;
	}

	public void loanTransaction(Integer loanId, Float initialLoanAmount,
			Float totalPayedAmount, Float remainingPayeeAmount) {
		try {
			String sqlQuery;
			sqlQuery = sprintf("INSERT INTO loan_transactions (loan_id,initial_loan_amount,total_payed_amount,remaining_payee_amount) VALUES (%d,%d,%d,%d)",loanId, initialLoanAmount,,totalPayedAmount,remainingPayeeAmount );
			System.out.println(sqlQuery);
			database_.update(sqlQuery_);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
