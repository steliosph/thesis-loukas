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
	
	public ResultSet customerSearch(Integer customerId) {
		sqlQuery_ = "select firstname,lastname from customers where customer_id = '"
				+ customerId + "'";
		System.out.println(sqlQuery_);
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}
	
	public ResultSet getResult() {
		sqlQuery_ = "select * from customers inner join address on customers.address_id = address.address_id ORDER BY customers.customer_id";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}
	
	public ResultSet editCustomer(Integer customerId) {
		sqlQuery_ = "select * from customers inner join address on customers.address_id = address.address_id  where customer_Id = '"
				+ customerId + "'";
		System.out.println(sqlQuery_);
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}
	
	public void updateCustomer(Integer customerId, String firstname, String lastname) {
		try {
			sqlQuery_ = "update customers set firstname= '" + firstname
					+ "', lastname = '" + lastname + "' where customer_id = '"
					+ customerId + "'";
			System.out.println(sqlQuery_);
			database_.update(sqlQuery_);
		} catch (Exception e) {			
			e.printStackTrace();
		}
	}
	

}
