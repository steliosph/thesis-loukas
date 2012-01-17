package sql;

import bean.Customer;

public interface CustomersRepository extends BeanRepository<Customer>{
	
	public Customer create(Integer CustomerId, String Firstname, String Lastname,
			Integer AddressId);
	
	public Customer create(Integer customerId);

	public Customer retrieveCustomer(Integer customerId);
	
	void addUser(String Firstname, String Lastname);
	
	public Integer getCustomerId(String Firstname, String Lastname);
	
}
