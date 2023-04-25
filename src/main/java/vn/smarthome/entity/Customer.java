package vn.smarthome.entity;

import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
    @Column(name = "customer_id")
    private Integer customerId;

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

    // DONE relationship with Order || 1 customer có thể có nhiều order
    @OneToMany(mappedBy = "customer", targetEntity = Order.class)
    @JsonIgnore
    private List<Order> orders;

    // DONE relationship 1-1 with Cart
    @OneToOne(mappedBy = "customer", fetch = FetchType.LAZY, optional = true)
    private Cart cart;
}
