package bean;

public class Branch {
	private Integer branchId_;
	private Integer addressId_;

	public Branch(Integer branchId, Integer addressId) {
		branchId_ = branchId;
		addressId_ = addressId;
	}

	public Branch(Branch branches) {
		this(branches.getBranchId(), branches.getAddressId());

	}

	public Integer getBranchId() {
		return branchId_;
	}

	public void setBranchId(Integer branchId) {
		this.branchId_ = branchId;
	}

	public Integer getAddressId() {
		return addressId_;
	}

	public void setAddressId(Integer addressId) {
		this.addressId_ = addressId;
	}

}
