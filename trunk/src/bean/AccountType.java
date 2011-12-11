package bean;

public class AccountType {
	private Integer AccountTypeId_;
	private String Type_;
	
	public AccountType(Integer AccountTypeId, String Type) {
		AccountTypeId_ = AccountTypeId;
		Type_ = Type;
	}
	
	public AccountType(AccountType accounttype) {
		this(accounttype.getAccountTypeId(),accounttype.getType());
	}

	public Integer getAccountTypeId() {
		return AccountTypeId_;
	}

	public void setAccountTypeId(Integer accountTypeId) {
		AccountTypeId_ = accountTypeId;
	}

	public String getType() {
		return Type_;
	}

	public void setType(String type) {
		Type_ = type;
	}
	
	
	

}
