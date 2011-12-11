package bean;

import java.sql.Timestamp;

public class Employee {
	private Integer EmployeeId_;
	private String Firstname_;
	private String Lastname_;
	private Double Salary_;
	private Timestamp DateHired_;
	private Integer BranchId_;
	private Integer AccountTypeId_;
	private Integer AddressId_;

	public Employee(Integer EmployeeId, String Firstname, String Lastname,
			Double Salary, Timestamp DateHired, Integer BranchId,
			Integer AccountTypeId, Integer AddressId) {
		EmployeeId_ = EmployeeId;
		Firstname_ = Firstname;
		Lastname_ = Lastname;
		Salary_ = Salary;
		DateHired_ = DateHired;
		BranchId_ = BranchId;
		AccountTypeId_ = AccountTypeId;
		AddressId_ = AddressId;
	}

	public Employee(Employee employees) {
		this(employees.getEmployeeId(), employees.getFirstname(), employees
				.getLastname(), employees.getSalary(),
				employees.getDateHired(), employees.getBranchId(), employees
						.getAccountTypeId(), employees.getAddressId());
	}

	public Integer getEmployeeId() {
		return EmployeeId_;
	}

	public void setEmployeeId(Integer employeeId) {
		this.EmployeeId_ = employeeId;
	}

	public String getFirstname() {
		return Firstname_;
	}

	public void setFirstname(String firstname) {
		this.Firstname_ = firstname;
	}

	public String getLastname() {
		return Lastname_;
	}

	public void setLastname(String lastname) {
		this.Lastname_ = lastname;
	}

	public Double getSalary() {
		return Salary_;
	}

	public void setSalary(Double salary) {
		this.Salary_ = salary;
	}

	public Timestamp getDateHired() {
		return DateHired_;
	}

	public void setDateHired(Timestamp dateHired) {
		this.DateHired_ = dateHired;
	}

	public Integer getBranchId() {
		return BranchId_;
	}

	public void setBranchId(Integer branchId) {
		this.BranchId_ = branchId;
	}

	public Integer getAccountTypeId() {
		return AccountTypeId_;
	}

	public void setAccountTypeId(Integer accountTypeId) {
		this.AccountTypeId_ = accountTypeId;
	}

	public Integer getAddressId() {
		return AddressId_;
	}

	public void setAddressId(Integer addressId) {
		this.AddressId_ = addressId;
	}

	@Override
	public String toString() {
		return "Firstname:" + getFirstname() + "Lastname:" + getLastname();
	}
}
