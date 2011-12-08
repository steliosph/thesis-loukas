package sql;

import bean.Accounts;

public class AccountsRepositoryImpl implements AccountsRepository {

	@Override
	public Accounts create() {
		Accounts bean = new Accounts();
		return bean;
	}
	
	// TODO More Create

	@Override
	public String getQueryVariables(String table) {
		if (table == null)
			return "account_id, balance,date_created";
		return table+".account_id, "+table+".balance, "+table+".date_created";
	}

	@Override
	public void update(Accounts bean) {
		// TODO give me 5 minutes more
		
	}

}
