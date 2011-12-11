package bean;

import java.sql.Timestamp;

public class AccountTransactions {
	private Integer AccountTransactionId_;
	private Integer CustomerId_;
	private Integer AccountId_;
	private Timestamp AccountTransactionTime_;
	private Boolean Deposit_;
	private Float Amount_;

	public AccountTransactions(Integer AccountTransactionId, Integer CustomerId,
			Integer AccountId, Timestamp AccountTransactionTime,
			Boolean Deposit, Float Amount) {
		AccountTransactionId_ = AccountTransactionId;
		CustomerId_ = CustomerId;
		AccountId_ = AccountId;
		AccountTransactionTime_ = AccountTransactionTime;
		Deposit_ = Deposit;
		Amount_ = Amount;
	}

	public AccountTransactions(AccountTransactions accounttransactions) {
		this(accounttransactions.getAccountTransactionId(), accounttransactions
				.getCustomerId(), accounttransactions.getAccountId(),
				accounttransactions.getAccountTransactionTime(),
				accounttransactions.getDeposit(),accounttransactions.getAmount());
	}

	public Integer getAccountTransactionId() {
		return AccountTransactionId_;
	}

	public void setAccountTransactionId(Integer accountTransactionId) {
		AccountTransactionId_ = accountTransactionId;
	}

	public Integer getCustomerId() {
		return CustomerId_;
	}

	public void setCustomerId(Integer customerId) {
		CustomerId_ = customerId;
	}

	public Integer getAccountId() {
		return AccountId_;
	}

	public void setAccountId(Integer accountId) {
		AccountId_ = accountId;
	}

	public Timestamp getAccountTransactionTime() {
		return AccountTransactionTime_;
	}

	public void setAccountTransactionTime(Timestamp accountTransactionTime) {
		AccountTransactionTime_ = accountTransactionTime;
	}

	public Boolean getDeposit() {
		return Deposit_;
	}

	public void setDeposit(Boolean deposit) {
		Deposit_ = deposit;
	}

	public Float getAmount() {
		return Amount_;
	}

	public void setAmount(Float amount) {
		Amount_ = amount;
	}

}
