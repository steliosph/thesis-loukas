package bean;

public class CustomerAccount {
	private Integer customerId_;
	private Integer accountId_;

	public CustomerAccount(Integer customerId, Integer accountId) {
		customerId_ = customerId;
		accountId_ = accountId;
	}

	public CustomerAccount(CustomerAccount customer_accounts) {
		this(customer_accounts.getCustomerId(), customer_accounts
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
