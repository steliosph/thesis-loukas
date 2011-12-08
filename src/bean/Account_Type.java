package bean;

public class Account_Type {
	private Integer account_type_id_;
	private String type_;

	public Account_Type(Integer account_type_id, String type) {
		account_type_id_ = account_type_id;
		type_ = type;
	}

	public Account_Type(Account_Type account_types) {
		this(account_types.getAccount_type_id(), account_types.getType());
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