package bean;

public class WebLogin {
	private Integer WebLoginId_;
	private Integer EmployeeId_;
	private Integer CustomerId_;
	private String Username_;
	private String Password_;

	public WebLogin(Integer WebLoginId, Integer EmployeeId, Integer CustomerId,
			String Username, String Password) {
		WebLoginId_ = WebLoginId;
		EmployeeId_ = EmployeeId;
		CustomerId_ = CustomerId;
		Username_ = Username;
		Password_ = Password;
	}

	public WebLogin(WebLogin login) {
		this(login.getWebLoginId(), login.getEmployeeId(), login
				.getCustomerId(), login.getUsername(), login.getPassword());
	}

	public Integer getWebLoginId() {
		return WebLoginId_;
	}

	public void setWebLoginId(Integer webLoginId) {
		this.WebLoginId_ = webLoginId;
	}

	public Integer getEmployeeId() {
		return EmployeeId_;
	}

	public void setEmployeeId(Integer employeeId) {
		this.EmployeeId_ = employeeId;
	}

	public Integer getCustomerId() {
		return CustomerId_;
	}

	public void setCustomerId(Integer customerId) {
		this.CustomerId_ = customerId;
	}

	public String getUsername() {
		return Username_;
	}

	public void setUsername(String username) {
		this.Username_ = username;
	}

	public String getPassword() {
		return Password_;
	}

	public void setPassword(String password) {
		this.Password_ = password;
	}

	public String checkLogin(String username, String password) {
		// HERE : import sql.webLoginRepository
		// Call function checkLogin in WebLoginReposioty of sql package.
		// Do the switch and return the Type
		// return webLoginEnum;
	} 


	@Override
	public String toString() {
		return "Username:" + getUsername() + "Password:" + getPassword();
	}

}
