package bean;

public class Customer {
	private Integer CustomerId_;
	private String Firstname_;
	private String Lastname_;
	private Integer AddressId_;

	public Customer(Integer CustomerId, String Firstname, String Lastname,
			Integer AddressId) {
		CustomerId_ = CustomerId;
		Firstname_ = Firstname;
		Lastname_ = Lastname;
		AddressId_ = AddressId;
	}

	public Customer(Customer customers) {
		this(customers.getCustomerId(), customers.getFirstname(), customers
				.getLastname(), customers.getAddressId());
	}

	public Integer getCustomerId() {
		return CustomerId_;
	}

	public void setCustomerId(Integer customerId) {
		this.CustomerId_ = customerId;
	}

	public String getFirstname() {
		return Firstname_;
	}

	public void setFirstname(String firstname) {
		this.Firstname_ = firstname;
	}

	public String getLastname() {
		return Lastname_;
	}

	public void setLastname(String lastname) {
		this.Lastname_ = lastname;
	}

	public Integer getAddressId() {
		return AddressId_;
	}

	public void setAddressId(Integer addressId) {
		this.AddressId_ = addressId;
	}

	@Override
	public String toString() {
		return "Firstname:" + getFirstname() + "Lastname:" + getLastname();
	}

}
