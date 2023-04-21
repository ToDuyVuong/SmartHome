package vn.smarthome.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;
import vn.smarthome.entity.Cart;
import vn.smarthome.repository.CartRepository;
import vn.smarthome.service.ICartService;

import java.util.List;
import java.util.Optional;

@Service
public class CartServiceImpl implements ICartService {

    @Autowired
    CartRepository cartRepository;


    public CartServiceImpl(CartRepository cartRepository) {

        this.cartRepository = cartRepository;
    }

    @Override
    public List<Cart> findAll() {
        return cartRepository.findAll();
    }

    @Override
    public <S extends Cart> List<S> findAll(Example<S> example) {
        return cartRepository.findAll(example);
    }

    @Override
    public <S extends Cart> S save(S entity) {
        return cartRepository.save(entity);
    }

    @Override
    public Optional<Cart> findById(Integer integer) {
        return cartRepository.findById(integer);
    }
}
