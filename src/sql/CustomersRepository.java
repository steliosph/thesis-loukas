package sql;

import bean.Customer;

public interface CustomersRepository extends BeanRepository<Customer>{
	
	public Customer create(Integer CustomerId, String Firstname, String Lastname,
			Integer AddressId);

}
