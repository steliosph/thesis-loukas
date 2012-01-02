package enums;

public enum WebLoginEnum {

	WRONG_PASSWORD("Wrong password"),

	WRONG_USERNAME("Wrong username"),

	WRONG_LOGINS("Wrong Logins"),

	CORRECT_USER("User"),

	CORRECT_EMPLOYEE("Employee");

	private String type_;

	private WebLoginEnum(String type) {
		type_ = type;
	}

	public String getType() {
		return type_;
	}
}