package sql;

import bean.Address;

public interface AddressRepository extends BeanRepository<Address> {

	public Address create(Integer AddressId, String Country, String City,
			String PostalCode, String Telephone);

}
