package sql;

import java.sql.Timestamp;

import bean.Employee;

public interface EmployeeRepository extends BeanRepository<Employee>{
       
        public Employee create(Integer EmployeeId, String Firstname, String Lastname,
                        Double Salary, Timestamp DateHired, Integer BranchId,
                        Integer AccountTypeId, Integer AddressId);
       
        public Employee create(Integer employeeId);
       
        public Employee retrieveEmployee(Integer employeeId);

}