package vn.smarthome.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.smarthome.entity.CartItem;
import vn.smarthome.entity.Customer;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartModel {
    private Integer cartId;
    private int quantity;
    private int totalPrice;
    private List<CartItem> cartitems;
    private Customer customer;
}
