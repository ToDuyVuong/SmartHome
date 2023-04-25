package vn.smarthome.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.List;

@Entity
@Table(name = "orders")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, name = "order_id")

    private Integer orderId;

    @Column(name = "orderDate")
    private String date;

    @Column(name = "shipTo")
    private String shipTo;

    @Column(name= "totalPrice")
    private Long totalPrice;

    @Column(name = "note")
    private String note;

    @Column(name = "address")
    private String address;

    @Column(name = "phone")
    private String phone;

    @Column(name = "totalQuantity")
    private Integer totalQuantity;

    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private Status status;

    // DONE relationship with OrderItem
    @OneToMany(targetEntity = OrderItem.class, fetch = FetchType.LAZY, mappedBy = "order")
    @JsonIgnore
    private List<OrderItem> orderItems;

    // DONE relationship with Customer
    @ManyToOne(targetEntity = Customer.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "customerId", referencedColumnName = "customer_id", foreignKey = @ForeignKey(name = "FK_customer_order"))
    private Customer customer;

//    @PrePersist
//    public void setPurchaseDate() {
//        this.orderDate = LocalDate.now();
//    }

    public enum Status {
        PENDING(0), DELIVERING(1), DELIVERED(2), CANCELED(3);

        private int value;

        private Status(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }
}
