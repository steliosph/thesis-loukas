package sql;

import bean.Address;

public class AddressRepositoryImpl implements AddressRepository {

	private DatabaseClass database_ = new DatabaseClass();
	private String sqlQuery_;

	@Override
	public Address create() {
		// Address bean = new Address();
		return null;
	}

	@Override
	public Address create(Integer AddressId, String Country, String City,
			String PostalCode, String Telephone) {
		Address bean = new Address(AddressId, Country, City, PostalCode,
				Telephone);
		return bean;
	}

	@Override
	public String getResultSet(String table) {
		if (table == null)
			return "Address_Id,Country,City,Postal_Code,Telephone";
		return table + ".Address_Id," + table + ".Country," + table + ".City,"
				+ table + ".Postal_Code," + table + ".Telephone";
	}

	@Override
	public int update(Address address) {
		return 0;
	}

	@Override
	public void insert(Address address) {

	}

	public Integer addNullAddress() {
		try {
			sqlQuery_ = "insert into address (address,city,postal_code,telephone) values ('"
					+ null
					+ "' ,'"
					+ null
					+ "','"
					+ null
					+ "','"
					+ null
					+ "' )";
			System.out.println(sqlQuery_);
			Integer addressId = (Integer) database_.getLastId(sqlQuery_);
			return addressId;
		} catch (Exception e) {
			e.getMessage();
		}
		return null;
	}

	public void updateAddress(Integer addressId, String address, String city,
			String postalCode, String telephone) {
		try {
			sqlQuery_ = "update address set address= '" + address
					+ "', city = '" + city + "', postal_code = '" + postalCode
					+ "', telephone = '" + telephone + "' where address.address_id='"
					+ addressId + "'";
			System.out.println(sqlQuery_);

			database_.update(sqlQuery_);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
