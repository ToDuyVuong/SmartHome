package vn.nhom08.smarthome.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "cartitem")
public class CartItemEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, name = "cartitemid")
    private Integer cartItemId;

    @Column(nullable = true, name = "quantity")
    private int quantity;

//    // khi nào code Product sẻ mở ra
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "productid")
//    private ProductEntity products;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cartid")
    private CartEntity cart;
}