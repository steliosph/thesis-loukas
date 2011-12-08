package bean;

import java.sql.Timestamp;

public class Account {

	private Integer accountId_;
	private Float balance_;
	private Timestamp dateCreated_;

	public Account() {
		// Empty constructor
	}

	public Account(Integer accountId, Float balance, Timestamp dateCreated) {
		accountId_ = accountId;
		balance_ = balance;
		dateCreated_ = dateCreated;
	}

	public Account(Account accounts) {
		this(accounts.getAccountId(), accounts.getBalance(), accounts
				.getDateCreated());
	}

	public Integer getAccountId() {
		return accountId_;
	}

	public void setAccountId(Integer accountId) {
		this.accountId_ = accountId;
	}

	public Float getBalance() {
		return balance_;
	}

	public void setBalance(Float balance) {
		this.balance_ = balance;
	}

	public Timestamp getDateCreated() {
		return dateCreated_;
	}

	public void setDateCreated(Timestamp dateCreated) {
		this.dateCreated_ = dateCreated;
	}

	@Override
	public String toString() {
		return "Account:" + getAccountId() + " Balance:" + getBalance();
	}

}