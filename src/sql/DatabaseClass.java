package sql;

import java.sql.*;

//Database Class may be a better name
public class DatabaseClass {

        private final String URL = "jdbc:mysql://localhost:3306/bankdb?user=root&password=tessera";
        private Connection connection_;

        // TODO HAndle then with out the Throws Exception
        public DatabaseClass() {
                try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        connection_ = DriverManager.getConnection(URL);

                } catch (Exception e) {
                        // throw new Exception("Cannot Connect to database server "
                        // + e.getMessage());
                }
        }

        public Connection getConnection() {
                return connection_;
        }

        boolean closeConnection() throws Exception {
                try {
                        if (connection_.isClosed())
                                return false;

                        connection_.close();

                } catch (SQLException e) {
                        throw new Exception("Cannot Connect to database server "
                                        + e.getMessage());
                }

                return true;
        }

        public void update(String sqlQuery) throws Exception {
        	sqlQuery = new String(sqlQuery);
                try {
                        Statement stmt = connection_.createStatement();
                        stmt.executeUpdate(sqlQuery);
                } catch (java.sql.SQLException e) {
                        // TODO 
                }
        }

        public ResultSet getResultSet(String sqlQuery) {
                ResultSet rs = null;
                try {
                        sqlQuery = new String(sqlQuery);
                        Statement stmt = connection_.createStatement();
                        rs = stmt.executeQuery(sqlQuery);
                } catch (SQLException ex) {
                        for (Throwable throwable : ex) {
                                throwable.getMessage();
                                System.err.println(throwable.getMessage());
                        }
                }
                return rs;
        }

}