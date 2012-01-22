package enums;

public enum LoanOptions {
	
	PROSOPIKO_DANEIO ("Προσωπικό Δάνειο"),
	
	DANEIO_AGORAS ("Δάνειo Αγοράς"),
	
	STEGASTIKO_DANEIO ("Στεγαστικό Δάνειο"),
	
	KATANALWTIKO_DANEIO ("Καταναλωτικό Δάνειο");
	
	private String type_;

	private LoanOptions(String type) {
		type_ = type;
	}

	public String getType() {
		return type_;
	}
}