package sql;

import java.sql.*;

//Database Class may be a better name
public class DatabaseClass {
        // Why main ? This is not a runner class.
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
        
        
    	public void update(String theQuery) throws Exception{
    		theQuery=new String(theQuery);
    		try{
                Statement stmt=connection_.createStatement();
                stmt.executeUpdate(theQuery);
            }
            catch(java.sql.SQLException e){
            }
        }      
    	

    	public ResultSet getResultSet(String sqlQuery) throws Exception{
    		ResultSet rs = null;
    		try{
    			sqlQuery=new String(sqlQuery);
                Statement stmt=connection_.createStatement();
                rs=stmt.executeQuery(sqlQuery);
            }
            catch(SQLException ex){
            }
    		return rs;
        }    	

    	
    	
       // public void SQLQuery(String theQuery) {
       //       try 
       //     {
       //   Statement stmt = connection_.createStatement();
       //           ResultSet rs;
       //         stmt.executeQuery(theQuery);
       //         rs = stmt.getResultSet();
       //         rs.close();
       //         stmt.close();
       //         rs = null;
       //         stmt = null;
       //         }
       //         catch(java.sql.SQLException e)
       // {
       //         }
            

        // public static void main(String[] args) {
        // Connection conn = null;
        // try {
        // String url =
        // "jdbc:mysql://localhost:3306/bankdb?user=root&password=tessera";
        // Class.forName("com.mysql.jdbc.Driver").newInstance();
        // conn = DriverManager.getConnection(url);
        // System.out.println("Database connection established");
        // } catch (Exception e) {
        // System.err.println("Cannot connect to database server");
        // } finally {
        // if (conn != null) {
        // try {
        // conn.close();
        // System.out.println("Database connection terminated");
        // } catch (Exception e) { /* ignore close errors */
        // }
        // }
        // }
        // }
}