package sql;

import java.sql.ResultSet;
import bean.Branch;

public class BranchesRepositoryImpl implements BranchesRepository {

	private DatabaseClass database = new DatabaseClass();
	private String sqlQuery;
	
	@Override
	public Branch create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getResultSet(String table) {
		// sqlQuery = "select * from branches";
		// ResultSet rs = database.getResultSet(sqlQuery);
		// while (rs.next()) {
		// rs.getString("address_id");
		// rs.getString("branch_id");
		// }
		return table;
		
	}

	@Override
	public int update(Branch bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(Branch bean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Branch create(Integer BranchId, Integer AccountId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ResultSet getResult() {
		sqlQuery = "select * from branches";
		ResultSet rs = database.getResultSet(sqlQuery);
		return rs;
	}

}
