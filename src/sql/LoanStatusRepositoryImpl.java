package sql;

import bean.LoanStatus;

public class LoanStatusRepositoryImpl implements LoanStatusRepository {

	private DatabaseClass database_ = new DatabaseClass();
	private String sqlQuery_;
	
	@Override
	public LoanStatus create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getResultSet(String table) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(LoanStatus bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(LoanStatus bean) {
		// TODO Auto-generated method stub

	}

	@Override
	public LoanStatus create(Integer LoanId, String Type, String Status) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public void updateLoan(Integer LoanId, String Status, String Type) {
		try {
			sqlQuery_ = "update loan_status set status= '" + Status
					+ "', type = '" + Type + "' where loan_id='"
					+ LoanId + "'";
			System.out.println(sqlQuery_);

			database_.update(sqlQuery_);
		} catch (Exception e) {			
			e.printStackTrace();
		}
	}

}
