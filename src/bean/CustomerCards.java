package bean;

public class CustomerCards {
	private String CardNumber_;
	private String Csv_;
	private Integer CustomerId_;

	public CustomerCards(String CardNumber, String Csv, Integer CustomerId) {
		CardNumber_ = CardNumber;
		Csv_ = Csv;
		CustomerId_ = CustomerId;
	}

	public CustomerCards(CustomerCards customercards) {
		this(customercards.getCardNumber(), customercards.getCsv(),
				customercards.getCustomerId());

	}

	public String getCardNumber() {
		return CardNumber_;
	}

	public void setCardNumber(String cardNumber) {
		CardNumber_ = cardNumber;
	}

	public String getCsv() {
		return Csv_;
	}

	public void setCsv(String csv) {
		Csv_ = csv;
	}

	public Integer getCustomerId() {
		return CustomerId_;
	}

	public void setCustomerId(Integer customerId) {
		CustomerId_ = customerId;
	}

}
