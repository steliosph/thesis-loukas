package sql;

import enums.WebLoginEnum;
import bean.WebLogin;

public interface WebLoginRepository extends BeanRepository<WebLogin> {

        public WebLogin create(Integer webLoginId, Integer employeeId,
                        Integer customerId, String username, String password);

        public WebLoginEnum checkLogin(String username, String password);
       
        public WebLoginEnum getAdministratorType(Integer employeeId);
       
        public Integer getEmployeeId(String username, String password);
        
        public Integer getCustomerId(String username, String password);
        
        void addUser(String Username, String Password, Integer CustomerId);

}

