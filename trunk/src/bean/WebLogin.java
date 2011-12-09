package bean;

public class WebLogin {
	private Integer webLoginId_;
	private Integer employeeId_;
	private Integer customerId_;
	private String username_;
	private String password_;

	public WebLogin(Integer webLoginId, Integer employeeId, Integer customerId,
			String username, String password) {
		webLoginId_ = webLoginId;
		employeeId_ = employeeId;
		customerId_ = customerId;
		username_ = username;
		password_ = password;
	}

	public WebLogin(WebLogin login) {
		this(login.getWebLoginId(), login.getEmployeeId(), login
				.getCustomerId(), login.getUsername(), login.getPassword());
	}

	public Integer getWebLoginId() {
		return webLoginId_;
	}

	public void setWebLoginId(Integer webLoginId) {
		this.webLoginId_ = webLoginId;
	}

	public Integer getEmployeeId() {
		return employeeId_;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId_ = employeeId;
	}

	public Integer getCustomerId() {
		return customerId_;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId_ = customerId;
	}

	public String getUsername() {
		return username_;
	}

	public void setUsername(String username) {
		this.username_ = username;
	}

	public String getPassword() {
		return password_;
	}

	public void setPassword(String password) {
		this.password_ = password;
	}

	@Override
	public String toString() {
		return "Username:" + getUsername() + "Password:" + getPassword();
	}

}
