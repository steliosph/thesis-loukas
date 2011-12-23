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
		String SQL;
		database = new DatabaseClass();
		SQL= "select * from web_login";
		try {
			database.getQueryVariables(SQL);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return table;
	}

	@Override
	public int update(WebLogin bean) {
		String SQL;
		database = new DatabaseClass();
		SQL= "insert into xxx";
		try {
			database.update(SQL);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
