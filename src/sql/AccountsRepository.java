package sql;

import java.sql.Timestamp;

import bean.Account;

public interface AccountsRepository extends BeanRepository<Account> {

	public Account create(Integer accountId, float balance, Timestamp dateCreated);

	// TODO Add More methods
	
	
}
