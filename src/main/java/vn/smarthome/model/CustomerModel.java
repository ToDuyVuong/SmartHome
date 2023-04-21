package vn.smarthome.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.smarthome.entity.Cart;
import vn.smarthome.entity.Order;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CustomerModel {
    private int customerId;

    private String fullname;

    private Date birthday;

    private boolean gender;

    private String email;

    private String phone;

    private String address;

    private String username;

    private String password;

    // relationship with Order
    private List<Order> orders;

    // relationship 1-1 with Cart
    private Cart cart;

    private String newpassword;

    private String password2;
}
