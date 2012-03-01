package sql;

import java.sql.ResultSet;

import bean.CreditCards;

public class CreditCardsRepositoryImpl implements CreditCardsRepository {

	private DatabaseClass database_ = new DatabaseClass();
	private String sqlQuery_;
	
	@Override
	public CreditCards create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getResultSet(String table) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(CreditCards bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(CreditCards bean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CreditCards create(String CardNumber, Integer CustomerId,
			Float Balance, Float Orio, String Csv) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ResultSet getResultWithName() {
		sqlQuery_ = "select * from credit_cards inner join customers on credit_cards.customer_id = customers.customer_id ORDER BY credit_cards.card_number";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}
	
	public ResultSet editCreditCard(String cardNumber) {
		sqlQuery_ = "select * from credit_cards inner join customers on credit_cards.customer_id = customers.customer_id where credit_cards.card_number ='"
				+ cardNumber + "' ORDER BY credit_cards.card_number";
		System.out.println(sqlQuery_);
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}
	
	public void updateCreditCard(Float balance, String cardNumber) {
		try {
			sqlQuery_ = "update credit_cards set balance = '" + balance + "' where card_number='"
					+ cardNumber + "'";
			System.out.println(sqlQuery_);
			database_.update(sqlQuery_);
		} catch (Exception e) {			
			e.printStackTrace();
		}
	}

}
