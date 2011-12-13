package sql;

import bean.WebLogin;

public interface WebLoginRepository extends BeanRepository<WebLogin> {
	
	public WebLogin create(Integer WebLoginId, Integer EmployeeId, Integer CustomerId,
			String Username, String Password);

}
