package sql;

import java.sql.ResultSet;

public class AutoCompleteRepositoryImpl {

	private DatabaseClass database_ = new DatabaseClass();
	private String sqlQuery_;



	public ResultSet autoComplete(String AutoComplete) {
		sqlQuery_ = "SELECT customer_Id,firstname,lastname FROM customers WHERE firstname LIKE '"+  AutoComplete + "%' or lastname like '" + AutoComplete + "%'" ;
		ResultSet rs = database_.getResultSet(sqlQuery_);
		System.out.println(sqlQuery_);
		return rs;
	}



}
