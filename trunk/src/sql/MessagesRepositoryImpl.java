package sql;

import java.sql.ResultSet;

public class MessagesRepositoryImpl {

	private DatabaseClass database_ = new DatabaseClass();
	private String sqlQuery_;

	public void insertMessage(String Email, String Message, String Fullname) {
		try {
			sqlQuery_ = "INSERT INTO messages (email,message,fullname) VALUES ('"
					+ Email + "' , '" + Message + "' , '" + Fullname + "' )";
			System.out.println(sqlQuery_);
			database_.update(sqlQuery_);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ResultSet getResult() {
		sqlQuery_ = "select id,email,message,fullname,DATE_FORMAT(time, '%H:%i:%s %d/%m/%Y') AS time from messages";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}

	public ResultSet editMessage(Integer MessageId) {
		sqlQuery_ = "select * from messages where id ='" + MessageId + "'";
		System.out.println(sqlQuery_);
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}

	public void updateMessage(String Fullname, String Email, String Message,
			Integer MessageId) {
		try {
			sqlQuery_ = "update messages set Fullname = '" + Fullname
					+ "' , Email = '" + Email + "', Message = '" + Message
					+ "' where Id ='" + MessageId + "'";
			System.out.println(sqlQuery_);
			database_.update(sqlQuery_);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public void deleteMessage(Integer MessageId) {
		try {
			sqlQuery_ = "DELETE FROM messages where Id ='" + MessageId + "'";
			System.out.println(sqlQuery_);
			database_.update(sqlQuery_);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	public ResultSet selectAccount(Integer CustomerId) {
		sqlQuery_ = "select accounts.account_id,accounts.balance,DATE_FORMAT(accounts.date_created, '%H:%i:%s %d/%m/%Y') AS date_created,customers.customer_id,customers.firstname,customers.lastname,address.address_id,address.address,address.city,address.postal_code,address.telephone,account_transactions.account_transaction_id,account_transactions.description,DATE_FORMAT(account_transactions.account_transacion_time, '%H:%i:%s %d/%m/%Y') AS account_transacion_time,account_transactions.action,account_transactions.initial_account_amount,account_transactions.total_account_amount,account_transactions.remaining_account_amount from accounts inner join customer_accounts on accounts.account_id = customer_accounts.account_id inner join customers on customer_accounts.customer_id = customers.customer_id inner join address on customers.address_id = address.address_id LEFT OUTER JOIN account_transactions on customers.customer_id = account_transactions.customer_id where customer_accounts.customer_id='"
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

	public ResultSet editAccountWithWebLogin(Integer CustomerId) {
		sqlQuery_ = "SELECT * FROM customers inner join address on customers.address_id = address.address_id inner join web_login on customers.customer_id = web_login.customer_id where customers.customer_id = '"
				+ CustomerId + "'";
		// System.out.println(sqlQuery_);
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}

}
