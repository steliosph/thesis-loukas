package sql;

import java.sql.ResultSet;
import java.sql.Timestamp;

import bean.Employee;

public class EmployeeRepositoryImpl implements EmployeeRepository {

        private DatabaseClass database_ = new DatabaseClass();
        private String sqlQuery_;

        
        @Override
        public Employee create() {
                // TODO Auto-generated method stub
                return null;
        }

        @Override
        public String getResultSet(String table) {
                // TODO Auto-generated method stub
                return null;
        }

        @Override
        public int update(Employee bean) {
                // TODO Auto-generated method stub
                return 0;
        }

        @Override
        public void insert(Employee bean) {
                // TODO Auto-generated method stub
                
        }

        @Override
        public Employee create(Integer employeeId, String firstname,
                        String lastname, Double salary, Timestamp dateHired,
                        Integer branchId, Integer accountTypeId, Integer addressId) {
                return new Employee(employeeId, firstname, lastname, salary, dateHired, branchId, accountTypeId, addressId);
        }
        
        @Override
        public Employee create(Integer employeeId) {
                Employee employee = new Employee(employeeId);
                return employee;
        }
        
        public Employee retrieveEmployee(Integer employeeId) { 
                if ( employeeId == null || employeeId <= 0 )
                        return null; /** Thewritika en lathos na epistrefeis NULL. Eprepe na dimiourgisoume NULL OBJECT alla pexe pello **/
                Employee employee = create(employeeId);
                sqlQuery_ = "SELECT * FROM employees WHERE employee_id = " + employeeId + " LIMIT 1";
                try { 
                        ResultSet rs = database_.getResultSet(sqlQuery_);
                        
                        if (rs.next()){
                        		employee.setEmployeeId(rs.getInt("employee_id"));
                                employee.setFirstname(rs.getString("firstname"));
                                employee.setLastname(rs.getString("lastname"));
                                employee.setSalary(rs.getDouble("salary"));
                                employee.setDateHired(rs.getTimestamp("date_hired"));
                                employee.setBranchId(rs.getInt("branch_id"));
                                employee.setAccountTypeId(rs.getInt("account_type_id"));
                                employee.setAddressId(rs.getInt("address_id"));
                        }
                } catch (Exception e){
                        e.getMessage();
                }
                if (employee.isEmptyEmployee())
                        return null;
                
                return employee;
        }
}