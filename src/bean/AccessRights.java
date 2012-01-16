package bean;

import enums.AccessRightsEnum;

public class AccessRights {

	public AccessRightsEnum getAccessRights(Integer accountTypeId) {
				if (accountTypeId == 0)
					return AccessRightsEnum.CASHIER;
				if (accountTypeId == 1)
					return AccessRightsEnum.DIRECTOR;
				if (accountTypeId == 10)
					return AccessRightsEnum.CUSTOMER;
				return AccessRightsEnum.NOACCESS;
			}
}
