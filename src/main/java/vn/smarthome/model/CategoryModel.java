package vn.smarthome.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.smarthome.entity.Product;

import java.util.List;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryModel {
    private int categoryId;
    private String name;
    private String description;
    private List<Product> products;
}
