package bean;

public class customer_account {
	private Integer customerId_;
	private Integer accountId_;

	public customer_account(Integer customerId, Integer accountId) {
		customerId_ = customerId;
		accountId_ = accountId;
	}

	public customer_account(customer_account customer_accounts) {
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
