package sql;

import java.sql.Timestamp;

import bean.CreditCardsTransaction;

public interface CreditCardsTransactionRepository extends
		BeanRepository<CreditCardsTransaction> {

	public CreditCardsTransaction create(Integer CreditCardTransactionId,
			Integer CustomerId, String CardNumber,
			Timestamp CreditCardTransactionTime, Boolean Deposit, Float Amount);

}
