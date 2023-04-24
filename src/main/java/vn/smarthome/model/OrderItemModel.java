package vn.smarthome.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.smarthome.entity.Order;
import vn.smarthome.entity.Product;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderItemModel {
    private Integer orderItemId;

    private int quantity;

    private Long price;


    // relationship with Product
    private Product product;

    // relationship with Order
    private Order order;
}
