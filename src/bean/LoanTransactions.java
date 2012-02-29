package bean;

import java.sql.Timestamp;

public class LoanTransactions {
	private Integer LoanTransactionId_;
	private Timestamp LoanTransactionTime_;
	private Integer LoanId_;
	private Float InitialLoanAmount_;
	private Float TotalPayedAmount_;
	private Float RemainingPayeeAmount_;
	

	public LoanTransactions(Integer LoanTransactionId, Timestamp LoanTransactionTime, Integer LoanId, Float InitialLoanAmount, Float TotalPayedAmount, Float RemainingPayeeAmount) {
		LoanTransactionId_ = LoanTransactionId;		
		LoanTransactionTime_ = LoanTransactionTime;
		LoanId_ = LoanId;
		InitialLoanAmount_ = InitialLoanAmount;
		TotalPayedAmount_ = TotalPayedAmount;
		RemainingPayeeAmount_ = RemainingPayeeAmount;		
	}

	public LoanTransactions(LoanTransactions loantransactions) {
		this(loantransactions.getLoanTransactionId(), loantransactions
				.getLoanTransactionTime(), loantransactions.getLoanId(),
				loantransactions.getInitialLoanAmount(), loantransactions
						.getTotalPayedAmount(), loantransactions
						.getTotalPayedAmount());
	}

	public Integer getLoanTransactionId() {
		return LoanTransactionId_;
	}

	public void setLoanTransactionId(Integer loanTransactionId) {
		LoanTransactionId_ = loanTransactionId;
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

	public Float getInitialLoanAmount() {
		return InitialLoanAmount_;
	}

	public void setInitialLoanAmount(Float initialLoanAmount) {
		InitialLoanAmount_ = initialLoanAmount;
	}

	public Float getTotalPayedAmount() {
		return TotalPayedAmount_;
	}

	public void setTotalPayedAmount(Float totalPayedAmount) {
		TotalPayedAmount_ = totalPayedAmount;
	}

	public Float getRemainingPayeeAmount() {
		return RemainingPayeeAmount_;
	}

	public void setRemainingPayeeAmount(Float remainingPayeeAmount) {
		RemainingPayeeAmount_ = remainingPayeeAmount;
	}

	
	
}