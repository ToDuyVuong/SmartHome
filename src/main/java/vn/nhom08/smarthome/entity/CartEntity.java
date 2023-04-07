package vn.nhom08.smarthome.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;
import java.util.Set;

@Entity
@Table(name = "cart")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartEntity {
    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, name = "cartid")
    private Integer cartId;

    @Column(nullable = false, name = "totalprice")
    private int totalPrice;

    @OneToMany(mappedBy = "cart", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Set<CartItemEntity> cartitems;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id")
    private CustomerEntity customer;

}
