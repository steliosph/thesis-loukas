package enums;

public enum LoanStatus {
	
	EKKREMEI ("Εκκρεμεί"),
	
	EGKRITHIKE ("Εγκρίθηκε"),
	
	APORIFTHIKE ("Απόρριψη");
	
	private String status;

	private LoanStatus(String status) {
		this.status = status;
	}

	public String getStatus() {
		return status;
	}
}