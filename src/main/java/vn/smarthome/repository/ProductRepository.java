package vn.smarthome.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import vn.smarthome.entity.Order;
import vn.smarthome.entity.Product;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer>{
    Product findById(int id);

    List<Product> findByCategory_CategoryId(int categoryId);


    List<Product> findByNameContaining(String name);
    List<Product> findByName(String name);

    List<Product> findByPrice(Long price);


    List<Product> findByQuantity(int quantity);

    List<Product> findByCategoryCategoryId(Integer categoryId);

    @Query("SELECT p FROM Product p WHERE p.category.categoryId = :id")
    List<Product> listProductByCategoryId(@Param("id") int id);
}
