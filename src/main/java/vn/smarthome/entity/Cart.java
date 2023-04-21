package vn.smarthome.entity;

import java.util.List;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "carts")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cart_id;

    @Column(name = "quantity")
    private int quantity;

    // relationship with Customer
    @OneToOne(targetEntity = Customer.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "customer_id", referencedColumnName = "customer_id", nullable = false, foreignKey = @ForeignKey(name = "FK_customer_cart"))
    private Customer customer;

    // relationship with Product, create a new table "cart_product"
    @ManyToMany(targetEntity = Product.class, fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    @JoinTable(name = "cart_product", joinColumns = @JoinColumn(name = "cart_id", referencedColumnName = "cart_id", nullable = false, foreignKey = @ForeignKey(name = "FK_cart__product")), inverseJoinColumns = @JoinColumn(name = "product_id", referencedColumnName = "product_id", nullable = false, foreignKey = @ForeignKey(name = "FK_product__cart")))
    private List<Product> products;
}
