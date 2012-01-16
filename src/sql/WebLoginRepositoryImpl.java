package sql;

import java.sql.ResultSet;

import enums.WebLoginEnum;
import bean.WebLogin;

public class WebLoginRepositoryImpl implements WebLoginRepository {

	public final String USERNAME = "username";

	private DatabaseClass database_ = new DatabaseClass();
	private String sqlQuery_;

	@Override
	public WebLogin create() {
		return null;
	}

	@Override
	public String getResultSet(String table) {
		return null;
	}

	@Override
	public int update(WebLogin bean) {
		return 0;
	}

	@Override
	public void insert(WebLogin bean) {

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
			sqlQuery_ = "Select employee_id,customer_id from web_login where username = '"
					+ username + "' and password = '" + password + "' LIMIT 1";
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

	@Override
	public WebLoginEnum getAdministratorType(Integer employeeId) {
		sqlQuery_ = " select * from employees where employee_id = "
				+ employeeId;
		try {
			ResultSet rs = database_.getResultSet(sqlQuery_);
			rs = database_.getResultSet(sqlQuery_);
			if (rs.next()) {
				if (rs.getInt("account_type_id") == 0)
					return WebLoginEnum.CASHIER;
				if (rs.getInt("account_type_id") == 1)
					return WebLoginEnum.DIRECTOR;
			}
		} catch (Exception e) {
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
	
	public Integer getCustomerId(String username, String password) {
		sqlQuery_ = "Select customer_id from web_login where username = '"
				+ username + "' and password = '" + password + "' LIMIT 1";
		try {
			ResultSet rs = database_.getResultSet(sqlQuery_);
			if (rs.next())
				return rs.getInt("customer_id");
		} catch (Exception e) {
			e.getMessage();
		}
		return null;
	}
}