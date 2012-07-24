package sql;

import java.sql.ResultSet;
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
	
	public ResultSet getAccountTransaction() {
		sqlQuery_ = "SELECT * FROM account_transactions inner join customers on account_transactions.customer_id = customers.customer_id ORDER BY account_transactions.account_transaction_id;";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}	
	
	public ResultSet searchAccountTransactionId(String Search) {
		sqlQuery_ = "SELECT * FROM account_transactions inner join customers on account_transactions.customer_id = customers.customer_id where  account_transactions.account_transaction_id= '"+ Search + "'"; 
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}
	
	public ResultSet searchAccountTransactionFirstname(String Search) {
		sqlQuery_ = "SELECT * FROM account_transactions inner join customers on account_transactions.customer_id = customers.customer_id where customers.firstname= '"+ Search + "'"; 
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}
	
	public ResultSet searchAccountTransactionLastname(String Search) {
		sqlQuery_ = "SELECT * FROM account_transactions inner join customers on account_transactions.customer_id = customers.customer_id where customers.lastname= '"+ Search + "'"; 
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}
	
	public ResultSet searchAccountTransactionDesc(String Search) {
		sqlQuery_ = "SELECT * FROM account_transactions inner join customers on account_transactions.customer_id = customers.customer_id where account_transactions.description= '"+ Search + "'"; 
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}
	
	public ResultSet searchAccountTransactionAction(String Search) {
		sqlQuery_ = "SELECT * FROM account_transactions inner join customers on account_transactions.customer_id = customers.customer_id where account_transactions.action= '"+ Search + "'"; 
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}
	
	public ResultSet searchAccountTransactionInitialAmount(String Search) {
		sqlQuery_ = "SELECT * FROM account_transactions inner join customers on account_transactions.customer_id = customers.customer_id where account_transactions.initial_account_amount= '"+ Search + "'"; 
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}
	
	public ResultSet searchAccountTransactionTotalPayedAmount(String Search) {
		sqlQuery_ = "SELECT * FROM account_transactions inner join customers on account_transactions.customer_id = customers.customer_id where account_transactions.total_account_amount= '"+ Search + "'"; 
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}
	
	public ResultSet searchAccountTransactionRemainingPayeeAmount(String Search) {
		sqlQuery_ = "SELECT * FROM account_transactions inner join customers on account_transactions.customer_id = customers.customer_id where account_transactions.remaining_account_amount= '"+ Search + "'"; 
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}		
	
	public ResultSet selectTransactionsCustomer(Integer CustomerId, String TransactionTime) {
		//sqlQuery_ = "SELECT * FROM account_transactions where customer_id='"+ CustomerId + "' and account_transacion_time " + TransactionTime ;
		sqlQuery_ = "SELECT account_transaction_id,customer_id,account_id,description,DATE_FORMAT(account_transacion_time, '%d/%m/%Y %H:%i:%s') AS account_transacion_time,action,initial_account_amount,total_account_amount,remaining_account_amount FROM account_transactions where customer_id='"+ CustomerId + "' and account_transacion_time " + TransactionTime ;	
		System.out.println(sqlQuery_);
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}
	
	public ResultSet selectTransactionsDate(Integer CustomerId ,String StartDate, String EndDate) {
		sqlQuery_ = "SELECT account_transaction_id,customer_id,account_id,description,DATE_FORMAT(account_transacion_time, '%d/%m/%Y %H:%i:%s') AS account_transacion_time,action,initial_account_amount,total_account_amount,remaining_account_amount FROM account_transactions where customer_id='"+ CustomerId + "' and account_transacion_time BETWEEN STR_TO_DATE('" + StartDate + "', '%d/%m/%Y') AND STR_TO_DATE('" + EndDate + "', '%d/%m/%Y');";	
		System.out.println(sqlQuery_);
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}

}
