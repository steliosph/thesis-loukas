package sql;

import java.sql.ResultSet;
import java.sql.Timestamp;

import bean.CreditCardsTransaction;

public class CreditCardsTransactionRepositoryImpl implements
		CreditCardsTransactionRepository {

	private DatabaseClass database_ = new DatabaseClass();
	private String sqlQuery_;

	@Override
	public CreditCardsTransaction create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getResultSet(String table) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(CreditCardsTransaction bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(CreditCardsTransaction bean) {
		// TODO Auto-generated method stub

	}

	@Override
	public CreditCardsTransaction create(Integer CreditCardTransactionId,
			Integer CustomerId, String CardNumber,
			Timestamp CreditCardTransactionTime, Boolean Deposit, Float Amount) {
		// TODO Auto-generated method stub
		return null;
	}

	public void creditCardTransaction(String CardNumber, Integer CustomerId, String Deposit,
			Float InitialCreditCardAmount, Float TotalCreditCardAmount,
			Float RemainingCreditCardAmount, Float Orio, String Desc) {
		try {
			sqlQuery_ = "insert into credit_cards_transactions (card_number,customer_id,deposit,initial_credit_card_amount,total_credit_card_amount,remaining_credit_card_amount,orio,description) values ('"
					+ CardNumber
					+ "','"
					+ CustomerId
					+ "','"
					+ Deposit
					+ "','"
					+ InitialCreditCardAmount
					+ "','"
					+ TotalCreditCardAmount
					+ "','"
					+ RemainingCreditCardAmount
					+ "','"
					+ Orio
					+ "','"
					+ Desc
					+ "')";
			System.out.println(sqlQuery_);
			database_.update(sqlQuery_);

		} catch (Exception e) {
			e.getMessage();
		}
	}
	
	public ResultSet getCcTransaction() {
		sqlQuery_ = "SELECT * FROM credit_cards_transactions inner join customers on credit_cards_transactions.customer_id = customers.customer_id ORDER BY credit_cards_transactions.credit_card_transaction_id;";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}

}
