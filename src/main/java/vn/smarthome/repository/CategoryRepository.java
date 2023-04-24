package vn.smarthome.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.smarthome.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
    
}
