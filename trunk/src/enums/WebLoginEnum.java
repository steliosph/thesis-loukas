package enums;

public enum WebLoginEnum {

	WRONG_USERNAME_PASSWORD("Wrong username"),

	WRONG_LOGINS("Wrong Logins"),

	CORRECT_USER("User"),

	CORRECT_EMPLOYEE("Employee"),
	
	TAMIAS ("tamias"),
	
	DIEFTHINTIS ("diefthintis"),
	
	WRONG_TYPE ("Wrong Type");

	private String type_;

	private WebLoginEnum(String type) {
		type_ = type;
	}

	public String getType() {
		return type_;
	}
}