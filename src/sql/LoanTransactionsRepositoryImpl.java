package sql;

import java.sql.ResultSet;
import java.sql.Timestamp;

import bean.LoanTransactions;

public class LoanTransactionsRepositoryImpl implements
		LoanTransactionsRepository {

	private DatabaseClass database_ = new DatabaseClass();
	private String sqlQuery_;

	@Override
	public LoanTransactions create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getResultSet(String table) {
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
			Integer LoanId, Timestamp LoanTransactionTime, Float InitialLoanAmount, Float TotalPayedAmount, Float RemainingPayeeAmount) {
		// TODO Auto-generated method stub
		return null;
	}

	public void loanTransaction(Integer LoanId, Integer CustomerId, Float LoanAmount, Float LoanBalance,
			Float TotalPayedAmount, Float RemainingPayeeAmount, String Desc) {
		try {
			sqlQuery_ = "insert into loan_transactions (loan_id,customer_id,loan_amount,loan_balance,total_payed_amount,remaining_payee_amount,description) values ('"
					+ LoanId
					+ "','"
					+ CustomerId
					+ "','"
					+ LoanAmount
					+ "','"
					+ LoanBalance
					+ "','"
					+ TotalPayedAmount
					+ "','"
					+ RemainingPayeeAmount
					+ "','"
					+ Desc +"')";			 
			database_.update(sqlQuery_);
			System.out.println(sqlQuery_);
		} catch (Exception e) {
			e.getMessage();
		}
	}

	public ResultSet getLoanTransaction() {
		sqlQuery_ = "SELECT * FROM loan_transactions inner join customers on loan_transactions.customer_id = customers.customer_id inner join loans on loan_transactions.loan_id = loans.loan_id ORDER BY loan_transactions.loan_transaction_id;";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}
	
	public ResultSet searchLoanTransactionId(String Search) {
		sqlQuery_ = "SELECT * FROM loan_transactions inner join customers on loan_transactions.customer_id = customers.customer_id inner join loans on loan_transactions.loan_id = loans.loan_id where loan_transactions.loan_transaction_id='"+ Search + "'"; 
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}
	
	public ResultSet searchLoanTransactionFirstname(String Search) {
		sqlQuery_ = "SELECT * FROM loan_transactions inner join customers on loan_transactions.customer_id = customers.customer_id inner join loans on loan_transactions.loan_id = loans.loan_id where customers.firstname='"+ Search + "'";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}
	
	public ResultSet searchLoanTransactionLastname(String Search) {
		sqlQuery_ = "SELECT * FROM loan_transactions inner join customers on loan_transactions.customer_id = customers.customer_id inner join loans on loan_transactions.loan_id = loans.loan_id where customers.lastname='"+ Search + "'";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}
	
	public ResultSet searchLoanTransactionDesc(String Search) {
		sqlQuery_ = "SELECT * FROM loan_transactions inner join customers on loan_transactions.customer_id = customers.customer_id inner join loans on loan_transactions.loan_id = loans.loan_id where loan_transactions.description='"+ Search + "'";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}
	
	public ResultSet searchLoanTransactionLoanAmount(String Search) {
		sqlQuery_ = "SELECT * FROM loan_transactions inner join customers on loan_transactions.customer_id = customers.customer_id inner join loans on loan_transactions.loan_id = loans.loan_id where loan_transactions.loan_amount='"+ Search + "'";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}
	
	public ResultSet searchLoanTransactionLoanBalance(String Search) {
		sqlQuery_ = "SELECT * FROM loan_transactions inner join customers on loan_transactions.customer_id = customers.customer_id inner join loans on loan_transactions.loan_id = loans.loan_id where loan_transactions.loan_balance='"+ Search + "'";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}
	
	public ResultSet searchLoanTransactionTotalPayedAmount(String Search) {
		sqlQuery_ = "SELECT * FROM loan_transactions inner join customers on loan_transactions.customer_id = customers.customer_id inner join loans on loan_transactions.loan_id = loans.loan_id where loan_transactions.total_payed_amount='"+ Search + "'";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}
	
	public ResultSet searchLoanTransactionRemainingPayeeAmount(String Search) {
		sqlQuery_ = "SELECT * FROM loan_transactions inner join customers on loan_transactions.customer_id = customers.customer_id inner join loans on loan_transactions.loan_id = loans.loan_id where loan_transactions.remaining_payee_amount='"+ Search + "'"; 
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}
	
	public ResultSet selectTransactionsCustomer(Integer CustomerId, String TransactionTime) {
		sqlQuery_ = "SELECT loan_transaction_id,DATE_FORMAT(loan_transaction_time, '%H:%i:%s , %d/%m/%Y') AS loan_transaction_time,loan_id,customer_id,description,loan_amount,loan_balance,total_payed_amount,remaining_payee_amount FROM loan_transactions where customer_id='"+ CustomerId + "' and loan_transaction_time " + TransactionTime ;		
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}
	
	public ResultSet selectTransactionsDate(Integer CustomerId ,String StartDate, String EndDate) {
		sqlQuery_ = "SELECT loan_transaction_id,DATE_FORMAT(loan_transaction_time, '%H:%i:%s , %d/%m/%Y') AS loan_transaction_time,loan_id,customer_id,description,loan_amount,loan_balance,total_payed_amount,remaining_payee_amount FROM loan_transactions where customer_id='"+ CustomerId + "' and loan_transaction_time BETWEEN STR_TO_DATE('" + StartDate + "', '%d/%m/%Y') AND STR_TO_DATE('" + EndDate + "', '%d/%m/%Y');";
		System.out.println(sqlQuery_);
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}
}
