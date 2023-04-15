package vn.smarthome.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.smarthome.entity.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, Integer>{
    
}
