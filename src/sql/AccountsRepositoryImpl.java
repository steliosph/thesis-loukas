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
		sqlQuery_ = "select accounts.account_id,accounts.balance,DATE_FORMAT(accounts.date_created, '%H:%i:%s %d/%m/%Y') AS date_created,customers.customer_id,customers.firstname,customers.lastname,address.address_id,address.address,address.city,address.postal_code,address.telephone,account_transactions.account_transaction_id,account_transactions.description,DATE_FORMAT(account_transactions.account_transacion_time, '%H:%i:%s %d/%m/%Y') AS account_transacion_time,account_transactions.action,account_transactions.initial_account_amount,account_transactions.total_account_amount,account_transactions.remaining_account_amount from accounts inner join customer_accounts on accounts.account_id = customer_accounts.account_id inner join customers on customer_accounts.customer_id = customers.customer_id inner join address on customers.address_id = address.address_id inner join account_transactions on customers.customer_id = account_transactions.customer_id where customer_accounts.customer_id='"
				+ CustomerId + "'limit 1";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}
	
	public ResultSet selectAccountTransactions(Integer CustomerId) {
		sqlQuery_ = "SELECT * FROM account_transactions where customer_id='"
				+ CustomerId + "'limit 1";
		System.out.println(sqlQuery_);
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}


	
}
