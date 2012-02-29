package enums;

public enum LoanOptions {
	
	PROSOPIKO_DANEIO ("Προσωπικό Δάνειο"),
	
	DANEIO_AGORAS ("Δάνειo Αγοράς"),
	
	STEGASTIKO_DANEIO ("Στεγαστικό δάνειο"),
	
	DANEIO_AGORA_AFTOKINITOU ("Δάνεια Αγοράς Αυτοκινήτου"),
	
	KATANALWTIKO_DANEIO ("Καταναλωτικό Δάνειο");
	
	private String type;

	private LoanOptions(String type) {
		this.type = type;
	}

	public String getType() {
		return type;
	}
}