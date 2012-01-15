package bean;

public class Customer {
	private Integer customerId_;
	private String firstname_;
	private String lastname_;
	private Integer addressId_;

	public Customer(Integer CustomerId, String Firstname, String Lastname,
			Integer AddressId) {
		customerId_ = CustomerId;
		firstname_ = Firstname;
		lastname_ = Lastname;
		addressId_ = AddressId;
	}

	public Customer(Customer customers) {
		this(customers.getCustomerId(), customers.getFirstname(), customers
				.getLastname(), customers.getAddressId());
	}

	public Customer(Integer customerId) {
		// TODO Auto-generated constructor stub
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

	public boolean isEmptyEmployee() {
		 if (getCustomerId() == null || getFirstname() == null)
             return true;
     return false;         
	}

}
