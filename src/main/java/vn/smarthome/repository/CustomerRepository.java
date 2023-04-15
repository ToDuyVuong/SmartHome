package vn.smarthome.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.smarthome.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer>{
    
}
