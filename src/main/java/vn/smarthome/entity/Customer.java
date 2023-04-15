package vn.smarthome.entity;
import java.sql.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "customers", uniqueConstraints = { 
    @UniqueConstraint(name = "UQ_Customer_username" ,columnNames = "username"),
    @UniqueConstraint(name = "UQ_Customer_email" ,columnNames = "email"),
    @UniqueConstraint(name = "UQ_Customer_phone" ,columnNames = "phone")
})
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int customer_id;

    @Column(name = "fullname")
    private String fullname;

    @Column(name = "birthday")
    private Date birthday;

    @Column(name = "gender")
    private boolean gender;

    @Column(name = "email")
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "address")
    private String address;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    // relationship with Order
    @OneToMany(targetEntity = Order.class, mappedBy = "customer")
    private List<Order> orders;

    // relationship 1-1 with Cart
    @OneToOne(targetEntity = Cart.class, mappedBy = "customer")
    private Cart cart;
}
