package vn.nhom08.smarthome.entity;

import java.util.List;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "orders")
public class OrderEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name= "orderid")
    private Integer orderId;

    @Column(name= "amount")
    private Long amount;// số lượng

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id")
    private CustomerEntity customer;

    @OneToMany(mappedBy = "orders", cascade = CascadeType.ALL)
    private List<OrderItemEntity> orderitems;


}