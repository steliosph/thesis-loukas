package sql;

import bean.CustomerAccount;

public interface CustomersAccountsRepository extends BeanRepository<CustomerAccount> {
	
	public CustomerAccount create(Integer CustomerId, Integer AccountId);

}
