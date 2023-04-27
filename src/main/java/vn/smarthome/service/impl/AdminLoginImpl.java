package vn.smarthome.service.impl;

import org.springframework.stereotype.Service;
import vn.smarthome.entity.Customer;
import vn.smarthome.service.ILoginService;

@Service
public class AdminLoginImpl implements ILoginService {
    @Override
    public Customer findByUsername(String username) {
        return new  Customer(-1,null, null, false , null, null, null, username, username, null, null);
    }
}
