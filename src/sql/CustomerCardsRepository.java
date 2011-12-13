package sql;

import bean.CustomerCards;

public interface CustomerCardsRepository extends BeanRepository<CustomerCards> {
	
	public CustomerCards create(String CardNumber, String Csv, Integer CustomerId);

}
