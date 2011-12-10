package bean;

public class Address {
	private int AddressId_;
	private String Country_;
	private String City_;
	private String PostalCode_;
	private String Telephone_;
	
	public Address(Integer AddressId, String Country, String City, String PostalCode, String Telephone) {
		AddressId_ = AddressId;
		Country_ = Country;
		City_ = City;
		PostalCode_ = PostalCode;
		Telephone_ = Telephone;
	}

	public Address(Address address) {
		this(address.getAddressId(),address.getCountry(), address.getCity(),address.getPostalCode(),address.getTelephone()); 
	}
	
	public int getAddressId() {
		return AddressId_;
	}

	public void setAddressId(int addressId) {
		AddressId_ = addressId;
	}

	public String getCountry() {
		return Country_;
	}

	public void setCountry(String country) {
		Country_ = country;
	}

	public String getCity() {
		return City_;
	}

	public void setCity(String city) {
		City_ = city;
	}

	public String getPostalCode() {
		return PostalCode_;
	}

	public void setPostalCode(String postalCode) {
		PostalCode_ = postalCode;
	}

	public String getTelephone() {
		return Telephone_;
	}

	public void setTelephone(String telephone) {
		Telephone_ = telephone;
	}
	
	@Override
	public String toString() {
		return "Country:" + getCountry() + "City:" + getCity() + "Postal Code:" + getPostalCode() + "Telephone:" + getTelephone();
	}	
	

}
