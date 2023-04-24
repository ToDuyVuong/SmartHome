package vn.smarthome.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;
import vn.smarthome.entity.Product;
import vn.smarthome.repository.ProductRepository;
import vn.smarthome.service.IProductService;

import java.util.List;
import java.util.Optional;

@Service
public class ProductServiceImpl implements IProductService {
    @Autowired
    private ProductRepository productRepository;

    public ProductServiceImpl(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public <S extends Product> List<S> findAll(Example<S> example) {
        return productRepository.findAll(example);
    }

    @Override
    public <S extends Product> S save(S entity) {
        return productRepository.save(entity);
    }

    @Override
    public Optional<Product> findById(Integer integer) {
        return productRepository.findById(integer);
    }

    @Override
    public long count() {
        return productRepository.count();
    }

    @Override
    public List<Product> findByNameContaining(String name) {
        return productRepository.findByNameContaining(name);
    }
    @Override
    public List<Product> findByName(String name) {
        return productRepository.findByName(name);
    }
    @Override
    public List<Product> findByPrice(Long price) {
        return productRepository.findByPrice(price);
    }

    @Override
    public List<Product> findByCategory_CategoryId(int categoryId) {
        return productRepository.findByCategory_CategoryId(categoryId);
    }


    @Override
    public List<Product> findByQuantity(int quantity) {
        return productRepository.findByQuantity(quantity);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }
}
