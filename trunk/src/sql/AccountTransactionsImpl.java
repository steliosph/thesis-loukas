package sql;

import java.sql.Timestamp;

import bean.AccountTransactions;

public class AccountTransactionsImpl implements AccountTransactionsRepository {

	@Override
	public AccountTransactions create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getQueryVariables(String table) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(AccountTransactions bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(AccountTransactions bean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public AccountTransactions create(Integer AccountTransactionId,
			Integer CustomerId, Integer AccountId,
			Timestamp AccountTransactionTime, Boolean Deposit, Float Amount) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
