package sql;

import java.sql.ResultSet;

import enums.WebLoginEnum;
import bean.WebLogin;

public class WebLoginRepositoryImpl implements WebLoginRepository {

	private WebLogin webLogin_;

	public final String USERNAME = "username";

	private DatabaseClass database = new DatabaseClass();
	private String sqlQuery;

	@Override
	public WebLogin create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getResultSet(String table) {
		sqlQuery = "select * from web_login";
		try {
			database.getResultSet(sqlQuery);
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
		SQL = "update into xxx";
		try {
			database.update(SQL);
		} catch (Exception e) {
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

	@Override
	public WebLoginEnum checkLogin(String username, String password) {
		try {

			sqlQuery = "Select * from web_login where username = '" + username
					+ "' and password = '" + password + "' LIMIT 1";
			ResultSet rs = database.getResultSet(sqlQuery);
			while (rs.next()) {
				if (rs.getString("employee_id") != null) {
				//	Integer emp_id = 0;
				//	emp_id = rs.getInt("employee_id");
				//	sqlQuery = " select * from employees where employee_id = " + emp_id ;
				//	System.out.println(sqlQuery);
				//	rs = database.getResultSet(sqlQuery);
				//	if (rs.next()) {
				//	Integer acc_type = rs.getInt(6);
				//	if (acc_type == 0)
				//		return WebLoginEnum.TAMIAS;
				//	if (acc_type == 1)
				//		return WebLoginEnum.DIEFTHINTIS;
				//	}
					
					return WebLoginEnum.CORRECT_EMPLOYEE;
				}
				if (rs.getString("customer_id") != null)
					return WebLoginEnum.CORRECT_USER;
			}
		} catch (Exception e) {
			e.getMessage();
			// TODO: handlee exception
		}
		return WebLoginEnum.WRONG_USERNAME_PASSWORD;

	}

	public WebLoginEnum getEmpId(String username) {
		Integer employee_id = 0;
		//String type = null;
		try {
			sqlQuery = "select employee_id from web_login where username = '"+ username + "' LIMIT 1";
			ResultSet rs = database.getResultSet(sqlQuery);
			if (rs.next())
			employee_id = rs.getInt("employee_id");
			sqlQuery = " select * from employees where employee_id = " + employee_id ;
			 rs = database.getResultSet(sqlQuery);
			 if (rs.next()) {
			if (rs.getInt("account_type_id") == 0)
				return WebLoginEnum.TAMIAS;
			if (rs.getInt("account_type_id") == 1)
				return WebLoginEnum.DIEFTHINTIS;
			 }
		} catch (Exception e) {
			e.getMessage();
		}
		return WebLoginEnum.WRONG_TYPE;
	}
}