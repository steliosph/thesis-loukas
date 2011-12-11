package bean;

import java.sql.Timestamp;

public class LoanTransactions {
	private Integer LoanTransactionId_;
	private Integer CustomerId_;
	private Integer LoanId_;
	private Timestamp LoanTransactionTime_;
	private Float Amount_;

	public LoanTransactions(Integer LoanTransactionId, Integer CustomerId,
			Integer LoanId, Timestamp LoanTransactionTime, Float Amount) {
		LoanTransactionId_ = LoanTransactionId;
		CustomerId_ = CustomerId;
		LoanId_ = LoanId;
		LoanTransactionTime_ = LoanTransactionTime;
		Amount_ = Amount;
	}

	public LoanTransactions(LoanTransactions loantransactions) {
		this(loantransactions.getLoanTransactionId(), loantransactions
				.getCustomerId(), loantransactions.getLoanId(), loantransactions
				.getLoanTransactionTime(), loantransactions.getAmount());
	}

	public Integer getLoanTransactionId() {
		return LoanTransactionId_;
	}

	public void setLoanTransactionId(Integer loanTransactionId) {
		LoanTransactionId_ = loanTransactionId;
	}

	public Integer getCustomerId() {
		return CustomerId_;
	}

	public void setCustomerId(Integer customerId) {
		CustomerId_ = customerId;
	}

	public Integer getLoanId() {
		return LoanId_;
	}

	public void setLoanId(Integer loanId) {
		LoanId_ = loanId;
	}

	public Timestamp getLoanTransactionTime() {
		return LoanTransactionTime_;
	}

	public void setLoanTransactionTime(Timestamp loanTransactionTime) {
		LoanTransactionTime_ = loanTransactionTime;
	}

	public Float getAmount() {
		return Amount_;
	}

	public void setAmount(Float amount) {
		Amount_ = amount;
	}

}
