package vn.smarthome.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.smarthome.entity.Customer;
import vn.smarthome.repository.CustomerRepository;
import vn.smarthome.service.ICustomerService;
import vn.smarthome.service.ILoginService;
@Service
public class CustomerLoginImpl implements ILoginService {
    @Autowired
    CustomerRepository customerRepository;
    @Override
    public Customer findByUsername(String username) {
        return customerRepository.findByUsername(username);
    }
}
