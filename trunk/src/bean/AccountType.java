package bean;

// Never Undespace in the Class. One Word Always seperated with Capital letter
public class AccountType {
	private Integer account_type_id_;
	private String type_;

	public AccountType(Integer account_type_id, String type) {
		account_type_id_ = account_type_id;
		type_ = type;
	}

	public AccountType(AccountType accounttypes) {
		this(accounttypes.getAccount_type_id(), accounttypes.getType());
	}

	public Integer getAccount_type_id() {
		return account_type_id_;
	}

	public void setAccount_type_id(Integer account_type_id) {
		this.account_type_id_ = account_type_id;
	}

	public String getType() {
		return type_;
	}

	public void setType(String type) {
		this.type_ = type;
	}

}
