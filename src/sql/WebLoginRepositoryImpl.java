package sql;

import bean.WebLogin;

public class WebLoginRepositoryImpl implements WebLoginRepository{
	
	private DatabaseClass database;

	@Override
	public WebLogin create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getQueryVariables(String table) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(WebLogin bean) {
		String SQL;
		database = new DatabaseClass();
		SQL= "select * from web_login";
		database.SQLQuery(SQL);
		
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(WebLogin bean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public WebLogin create(Integer webLoginId, Integer employeeId,
			Integer customerId, String username, String password) {
		// TODO Auto-generated method stub
		return null;
	}

}
