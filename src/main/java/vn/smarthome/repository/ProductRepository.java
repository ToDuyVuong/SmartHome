package vn.smarthome.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.smarthome.entity.Customer;
import vn.smarthome.entity.Product;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer>{
    Product findById(int id);
    List<Product> findByCategoryId(int categoryId);

    List<Product> findByNameContaining(String name);
    List<Product> findByName(String name);

    List<Product> findByPrice(Long price);


    List<Product> findByQuantity(int quantity);


}
