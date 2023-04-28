package vn.smarthome.LoginFactory;

import vn.smarthome.service.ILoginService;
import vn.smarthome.service.impl.AdminLoginImpl;
import vn.smarthome.service.impl.CustomerLoginImpl;

public class LoginFactory {
    private LoginFactory() {
    }

    public static final ILoginService getRole(RoleType roleType) {
        switch (roleType) {

            case admin:
                return new AdminLoginImpl();

            case customer:
                return new CustomerLoginImpl();

            default:
                throw new IllegalArgumentException("This bank type is unsupported");
        }
    }
}