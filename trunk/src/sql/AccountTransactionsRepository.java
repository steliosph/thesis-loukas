package sql;

import bean.AccountTransactions;

import java.sql.Timestamp;

public interface AccountTransactionsRepository extends BeanRepository<AccountTransactions> {
	
	public AccountTransactions create(Integer AccountTransactionId, Integer CustomerId,
			Integer AccountId, Timestamp AccountTransactionTime,
			Boolean Deposit, Float Amount);

}
