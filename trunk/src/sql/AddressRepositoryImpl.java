package sql;

import bean.Address;

public class AddressRepositoryImpl implements AddressRepository {

	@Override
	public Address create() {
	//	Address bean = new Address();
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
	public String getQueryVariables(String table) {
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
	public void insert(Address address){
		
	}

}
