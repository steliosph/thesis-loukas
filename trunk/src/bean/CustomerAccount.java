package bean;

public class CustomerAccount {
	private Integer customerId_;
	private Integer accountId_;

	public CustomerAccount(Integer customerId, Integer accountId) {
		customerId_ = customerId;
		accountId_ = accountId;
	}

	public CustomerAccount(CustomerAccount customeraccounts) {
		this(customeraccounts.getCustomerId(), customeraccounts
				.getAccountId());
	}

	public Integer getCustomerId() {
		return customerId_;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId_ = customerId;
	}

	public Integer getAccountId() {
		return accountId_;
	}

	public void setAccountId(Integer accountId) {
		this.accountId_ = accountId;
	}

}
