package sql;

import java.sql.Timestamp;

import bean.Account;

public class AccountsRepositoryImpl implements AccountsRepository {

	@Override
	public Account create() {
		Account bean = new Account();
		return bean;
	}

	@Override
	public Account create(Integer accountId, float balance,
			Timestamp dateCreated) {
		Account bean = new Account(accountId, balance, dateCreated);
		return bean;

	}

	// TODO More Create

	@Override
	public String getResultSet(String table) {
		if (table == null)
			return "account_id, balance,date_created";
		return table + ".account_id, " + table + ".balance, " + table
				+ ".date_created";
	}

	@Override
	public int update(Account account) {
		// TODO give me 5 minutes more
		if (account == null)
			return 0;
		// XXX check for nullObject

		// XXX TODO
		// if (account.isNewInsert()){
		// insert(account);
		// return 1;
		// }
		// Create a coonection
		// PreparedStatement st =
		// DatabaseClass con = new DatabaseClass();
		// TODO Do your stuff here .....

		return 0;

	}

	@Override
	public void insert(Account account) {
		// TODO Auto-generated method stub

	}

}
