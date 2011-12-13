package sql;

import bean.Loans;

public interface LoansRepository extends BeanRepository<Loans> {
	
	public Loans create(Integer LoanId, Integer CustomerId, Float LoanAmount);

}
