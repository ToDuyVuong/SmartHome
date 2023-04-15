package vn.smarthome.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.smarthome.entity.Order;

public interface OrderRepository extends JpaRepository<Order, Long>{
    
}
