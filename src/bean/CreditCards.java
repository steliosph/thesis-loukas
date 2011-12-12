package bean;

public class CreditCards {
	private String CardNumber_;
	private Integer CustomerId_;
	private Float Balance_;
	private Float Orio_;
	private String Csv_;

	public CreditCards(String CardNumber, Integer CustomerId, Float Balance,
			Float Orio, String Csv) {
		CardNumber_ = CardNumber;
		CustomerId_ = CustomerId;
		Balance_ = Balance;
		Orio_ = Orio;
		Csv_ = Csv;
	}

	public CreditCards(CreditCards creditcards) {
		this(creditcards.getCardNumber(), creditcards.getCustomerId(),
				creditcards.getBalance(), creditcards.getOrio(),creditcards.getCsv());
	}

	public String getCsv() {
		return Csv_;
	}

	public void setCsv(String csv) {
		Csv_ = csv;
	}

	public String getCardNumber() {
		return CardNumber_;
	}

	public void setCardNumber(String cardNumber) {
		CardNumber_ = cardNumber;
	}

	public Integer getCustomerId() {
		return CustomerId_;
	}

	public void setCustomerId(Integer customerId) {
		CustomerId_ = customerId;
	}

	public Float getBalance() {
		return Balance_;
	}

	public void setBalance(Float balance) {
		Balance_ = balance;
	}

	public Float getOrio() {
		return Orio_;
	}

	public void setOrio(Float orio) {
		Orio_ = orio;
	}

}
