package bean;

import java.sql.Timestamp;

public class CreditCardsTransaction {
	private Integer CreditCardTransactionId_;
	private Integer CustomerId_;
	private String CardNumber_;
	private Timestamp CreditCardTransactionTime_;
	private Boolean Deposit_;
	private Float Amount_;

	public CreditCardsTransaction(Integer CreditCardTransactionId,
			Integer CustomerId, String CardNumber,
			Timestamp CreditCardTransactionTime, Boolean Deposit, Float Amount) {
		CreditCardTransactionId_ = CreditCardTransactionId;
		CustomerId_ = CustomerId;
		CardNumber_ = CardNumber;
		CreditCardTransactionTime_ = CreditCardTransactionTime;
		Deposit_ = Deposit;
		Amount_ = Amount;
	}

	public CreditCardsTransaction(CreditCardsTransaction creditcardstransaction) {
		this(creditcardstransaction.getCreditCardTransactionId(),
				creditcardstransaction.getCustomerId(), creditcardstransaction
						.getCardNumber(), creditcardstransaction
						.getCreditCardTransactionTime(), creditcardstransaction
						.getDeposit(), creditcardstransaction.getAmount());
	}

	public Integer getCreditCardTransactionId() {
		return CreditCardTransactionId_;
	}

	public void setCreditCardTransactionId(Integer creditCardTransactionId) {
		CreditCardTransactionId_ = creditCardTransactionId;
	}

	public Integer getCustomerId() {
		return CustomerId_;
	}

	public void setCustomerId(Integer customerId) {
		CustomerId_ = customerId;
	}

	public String getCardNumber() {
		return CardNumber_;
	}

	public void setCardNumber(String cardNumber) {
		CardNumber_ = cardNumber;
	}

	public Timestamp getCreditCardTransactionTime() {
		return CreditCardTransactionTime_;
	}

	public void setCreditCardTransactionTime(Timestamp creditCardTransactionTime) {
		CreditCardTransactionTime_ = creditCardTransactionTime;
	}

	public Boolean getDeposit() {
		return Deposit_;
	}

	public void setDeposit(Boolean deposit) {
		Deposit_ = deposit;
	}

	public Float getAmount() {
		return Amount_;
	}

	public void setAmount(Float amount) {
		Amount_ = amount;
	}

}
