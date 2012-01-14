package bean;

import java.sql.Timestamp;

public class Employee {
	private Integer employeeId_;
	private String firstname_;
	private String lastname_;
	private Double salary_;
	private Timestamp dateHired_;
	private Integer branchId_;
	private Integer accountTypeId_;
	private Integer addressId_;

	public Employee(Integer EmployeeId, String Firstname, String Lastname,
			Double Salary, Timestamp DateHired, Integer BranchId,
			Integer AccountTypeId, Integer AddressId) {
		employeeId_ = EmployeeId;
		firstname_ = Firstname;
		lastname_ = Lastname;
		salary_ = Salary;
		dateHired_ = DateHired;
		branchId_ = BranchId;
		accountTypeId_ = AccountTypeId;
		addressId_ = AddressId;
	}

	public Employee(Employee employees) {
		this(employees.getEmployeeId(), employees.getFirstname(), employees
				.getLastname(), employees.getSalary(),
				employees.getDateHired(), employees.getBranchId(), employees
						.getAccountTypeId(), employees.getAddressId());
	}
	
	public Employee (Integer EmployeeId) { 
		// Empty Constructor
	}
	
	public boolean isEmptyEmployee() { 
		if (getEmployeeId() == null || getFirstname() == null)
			return true;
		return false;		
	}

	public Integer getEmployeeId() {
		return employeeId_;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId_ = employeeId;
	}

	public String getFirstname() {
		return firstname_;
	}

	public void setFirstname(String firstname) {
		this.firstname_ = firstname;
	}

	public String getLastname() {
		return lastname_;
	}

	public void setLastname(String lastname) {
		this.lastname_ = lastname;
	}

	public Double getSalary() {
		return salary_;
	}

	public void setSalary(Double salary) {
		this.salary_ = salary;
	}

	public Timestamp getDateHired() {
		return dateHired_;
	}

	public void setDateHired(Timestamp dateHired) {
		this.dateHired_ = dateHired;
	}

	public Integer getBranchId() {
		return branchId_;
	}

	public void setBranchId(Integer branchId) {
		this.branchId_ = branchId;
	}

	public Integer getAccountTypeId() {
		return accountTypeId_;
	}

	public void setAccountTypeId(Integer accountTypeId) {
		this.accountTypeId_ = accountTypeId;
	}

	public Integer getAddressId() {
		return addressId_;
	}

	public void setAddressId(Integer addressId) {
		this.addressId_ = addressId;
	}

	@Override
	public String toString() {
		return "Firstname:" + getFirstname() + "Lastname:" + getLastname();
	}
}
