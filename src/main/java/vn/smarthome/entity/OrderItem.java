package vn.smarthome.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "orderItems")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderItemId;

    @Column(name = "quantity")
    private int quantity;

    @Column(name = "price")
    private Long price;

    // DONE relationship with Product || một orderItem chỉ thuộc về 1 product
    @ManyToOne(targetEntity = Product.class, fetch = FetchType.LAZY, optional = true)
    @JoinColumn(name = "productId", referencedColumnName = "product_id", nullable = false, foreignKey = @ForeignKey(name = "FK_product_orderItem"))
    private Product product;

    // DONE relationship with Order
    @ManyToOne(targetEntity = Order.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "orderId", referencedColumnName = "order_id", nullable = false, foreignKey = @ForeignKey(name = "FK_order_orderItem"))
    private Order order;
}
