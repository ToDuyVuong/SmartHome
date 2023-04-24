package vn.smarthome.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.smarthome.entity.Cart;
import vn.smarthome.entity.Product;



@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItemModel {
    private Integer cartItemId;

    private int quantity;

    private Product products;

    private Cart cart;
}
