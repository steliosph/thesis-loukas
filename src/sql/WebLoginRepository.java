package sql;

import enums.WebLoginEnum;
import bean.WebLogin;

public interface WebLoginRepository extends BeanRepository<WebLogin> {

	public WebLogin create(Integer webLoginId, Integer employeeId,
			Integer customerId, String username, String password);

	public WebLoginEnum checkLogin(String username, String password);
	// Create the appopriate checkLoign in the Impl. It will handle evetything
	// there

}
