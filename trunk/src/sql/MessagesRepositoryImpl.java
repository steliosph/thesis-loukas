package sql;

import java.sql.ResultSet;

public class MessagesRepositoryImpl {

	private DatabaseClass database_ = new DatabaseClass();
	private String sqlQuery_;

	public void insertMessage(String Email, String Message, String Fullname) {
		try {
			sqlQuery_ = "INSERT INTO messages (email,message,fullname) VALUES ('"
					+ Email + "' , '" + Message + "' , '" + Fullname + "' )";
			System.out.println(sqlQuery_);
			database_.update(sqlQuery_);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ResultSet getResult() {
		sqlQuery_ = "select id,email,message,fullname,DATE_FORMAT(time, '%H:%i:%s %d/%m/%Y') AS time from messages";
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}

	public ResultSet editMessage(Integer MessageId) {
		sqlQuery_ = "select * from messages where id ='" + MessageId + "'";
		System.out.println(sqlQuery_);
		ResultSet rs = database_.getResultSet(sqlQuery_);
		return rs;
	}

	public void updateMessage(String Fullname, String Email, String Message,
			Integer MessageId) {
		try {
			sqlQuery_ = "update messages set Fullname = '" + Fullname
					+ "' , Email = '" + Email + "', Message = '" + Message
					+ "' where Id ='" + MessageId + "'";
			System.out.println(sqlQuery_);
			database_.update(sqlQuery_);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public void deleteMessage(Integer MessageId) {
		try {
			sqlQuery_ = "DELETE FROM messages where Id ='" + MessageId + "'";
			System.out.println(sqlQuery_);
			database_.update(sqlQuery_);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
