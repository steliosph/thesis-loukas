package bean;

public class CustomerAccount {
	private Integer CustomerId_;
	private Integer AccountId_;

	public CustomerAccount(Integer CustomerId, Integer AccountId) {
		CustomerId_ = CustomerId;
		AccountId_ = AccountId;
	}

	public CustomerAccount(CustomerAccount customeraccounts) {
		this(customeraccounts.getCustomerId(), customeraccounts
				.getAccountId());
	}

	public Integer getCustomerId() {
		return CustomerId_;
	}

	public void setCustomerId(Integer customerId) {
		this.CustomerId_ = customerId;
	}

	public Integer getAccountId() {
		return AccountId_;
	}

	public void setAccountId(Integer accountId) {
		this.AccountId_ = accountId;
	}

}
