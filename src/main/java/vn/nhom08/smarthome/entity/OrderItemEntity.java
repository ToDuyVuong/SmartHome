package vn.nhom08.smarthome.entity;



import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "orderitems")
public class OrderItemEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name= "orderitemid")
    private Integer orderItemId;

    @Column(name= "quantity")
    private Integer quantity;

    @Column(name= "price")
    private Long price;

//    // Khi nào có Product thì sẻ mở liên kết ra
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "productid")
//    private ProductEntity products;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "orderid")
    private OrderEntity orders;
}