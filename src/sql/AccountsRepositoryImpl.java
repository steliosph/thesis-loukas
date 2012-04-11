package sql;

import java.sql.ResultSet;
import java.sql.Timestamp;

import bean.Account;

public class AccountsRepositoryImpl implements AccountsRepository {

	private DatabaseClass database_ = new DatabaseClass();
	private String sqlQuery_;
	
	@Override
	public Account create() {
		Account bean = new Account();
		return bean;
	}

	@Override
	public Account create(Integer accountId, float balance,
			Timestamp dateCreated) {
		Account bean = new Account(accountId, balance, dateCreated);
		return bean;

	}

	@Override
	public String getResultSet(String table) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Account bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(Account bean) {
		// TODO Auto-generated method stub
		
	}

	public ResultSet getResult() {
		sqlQuery_ = "select * from accounts inner join customer_accounts on accounts.account_id = customer_accounts.account_id inner join customers on customer_accounts.customer_id = customers.customer_id ORDER BY accounts.account_id";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}
	
	public ResultSet editAccount(Integer AccountId) {
		sqlQuery_ = "select * from accounts inner join customer_accounts on accounts.account_id = customer_accounts.account_id inner join customers on customer_accounts.customer_id = customers.customer_id  where accounts.account_id ='"
				+ AccountId + "' ORDER BY accounts.account_id";
		//System.out.println(sqlQuery_);
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}
	
	public void updateAccount(Float Balance, Integer AccountId) {
		try {
			sqlQuery_ = "update accounts set balance = '" + Balance + "' where account_id='"
					+ AccountId + "'";
			System.out.println(sqlQuery_);
			database_.update(sqlQuery_);
		} catch (Exception e) {			
			e.printStackTrace();
		}
	}
	
	public ResultSet selectAccount(Integer CustomerId) {
		sqlQuery_ = "select * from accounts inner join customer_accounts on accounts.account_id = customer_accounts.account_id inner join customers on customer_accounts.customer_id = customers.customer_id where customer_accounts.customer_id='"
				+ CustomerId + "'";
		System.out.println(sqlQuery_);
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}


}
