package sql;

import java.sql.Timestamp;

import bean.LoanTransactions;

public interface LoanTransactionsRepository extends
		BeanRepository<LoanTransactions> {

	LoanTransactions create(Integer LoanTransactionId, Integer LoanId,
			Timestamp LoanTransactionTime, Float InitialLoanAmount,
			Float TotalPayedAmount, Float RemainingPayeeAmount);

}
