package sql;

import java.sql.ResultSet;

import enums.WebLoginEnum;
import bean.Employee;
import bean.WebLogin;

public class WebLoginRepositoryImpl implements WebLoginRepository {

	public final String USERNAME = "username";

	private DatabaseClass database_ = new DatabaseClass();
	private String sqlQuery_;

	@Override
	public WebLogin create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getResultSet(String table) {
		sqlQuery_ = "select * from web_login";
		try {
			database_.getResultSet(sqlQuery_);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return table;
	}

	@Override
	public int update(WebLogin bean) {
		String SQL;
		database_ = new DatabaseClass();
		SQL = "update into xxx";
		try {
			database_.update(SQL);
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
			sqlQuery_ = "Select employee_id,customer_id from web_login where username = '" + username
					+ "' and password = '" + password + "' LIMIT 1";
			ResultSet rs = database_.getResultSet(sqlQuery_);
			while (rs.next()) {
				if (rs.getString("employee_id") != null) {
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

	public WebLoginEnum getAccountType(String username, String password) {
		try {
			Integer employee_id = getEmployeeId(username, password);
			sqlQuery_ = "SELECT account_type_id from employees where employee_id = "
					+ employee_id;
			ResultSet rs = database_.getResultSet(sqlQuery_);
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

	@Override
	public WebLoginEnum getAdministratorType(Integer employeeId) {
		sqlQuery_ = " select * from employees where employee_id = "
				+ employeeId;
		try {
			ResultSet rs = database_.getResultSet(sqlQuery_);
			rs = database_.getResultSet(sqlQuery_);
			if (rs.next()) {
				if (rs.getInt("account_type_id") == 0)
					return WebLoginEnum.TAMIAS;
				if (rs.getInt("account_type_id") == 1)
					return WebLoginEnum.DIEFTHINTIS;
			}
		}catch (Exception e) {
			e.getMessage();
		}
		return WebLoginEnum.WRONG_TYPE;
	}
	
	public Integer getEmployeeId(String username, String password) {
		sqlQuery_ = "Select employee_id from web_login where username = '"
				+ username + "' and password = '" + password + "' LIMIT 1";
		try {
			ResultSet rs = database_.getResultSet(sqlQuery_);
			if (rs.next())
				return rs.getInt("employee_id");
		} catch (Exception e) {
			e.getMessage();
		}
		return null;
	}
}