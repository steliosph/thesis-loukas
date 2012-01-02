package bean;

public class WebLogin {
	
	public String USERNAME = "username";
	public String EMPLOYEE_ID = "employee_id";
	public String CUSTOMER_ID = "customer_id";
	
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
		this(login.getwebLoginId(), login.getemployeeId(), login
				.getcustomerId(), login.getusername(), login.getpassword());
	}

	public Integer getwebLoginId() {
		return webLoginId_;
	}

	public void setwebLoginId(Integer webLoginId) {
		this.webLoginId_ = webLoginId;
	}

	public Integer getemployeeId() {
		return employeeId_;
	}

	public void setemployeeId(Integer employeeId) {
		this.employeeId_ = employeeId;
	}

	public Integer getcustomerId() {
		return customerId_;
	}

	public void setcustomerId(Integer customerId) {
		this.customerId_ = customerId;
	}

	public String getusername() {
		return username_;
	}

	public void setusername(String username) {
		this.username_ = username;
	}

	public String getpassword() {
		return password_;
	}

	public void setpassword(String password) {
		this.password_ = password;
	}

	public String checkLogin(String username, String password) {
		// HERE : import sql.webLoginRepository
		// Call function checkLogin in WebLoginReposioty of sql package.
		// Do the switch and return the Type
		// return webLoginEnum;
		return null;
	} 


	@Override
	public String toString() {
		return "Username:" + getusername() + "Password:" + getpassword();
	}

}
