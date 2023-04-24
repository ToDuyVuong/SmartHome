package vn.smarthome.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.smarthome.entity.Customer;
import vn.smarthome.entity.Order;
import vn.smarthome.entity.OrderItem;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderModel {

    private Integer orderId;

    private String date;

    private String shipTo;

    private Long totalPrice;

    private String note;

    private String address;

    private String phone;

    private Integer totalQuantity;

    private Order.Status status;

    // relationship with OrderItem
    private List<OrderItem> orderItems;

    // relationship with Customer
    private Customer customer;


}
