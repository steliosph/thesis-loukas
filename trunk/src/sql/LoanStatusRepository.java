package sql;

import bean.LoanStatus;

public interface LoanStatusRepository extends BeanRepository<LoanStatus> {
	
	public LoanStatus create(Integer LoanId,String Type,String Status);

}
