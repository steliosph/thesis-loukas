package enums;

public enum AccessRightsEnum {
	
	CASHIER ("Cashier"),
	
	DIRECTOR ("Director"),
	
	CUSTOMER ("Customer"),
	
	NOACCESS ("No Access");

	private String accessRightsType_;

	private AccessRightsEnum(String accessRightsType) {
		accessRightsType = accessRightsType_;
	}

	public String getType() {
		return accessRightsType_;
	}

}
