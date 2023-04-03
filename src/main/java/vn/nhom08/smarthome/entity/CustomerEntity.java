package vn.nhom08.smarthome.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Table(name = "customer")
@NoArgsConstructor
@AllArgsConstructor
public class CustomerEntity {
    @Id
    private Integer customerId;

    private  String customerFullName;
}
