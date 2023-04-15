package vn.smarthome.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.smarthome.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{
    
}
