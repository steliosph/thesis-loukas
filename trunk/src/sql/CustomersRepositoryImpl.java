package sql;

import java.sql.ResultSet;

import bean.Customer;

public class CustomersRepositoryImpl implements CustomersRepository {

	private DatabaseClass database_ = new DatabaseClass();
	private String sqlQuery_;

	@Override
	public Customer create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getResultSet(String table) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Customer bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(Customer bean) {
		// TODO Auto-generated method stub

	}

	@Override
	public Customer create(Integer CustomerId, String Firstname,
			String Lastname, Integer AddressId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Customer create(Integer customerId) {
		Customer customer = new Customer(customerId);
		return customer;
	}

	@Override
	public Customer retrieveCustomer(Integer customerId) {
		if (customerId == null || customerId <= 0)
			return null;
		Customer customer = create(customerId);
		sqlQuery_ = "SELECT * FROM customers WHERE customer_id= " + customerId
				+ " LIMIT 1";
		try {
			ResultSet rs = database_.getResultSet(sqlQuery_);

			if (rs.next()) {
				customer.setCustomerId(rs.getInt("customer_id"));
				customer.setFirstname(rs.getString("firstname"));
				customer.setLastname(rs.getString("lastname"));
				customer.setAddressId(rs.getInt("address_id"));
			}
		} catch (Exception e) {
			e.getMessage();
		}
		if (customer.isEmptyEmployee())
			return null;

		return customer;
	}

	@Override
	public Integer addUser(String Firstname, String Lastname, Integer AddressId) {
		try {
			 sqlQuery_ = "Insert into customers (Firstname,Lastname,address_id) values ('" + Firstname + "','" + Lastname + "','" + AddressId +"' )";
			System.out.println(sqlQuery_);
			Integer customerId = (Integer) database_. getLastId(sqlQuery_);
			return customerId;
		} catch (Exception e) {
			e.getMessage();
		}
		return null;
	}
	
	
//	public Integer getCustomerId(String Firstname, String Lastname) {
//		try {
//		sqlQuery_ = "SELECT customer_id FROM customers WHERE firstname='" + Firstname + "' and Lastname=  '" + Lastname + "'";
//		System.out.println(sqlQuery_);
//			ResultSet rs = database_.getResultSet(sqlQuery_);
//			if (rs.isLast() )
//				return rs.getInt("customer_id");
//		} catch (Exception e) {
//			e.getMessage();
//		}
//		return null;
//	}
	

}
