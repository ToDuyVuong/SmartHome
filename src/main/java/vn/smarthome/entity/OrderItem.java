package vn.smarthome.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "order_item")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int orderItemId;

    @Column(name = "quantity")
    private int quantity;

    // relationship with Product
    @ManyToOne(targetEntity = Product.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "productId", referencedColumnName = "product_id", nullable = false, foreignKey = @ForeignKey(name = "FK_product_orderItem"))
    private Product product;

    // relationship with Order
    @ManyToOne(targetEntity = Order.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "orderId", referencedColumnName = "order_id", nullable = false, foreignKey = @ForeignKey(name = "FK_order_orderItem"))
    private Order order;
}
