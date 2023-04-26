package vn.smarthome.controller.admin;

import org.apache.catalina.User;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import vn.smarthome.entity.*;
import vn.smarthome.model.CategoryModel;
import vn.smarthome.model.CustomerModel;
import vn.smarthome.model.ProductModel;
import vn.smarthome.service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    ICategoryService categoryService;
    @Autowired
    IProductService productService;
    @Autowired
    ICustomerService customerService;
    @Autowired
    ICartService cartService;
    @Autowired
    IOrderService orderService;
    @RequestMapping("/listCategory")
    public ModelAndView ListCategory(ModelMap model) {
        List<Category> categories = categoryService.findAll();

        if (!categories.isEmpty()) {
            CategoryModel categoryModel = new CategoryModel();
            BeanUtils.copyProperties(categories, categoryModel);
            model.addAttribute("listP", categories);
        }
        return new ModelAndView("admin/listcategory", model);
    }

    @RequestMapping("/deleteCategory/{categoryId}")
    public ModelAndView deleteCategory(ModelMap model, @PathVariable("categoryId") Integer categoryId) {
        Optional<Category> opt = categoryService.findById(categoryId);
        if (opt.isPresent()) {
            categoryService.deleteCategoryByCategoryId(categoryId);
        }
        return new ModelAndView("redirect:/admin/listCategory", model);
    }

    @RequestMapping(value = "/editCategory", method = RequestMethod.POST)
    public ModelAndView editCategory(ModelMap model, HttpServletRequest request) {
        String id = request.getParameter("idcate");
        String name = request.getParameter("namecate");
        String description = request.getParameter("descriptioncate");
        Optional<Category> category = categoryService.findById(Integer.valueOf(id));
        if (category.isPresent()) {
            Category updatedCategory = category.get();
            updatedCategory.setName(name);
            updatedCategory.setDescription(description);
            categoryService.saveOrUpdate(updatedCategory);
//            // set success message in the request attribute
//            request.setAttribute("successMessage", "Category updated successfully.");
//        } else {
//            request.setAttribute("errorMessage", "Category not found.");
        }
        return new ModelAndView("redirect:/admin/listcategory", model);
    }
    @RequestMapping(value = "/addCategory", method = RequestMethod.GET)
    public String addCategory() {
        return "/admin/addcategory";
    }
    @RequestMapping(value = "/addCategory", method = RequestMethod.POST)
    public ModelAndView addCategory(ModelMap model, HttpServletRequest request) {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        Category newCategory = new Category();
        newCategory.setName(name);
        newCategory.setDescription(description);
        categoryService.saveOrUpdate(newCategory);
        return new ModelAndView("redirect:/admin/addCategory", model);
    }

    @RequestMapping("/listProduct")
    public ModelAndView listProduct(ModelMap model) {
        List<Product> products = productService.findAll();

        if (!products.isEmpty()) {
            ProductModel productModel = new ProductModel();
            BeanUtils.copyProperties(products, productModel);
            model.addAttribute("list", products);
        }
        return new ModelAndView("/admin/listproduct", model);
    }

    @RequestMapping("/listCustomer")
    public ModelAndView listCustomer(ModelMap model) {
        List<Customer> customers = customerService.findAll();

        if (!customers.isEmpty()) {
            CustomerModel customerModel = new CustomerModel();
            BeanUtils.copyProperties(customers, customerModel);
            model.addAttribute("listC", customers);
        }
        return new ModelAndView("/admin/customer", model);
    }

    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    public ModelAndView addProduct(ModelMap model, HttpServletRequest request) {
        String name = request.getParameter("name_add");
        String description = request.getParameter("description_add");
        String image = request.getParameter("image_add");
        String price = request.getParameter("price_add");
        String quantity = request.getParameter("quantity_add");
        String category_id = request.getParameter("categoryid_add");

        // Create a new Product object
        Product newProduct = new Product();
        newProduct.setName(name);
        newProduct.setDescription(description);
        newProduct.setImage(image);
        newProduct.setPrice(Long.parseLong(price));
        newProduct.setQuantity(Integer.parseInt(quantity));

        // Find the Category object with the given ID
        Optional<Category> category = categoryService.findById(Integer.valueOf(category_id));

        if (category.isPresent()) {
            Category categoryObj = category.get();
            newProduct.setCategory(categoryObj);
        }

        productService.saveOrUpdate(newProduct);

        return new ModelAndView("redirect:/admin/listProduct", model);
    }

    @RequestMapping(value = "/editProduct", method = RequestMethod.POST)
    public ModelAndView editProduct(ModelMap model, HttpServletRequest request) {

        String productId = request.getParameter("id_edit");
        String name = request.getParameter("name_edit");
        String description = request.getParameter("description_edit");
        String image = request.getParameter("image_edit");
        String price = request.getParameter("price_edit");
        String quantity = request.getParameter("quantity_edit");
        String categoryId = request.getParameter("categoryid_edit");

        Optional<Product> product = productService.findById(Integer.valueOf(productId));

        if (product.isPresent()) {
            Product updatedProduct = product.get();
            updatedProduct.setName(name);
            updatedProduct.setDescription(description);
            updatedProduct.setImage(image);
            updatedProduct.setPrice(Long.parseLong(price));
            updatedProduct.setQuantity(Integer.parseInt(quantity));

            Optional<Category> category = categoryService.findById(Integer.valueOf(categoryId));
            if (category.isPresent()) {
                Category categoryObj = category.get();
                updatedProduct.setCategory(categoryObj);
            }

            productService.saveOrUpdate(updatedProduct);
        }

        return new ModelAndView("redirect:/admin/listProduct", model);
    }

    @RequestMapping("/deleteProduct/{productId}")
    public ModelAndView deleteProduct(ModelMap model, @PathVariable("productId") Integer productId) {
        Optional<Product> opt = productService.findById(productId);
        if (opt.isPresent()) {
            productService.deleteProductByProductId(productId);
        }
        return new ModelAndView("redirect:/admin/listProduct", model);
    }


    @RequestMapping("/deleteCustomer/{customerId}")
    public ModelAndView deleteCustomer(ModelMap model, @PathVariable("customerId") Integer customerId) {
        Optional<Customer> opt = customerService.findById(customerId);
        // Delete the customer's cart
        Cart cart = cartService.getCartByCustomerId(customerId);
        if (cart != null) {
            cartService.deleteById(cart.getCartId());
        }

        // Delete the customer's orders
        List<Order> orders = orderService.listOrderByCustomerId(customerId);
        if (!orders.isEmpty()) {
            for (Order order : orders) {
                orderService.deleteById(order.getOrderId());
            }
        }
        if (opt.isPresent()) {
            customerService.deleteCustomerByCustomerId(customerId);
        }
        return new ModelAndView("redirect:/admin/listCustomer", model);
    }
}
