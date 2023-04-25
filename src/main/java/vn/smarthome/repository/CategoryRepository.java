package vn.smarthome.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.smarthome.entity.Category;
import vn.smarthome.entity.Product;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
    Category findById(int id);
    List<Category> findByNameContaining(String name);
    List<Category> findByName(String name);
}
