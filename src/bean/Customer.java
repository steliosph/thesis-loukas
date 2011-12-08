package bean;

public class Customer {
	private Integer customerId_;
	private String firstname_;
	private String lastname_;
	private Integer addressId_;

	public Customer(Integer customerId, String firstname, String lastname,
			Integer addressId) {
		customerId_ = customerId;
		firstname_ = firstname;
		lastname_ = lastname;
		addressId_ = addressId;
	}

	public Customer(Customer customers) {
		this(customers.getCustomerId(), customers.getFirstname(), customers
				.getLastname(), customers.getAddressId());
	}

	public Integer getCustomerId() {
		return customerId_;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId_ = customerId;
	}

	public String getFirstname() {
		return firstname_;
	}

	public void setFirstname(String firstname) {
		this.firstname_ = firstname;
	}

	public String getLastname() {
		return lastname_;
	}

	public void setLastname(String lastname) {
		this.lastname_ = lastname;
	}

	public Integer getAddressId() {
		return addressId_;
	}

	public void setAddressId(Integer addressId) {
		this.addressId_ = addressId;
	}

	@Override
	public String toString() {
		return "Firstname:" + getFirstname() + "Lastname:" + getLastname();
	}

}
