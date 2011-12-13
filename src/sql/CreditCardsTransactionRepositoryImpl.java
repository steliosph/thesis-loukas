package sql;

import java.sql.Timestamp;

import bean.CreditCardsTransaction;

public class CreditCardsTransactionRepositoryImpl implements CreditCardsTransactionRepository {

	@Override
	public CreditCardsTransaction create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getQueryVariables(String table) {
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

}
