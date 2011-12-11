package bean;

public class Loans {
	private Integer LoanId_;
	private Integer CustomerId_;
	private Float LoanAmount_;
	
	public Loans (Integer LoanId, Integer CustomerId, Float LoanAmount) {
		LoanId_ = LoanId;
		CustomerId_ = CustomerId;
		LoanAmount_ = LoanAmount;
	}
	
	public Loans(Loans loans) {
		this(loans.getLoanId(),loans.getCustomerId(),loans.getLoanAmount());
	}

	public Integer getLoanId() {
		return LoanId_;
	}

	public void setLoanId(Integer loanId) {
		LoanId_ = loanId;
	}

	public Integer getCustomerId() {
		return CustomerId_;
	}

	public void setCustomerId(Integer customerId) {
		CustomerId_ = customerId;
	}

	public Float getLoanAmount() {
		return LoanAmount_;
	}

	public void setLoanAmount(Float loanAmount) {
		LoanAmount_ = loanAmount;
	}
	
	

}
