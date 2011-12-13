package sql;

import bean.AccountType;

public interface AccountsTypeRepository extends BeanRepository<AccountType>{
	
	public AccountType create(Integer AccountTypeId, String Type);

}


