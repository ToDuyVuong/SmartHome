package vn.smarthome.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "carts")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, name = "cart_id")
    private Integer cartId;

    @Column(name = "quantity")
    private int quantity;

    @Column(nullable = false, name = "totalPrice")
    private int totalPrice;

    // DONE relationship with Product
    @ManyToMany(fetch = FetchType.LAZY, targetEntity = Product.class)
    @JsonIgnore
    @JoinTable(name = "cart_product",
            joinColumns = @JoinColumn(name = "cartId", referencedColumnName = "cart_id", nullable = false, foreignKey = @ForeignKey(name = "FK_cartId")),
            inverseJoinColumns = @JoinColumn(name = "productId", referencedColumnName = "product_id", nullable = false, foreignKey = @ForeignKey(name = "FK_productId"))
    )
    private List<Product> products;

    // DONE relationship with Customer
    @OneToOne(fetch = FetchType.LAZY, optional = false, targetEntity = Customer.class)
    @JoinColumn(name = "customerId", referencedColumnName = "customer_id", nullable = false, foreignKey = @ForeignKey(name = "FK_customer_cart"))
    private Customer customer;
}
