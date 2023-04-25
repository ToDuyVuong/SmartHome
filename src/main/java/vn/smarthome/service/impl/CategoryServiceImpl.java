package vn.smarthome.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;
import vn.smarthome.entity.Category;
import vn.smarthome.entity.Product;
import vn.smarthome.repository.CategoryRepository;
import vn.smarthome.repository.ProductRepository;
import vn.smarthome.service.ICategoryService;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImpl implements ICategoryService {
    @Autowired
    private CategoryRepository categoryRepository;

    public CategoryServiceImpl(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public <S extends Category> List<S> findAll(Example<S> example) {
        return categoryRepository.findAll(example);
    }

    @Override
    public <S extends Category> S save(S entity) {
        return categoryRepository.save(entity);
    }

    @Override
    public Optional<Category> findById(Integer integer) {
        return categoryRepository.findById(integer);
    }

    @Override
    public long count() {
        return categoryRepository.count();
    }

    @Override
    public List<Category> findByNameContaining(String name) {
        return categoryRepository.findByNameContaining(name);
    }
    @Override
    public List<Category> findByName(String name) {
        return categoryRepository.findByName(name);
    }

    @Override
    public Category findById(int id) {
        return categoryRepository.findById(id);
    }
}
