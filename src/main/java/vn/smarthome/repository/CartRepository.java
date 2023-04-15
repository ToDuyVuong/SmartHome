package vn.smarthome.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.smarthome.entity.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer> {
    
}
