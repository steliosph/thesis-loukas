package sql;

import bean.CreditCards;

public interface CreditCardsRepository extends BeanRepository<CreditCards> {

	public CreditCards create(String CardNumber, Integer CustomerId,
			Float Balance, Float Orio, String Csv);

}
