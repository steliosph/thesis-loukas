package sql;

import java.sql.Timestamp;

import bean.LoanTransactions;

public class LoanTransactionsRepositoryImpl implements
		LoanTransactionsRepository {

	@Override
	public LoanTransactions create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getQueryVariables(String table) {
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

}
