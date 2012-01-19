package sql;

import java.sql.*;

//Database Class may be a better name
public class DatabaseClass {

     //   private final String URL = "jdbc:mysql://localhost:3306/bankdb?user=root&password=tessera";
        private Connection connection_;

        // TODO HAndle then with out the Throws Exception
        public DatabaseClass() {
                try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        connection_ = DriverManager.getConnection("jdbc:mysql://localhost/bankdb?useUnicode=true&mysqlEncoding=UTF-8&characterEncoding=UTF-8&characterSetResults=UTF-8", "root","tessera");

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

       	 public Integer getLastId(String sqlQuery) throws SQLException {
       		ResultSet rs = null;
       		int Id = 0;
       		 try {
                
                PreparedStatement pstmt = connection_.prepareStatement(sqlQuery, Statement.RETURN_GENERATED_KEYS);
                pstmt.executeUpdate();               
                rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                  Id = rs.getInt(1);}
                } catch (SQLException ex) {               
                }
                return Id;
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