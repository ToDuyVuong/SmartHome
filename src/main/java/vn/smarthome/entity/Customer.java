package vn.smarthome.entity;
import java.sql.Date;
import java.util.List;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

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
    @Column(nullable = false, name = "customer_id")
    private int customerId;

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
