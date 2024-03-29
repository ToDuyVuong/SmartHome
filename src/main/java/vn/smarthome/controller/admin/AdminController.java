package vn.smarthome.controller.admin;

import org.apache.catalina.User;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import vn.smarthome.entity.*;
import vn.smarthome.model.*;
import vn.smarthome.service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
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
    @Autowired
    IOrderItemService orderItemService;

    @RequestMapping("/listCategory")
    public ModelAndView ListCategory(ModelMap model, HttpServletRequest request) {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null) {
            return new ModelAndView("redirect:/login");
        }

        List<Category> categories = categoryService.findAll();

        if (!categories.isEmpty()) {
            CategoryModel categoryModel = new CategoryModel();
            BeanUtils.copyProperties(categories, categoryModel);
            model.addAttribute("listP", categories);
        }
        return new ModelAndView("admin/listcategory", model);
    }

    @RequestMapping(value = "/editCategory/{categoryId}")
    public ModelAndView editCategory(ModelMap model, HttpServletRequest request, @PathVariable("categoryId") Integer categoryId) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null) {
            return new ModelAndView("redirect:/login");
        }
        Optional<Category> category = categoryService.findById(categoryId);

        if (category.isPresent()) {
            Category entity = category.get();
            CategoryModel categoryModel = new CategoryModel();
            BeanUtils.copyProperties(entity, categoryModel);
            model.addAttribute("cate", categoryModel);
        }
        return new ModelAndView("/admin/editcategory", model);
    }

    @RequestMapping(value = "/editCategory/saveEditCategory", method = RequestMethod.POST)
    public ModelAndView saveEditCategory(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null) {
            return new ModelAndView("redirect:/login");
        }
        String id = request.getParameter("idcate");
        String name = request.getParameter("namecate");
        String description = request.getParameter("descriptioncate");
        Optional<Category> category = categoryService.findById(Integer.valueOf(id));
        if (category.isPresent()) {
            Category updatedCategory = category.get();
            if(!name.isEmpty()){
                updatedCategory.setName(name);
            }
            if(!description.isEmpty()){
                updatedCategory.setDescription(description);
            }
            categoryService.saveOrUpdate(updatedCategory);
        }
        return new ModelAndView("redirect:/admin/listCategory", model);
    }
    @RequestMapping(value = "/addCategory", method = RequestMethod.GET)
    public ModelAndView addCategory(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null) {
            return new ModelAndView("redirect:/login");
        }
        return new ModelAndView("/admin/addcategory") ;
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
    public ModelAndView listProduct(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null) {
            return new ModelAndView("redirect:/login");
        }
        List<Product> products = productService.findAll();
        List<Category> categories = categoryService.findAll();

        if (!products.isEmpty()) {
            ProductModel productModel = new ProductModel();
            BeanUtils.copyProperties(products, productModel);
            model.addAttribute("list", products);
            model.addAttribute("categories", categories);
        }
        return new ModelAndView("/admin/listproduct", model);
    }

    @RequestMapping("/listProduct/{cate_id}")
    public ModelAndView listProductByCate (ModelMap model, @PathVariable("cate_id") Integer cate_id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null) {
            return new ModelAndView("redirect:/login");
        }
        List<Product> products = productService.findByCategoryCategoryId(cate_id);
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories", categories);
        if (!products.isEmpty()) {
            ProductModel productModel = new ProductModel();
            BeanUtils.copyProperties(products, productModel);
            model.addAttribute("list", products);
        }
        return new ModelAndView("/admin/listproduct", model);
    }

    @RequestMapping("/listCustomer")
    public ModelAndView listCustomer(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null) {
            return new ModelAndView("redirect:/login");
        }
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
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null) {
            return new ModelAndView("redirect:/login");
        }
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

    @RequestMapping(value = "/editProduct/{productId}")
    public ModelAndView editProduct(ModelMap model, HttpServletRequest request, @PathVariable("productId") Integer productId) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null) {
            return new ModelAndView("redirect:/login");
        }
        Optional<Product> product = productService.findById(productId);

        if (product.isPresent()) {
            Product entity = product.get();
            ProductModel productModel = new ProductModel();
            BeanUtils.copyProperties(entity, productModel);
            model.addAttribute("product", productModel);
        }
        return new ModelAndView("/admin/editproduct", model);
    }

    @RequestMapping(value = "/editProduct/saveEditProduct", method = RequestMethod.POST)
    public ModelAndView saveEditProduct(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null) {
            return new ModelAndView("redirect:/login");
        }

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
            if (!name.isEmpty()) {
                updatedProduct.setName(name);
            }
            if (!description.isEmpty()) {
                updatedProduct.setDescription(description);
            }
            if (!image.isEmpty()) {
                updatedProduct.setImage(image);
            }
            if (!price.isEmpty()) {
                updatedProduct.setPrice(Long.parseLong(price));
            }
            if (!quantity.isEmpty()) {
                updatedProduct.setQuantity(Integer.parseInt(quantity));
            }
            if (!categoryId.isEmpty()) {
                Optional<Category> category = categoryService.findById(Integer.valueOf(categoryId));
                if (category.isPresent()) {
                    Category categoryObj = category.get();
                    updatedProduct.setCategory(categoryObj);
                }
            }

            productService.saveOrUpdate(updatedProduct);
        }

        return new ModelAndView("redirect:/admin/listProduct", model);
    }

    @RequestMapping("/deleteProduct/{productId}")
    public ModelAndView deleteProduct(ModelMap model, @PathVariable("productId") Integer productId, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null) {
            return new ModelAndView("redirect:/login");
        }
        Optional<Product> opt = productService.findById(productId);

        if (opt.isPresent()) {

            productService.updateProductQuantityToZeroById(productId);

        }
        return new ModelAndView("redirect:/admin/listProduct", model);
    }


    @RequestMapping("/listOrder")
    public ModelAndView listOrder(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null) {
            return new ModelAndView("redirect:/login");
        }
        List<Order> orders = orderService.findAll();

        if (!orders.isEmpty()) {
            OrderModel orderModel = new OrderModel();
            BeanUtils.copyProperties(orders, orderModel);
            model.addAttribute("listO", orders);
        }
        return new ModelAndView("/admin/listorder", model);
    }

    @RequestMapping(value = {"/orderDetail/{orderId}"})
    public ModelAndView orderDetail(ModelMap model, @PathVariable("orderId") Integer orderId, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null) {
            return new ModelAndView("redirect:/login");
        }
        List<OrderItem> orderItems = orderItemService.listOrderItemsByOrderId(orderId);

        Optional<Order> orders = orderService.findById(orderId);
        List<Integer> productIds = orderItemService.listProductIdByOrderId(orderId);
        List<Product> products = new ArrayList<>();
        for (Integer product : productIds) {
            Optional<Product> pro = productService.findById(product);
            products.add(pro.get());
        }

        if (!orderItems.isEmpty()) {
            OrderModel orderModel = new OrderModel();
            OrderItemModel orderItemModel = new OrderItemModel();
            ProductModel productModel = new ProductModel();
            BeanUtils.copyProperties(orders, orderModel);
            BeanUtils.copyProperties(orderItems, orderItemModel);
            BeanUtils.copyProperties(products, productModel);

            model.addAttribute("listO", orders.get());
            model.addAttribute("listOI", orderItems);
            model.addAttribute("listP", products);
        }

        return new ModelAndView("/admin/detailorder", model);
    }

    @RequestMapping(value = {"/listOrder/{orderId}"})
    public ModelAndView changeStatus(ModelMap model, @PathVariable("orderId") Integer orderId, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null) {
            return new ModelAndView("redirect:/login");
        }
        Optional<Order> orders = orderService.findById(orderId);

        Order updatedOrder = null;
        if (orders.isPresent()) {
            updatedOrder = orders.get();
            Order.Status value = updatedOrder.getStatus();
            if(value.ordinal() < 3)
                updatedOrder.setStatus(Order.Status.values()[value.ordinal() +1]);
            if(value.ordinal() == 3)
                updatedOrder.setStatus(Order.Status.values()[value.ordinal() -3]);
        }
        orderService.saveOrUpdate(updatedOrder);
        return new ModelAndView("redirect:/admin/listOrder", model);
    }
}
