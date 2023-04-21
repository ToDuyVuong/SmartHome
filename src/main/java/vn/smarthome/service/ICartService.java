package vn.smarthome.service;

import org.springframework.data.domain.Example;
import vn.smarthome.entity.Cart;

import java.util.List;
import java.util.Optional;

public interface ICartService {

    List<Cart> findAll();

    <S extends Cart> List<S> findAll(Example<S> example);

    <S extends Cart> S save(S entity);

    Optional<Cart> findById(Integer integer);
}
