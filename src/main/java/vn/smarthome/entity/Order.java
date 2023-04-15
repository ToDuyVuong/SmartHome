package vn.smarthome.entity;

import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "orders")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int order_id;

    @Column(name = "order_date")
    private LocalDate orderDate;

    @Column(name = "ship_to")
    private String shipTo;

    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private Status status;

    // relationship with OrderItem
    @OneToMany(targetEntity = OrderItem.class, fetch = FetchType.LAZY, mappedBy = "order")
    private List<OrderItem> orderItems;

    // relationship with Customer
    @ManyToOne(targetEntity = Customer.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "customer_id", referencedColumnName = "customer_id", foreignKey = @ForeignKey(name = "FK_customer_order"))
    private Customer customer;

    @PrePersist
    public void setPurchaseDate() {
        this.orderDate = LocalDate.now();
    }

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
