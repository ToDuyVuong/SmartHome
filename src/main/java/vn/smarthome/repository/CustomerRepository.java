package vn.smarthome.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.smarthome.entity.Customer;

import java.util.List;

public interface CustomerRepository extends JpaRepository<Customer, Integer>{

    Customer findByUsernameContaining(String username);

    List<Customer> findByFullnameContaining(String fullname);

    Customer findByUsername(String username);

    Customer findById(int id);
    
}
