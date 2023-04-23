package vn.smarthome.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.smarthome.entity.Cart;
import vn.smarthome.entity.Category;
import vn.smarthome.entity.OrderItem;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductModel {
    private int productId;
    private String name;
    private String description;
    private String image;
    private Long price;
    private int quantity;
    private Category category;
    private List<OrderItem> orderItems;
    private Set<Cart> carts = new HashSet<>();

}
