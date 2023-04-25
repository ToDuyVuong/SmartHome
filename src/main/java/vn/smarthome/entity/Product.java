package vn.smarthome.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.List;

@Entity
@Table(name = "products")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, name = "product_id")

    private Integer productId;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "image")
    private String image;

    @Column(name = "price")
    private Long price;

    @Column(name = "quantity")
    private int quantity;


    // DONE relationship with Category
    @ManyToOne(targetEntity = Category.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "categoryId", referencedColumnName = "category_id", nullable = false, foreignKey = @ForeignKey(name = "FK_category_product"))
    private Category category;

    // DONE relationship with OrderItem
    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY, targetEntity = OrderItem.class)
    @JsonIgnore
    private List<OrderItem> orderItems;

    // DONE relationship with Cart
    @ManyToMany(mappedBy = "products", fetch = FetchType.LAZY, targetEntity = Cart.class)
    private List<Cart> carts;
}
