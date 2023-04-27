package vn.smarthome.service;

import vn.smarthome.entity.Customer;

public interface ILoginService {
    Customer findByUsername(String username);
}
