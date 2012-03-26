package sql;

import java.sql.Timestamp;

import bean.AccountTransactions;

public class AccountTransactionsImpl implements AccountTransactionsRepository {
	
	private DatabaseClass database_ = new DatabaseClass();
	private String sqlQuery_;

	@Override
	public AccountTransactions create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getResultSet(String table) {
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
	
	public void accountTransaction(Integer AccountId, Integer CustomerId, String Action,
			Float InitialAccountAmount, Float TotalAccountAmount,
			Float RemainingAccountAmount, String Desc) {
		try {
			sqlQuery_ = "insert into account_transactions (account_id,customer_id,action,initial_account_amount,total_account_amount,remaining_account_amount,description) values ('"
					+ AccountId
					+ "','"
					+ CustomerId
					+ "','"
					+ Action
					+ "','"
					+ InitialAccountAmount
					+ "','"
					+ TotalAccountAmount
					+ "','"
					+ RemainingAccountAmount
					+ "','"
					+ Desc
					+ "')";
			System.out.println(sqlQuery_);
			database_.update(sqlQuery_);

		} catch (Exception e) {
			e.getMessage();
		}
	}

}
