package sql;

import bean.WebLogin;

public interface WebLoginRepository extends BeanRepository<WebLogin> {
	
	public WebLogin create(Integer WebLoginId, Integer EmployeeId, Integer CustomerId,
			String Username, String Password);

	public WebLoginEnum checkLogin(String username, String password); // Create the appopriate checkLoign in the Impl. It will handle evetything there

}
