package vn.smarthome.service;

import org.springframework.data.domain.Example;
import vn.smarthome.entity.Customer;

import java.util.List;
import java.util.Optional;

public interface ICustomerService {
    List<Customer> findAll();

    <S extends Customer> List<S> findAll(Example<S> example);

    <S extends Customer> S save(S entity);

    Optional<Customer> findById(Integer integer);

    long count();

    Customer findByUsernameContaining(String username);

    List<Customer> findByFullnameContaining(String fullname);

    Customer findByUsername(String username);

    Customer findById(int id);
}
