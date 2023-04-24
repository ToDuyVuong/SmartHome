package vn.smarthome.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import vn.smarthome.entity.OrderItem;
import vn.smarthome.repository.OrderItemRepository;
import vn.smarthome.service.IOrderItemService;

import java.util.List;

@Service
public class OrderItemServiceImpl implements IOrderItemService {


    @Autowired
    OrderItemRepository orderItemRepository;

    public OrderItemServiceImpl(OrderItemRepository orderItemRepository) {
        this.orderItemRepository = orderItemRepository;
    }

    @Override
    public List<OrderItem> findAll() {
        return orderItemRepository.findAll();
    }

    @Override
    public List<OrderItem> findAll(Sort sort) {
        return orderItemRepository.findAll(sort);
    }

    @Override
    public List<OrderItem> findAllById(Iterable<Integer> oderItemIds) {
        return orderItemRepository.findAllById(oderItemIds);
    }

    @Override
    public long count() {
        return orderItemRepository.count();
    }

    @Override
    public void deleteById(Integer orderItemId) {
        orderItemRepository.deleteById(orderItemId);
    }

    @Override
    public void deleteAll() {
        orderItemRepository.deleteAll();
    }

    @Override
    public OrderItem saveOrUpdate(OrderItem orderItem) {
        return orderItemRepository.save(orderItem);
    }

    @Override
    @Query("SELECT c FROM OrderItem c WHERE c.order.orderId = :orderId")
    public List<OrderItem> listOrderItemsByOrderId(int orderId) {
        return orderItemRepository.listOrderItemsByOrderId(orderId);
    }
}

