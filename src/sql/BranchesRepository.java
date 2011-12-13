package sql;

import bean.Branch;

public interface BranchesRepository extends BeanRepository<Branch> {

	public Branch create(Integer BranchId, Integer AccountId);

}
