package sql;

import java.sql.Timestamp;

import bean.LoanTransactions;

public interface LoanTransactionsRepository extends
		BeanRepository<LoanTransactions> {

	public LoanTransactions create(Integer LoanTransactionId,
			Integer CustomerId, Integer LoanId, Timestamp LoanTransactionTime,
			Float Amount);

}
