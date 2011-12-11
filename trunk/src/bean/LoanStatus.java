package bean;

public class LoanStatus {
	private Integer LoanId_;
	private String Type_;
	private String Status_;
	
	public LoanStatus (Integer LoanId,String Type,String Status) {
		LoanId_ = LoanId;
		Type_ = Type;
		Status_ = Status;
	}
	
	public LoanStatus(LoanStatus loanstatus) { 
		this(loanstatus.getLoanId(),loanstatus.getType(),loanstatus.getStatus());
	}

	public Integer getLoanId() {
		return LoanId_;
	}

	public void setLoanId(Integer loanId) {
		LoanId_ = loanId;
	}

	public String getType() {
		return Type_;
	}

	public void setType(String type) {
		Type_ = type;
	}

	public String getStatus() {
		return Status_;
	}

	public void setStatus(String status) {
		Status_ = status;
	}

	
}
