package vn.smarthome.controller.customer;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import vn.smarthome.entity.Cart;
import vn.smarthome.entity.CartItem;
import vn.smarthome.entity.Customer;
import vn.smarthome.entity.Product;
import vn.smarthome.model.CartItemModel;
import vn.smarthome.model.CartModel;
import vn.smarthome.model.CustomerModel;
import vn.smarthome.model.ProductModel;
import vn.smarthome.service.ICartItemService;
import vn.smarthome.service.ICartService;
import vn.smarthome.service.ICustomerService;
import vn.smarthome.service.IProductService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("cart")
public class CartController {
   @Autowired
    IProductService productService;
    @Autowired
    ICustomerService customerService;
    @Autowired
    ICartService cartService;
    @Autowired
    ICartItemService cartItemService;


    @GetMapping("")
    public ModelAndView ViewCart(ModelMap model, HttpServletRequest request) {

        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("id");
        if (id == null) {
            // Nếu chưa đăng nhập thì chuyển hướng đến trang đăng nhập
            return new ModelAndView("redirect:/login");
        }

        List<CartItem> cartItemEntities = cartItemService.getCartItemsByCartId(id);
        Optional<Cart> opt = cartService.findById(id);

        if (opt.isPresent()) {
            CartModel cart = new CartModel();
            BeanUtils.copyProperties(opt.get(), cart);
            model.addAttribute("cart", cart);
        } else {
            return new ModelAndView("customer/cart", model);
        }
        if (cartItemEntities != null) {
            List<CartItemModel> cartItemModels = new ArrayList<>();
            for (CartItem cartItemEntity : cartItemEntities) {
                CartItemModel cartItem = new CartItemModel();
                BeanUtils.copyProperties(cartItemEntity, cartItem);
                cartItemModels.add(cartItem);
            }
            model.addAttribute("cartItems", cartItemModels);
        }
        return new ModelAndView("customer/cart", model);
    }


    @RequestMapping("/add/{productId}")
    public ModelAndView AddProductToCart(ModelMap model, @PathVariable("productId") Integer productId, @Valid @ModelAttribute("customer") CustomerModel customerModel,
                                         @Valid @ModelAttribute("products") ProductModel productModel, @Valid @ModelAttribute("cart") CartModel cartModel, HttpServletRequest request, BindingResult result) {

        // Lấy id cart = id customer
        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("id");
        CartItem cartItemEntity = new CartItem();
        Optional<Cart> opt = cartService.findById(id);
        Optional<Product> optProduct = productService.findById(productId);





        if (opt.isPresent() || optProduct.isPresent()) {
            Cart cartEntity = opt.get();
            Product productEntity = optProduct.get();
            try {
                CartItem cartItem = cartItemService.findByCartIdAndProductId(id.intValue(), productEntity.getProductId().intValue());
                // Đã có sản phẩm trong item
                if (cartItem != null) {
                    cartItem.setQuantity(cartItem.getQuantity() + 1);
                    cartItemService.saveCartItem(cartItemEntity);
                }
                //Chưa có sản phẩm trùng trong item
                else {
                    cartItemEntity.setCart(cartEntity);
                    cartItemEntity.setProducts(productEntity);
                    cartItemEntity.setQuantity(1);
                    cartItemService.saveCartItem(cartItemEntity);
                }

                List<CartItem> cartItemEntityList = cartItemService.getCartItemsByCartId(id);
                model.addAttribute("cartItems", cartItemEntityList);
                int totalPrice = 0;
                for (CartItem item : cartItemEntityList) {
                    totalPrice += item.getQuantity() * item.getProducts().getPrice();
                }
                cartEntity.setTotalPrice(totalPrice);
                cartService.save(cartEntity);
                model.addAttribute("cart", cartEntity);
            } catch (Exception e) {
            }
        }
        return new ModelAndView("redirect:/cart", model);
    }


    @RequestMapping("/minus/{productId}")
    public ModelAndView MinusProductToCart(ModelMap model, @PathVariable("productId") Integer productId, @Valid @ModelAttribute("customer") CustomerModel customerModel,
                                         @Valid @ModelAttribute("products") ProductModel productModel, @Valid @ModelAttribute("cart") CartModel cartModel, HttpServletRequest request, BindingResult result) {

        // Lấy id cart = id customer
        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("id");
        CartItem cartItemEntity = new CartItem();
        Optional<Cart> opt = cartService.findById(id);
        Optional<Product> optProduct = productService.findById(productId);

        if (opt.isPresent() || optProduct.isPresent()) {
            Cart cartEntity = opt.get();
            Product productEntity = optProduct.get();
            try {
                CartItem cartItem = cartItemService.findByCartIdAndProductId(id.intValue(), productEntity.getProductId().intValue());
                if (cartItem != null) {
                    if(cartItem.getQuantity() > 1){
                        cartItem.setQuantity(cartItem.getQuantity() - 1);
                        cartItemService.saveCartItem(cartItemEntity);
                    }else {
                        cartItemService.deleteById(cartItem.getCartItemId());
                    }

                }

                List<CartItem> cartItemEntityList = cartItemService.getCartItemsByCartId(id);
                model.addAttribute("cartItems", cartItemEntityList);
                int totalPrice = 0;
                for (CartItem item : cartItemEntityList) {
                    totalPrice += item.getQuantity() * item.getProducts().getPrice();
                }
                cartEntity.setTotalPrice(totalPrice);
                cartService.save(cartEntity);
                model.addAttribute("cart", cartEntity);
            } catch (Exception e) {
            }
        }
        return new ModelAndView("redirect:/cart", model);
    }



    @RequestMapping("/remove/{cartItemId}")
    public ModelAndView RemoveProductToCart(ModelMap model, @PathVariable("cartItemId") Integer cartItemId) {
        CartItem cartItemEntity = new CartItem();
        Optional<CartItem> opt = cartItemService.findById(cartItemId);
        if (opt.isPresent()) {
            cartItemService.deleteById(cartItemId);
        }
        return new ModelAndView("redirect:/cart", model);
    }


    @RequestMapping("/edit")
    public ModelAndView EditProductToCart(ModelMap model, @Valid @ModelAttribute("customer") CustomerModel customerModel,
                                          @Valid @ModelAttribute("products") ProductModel productModel,
                                          @Valid @ModelAttribute("cart") CartModel cartModel,
                                          @Valid @ModelAttribute("cartitem") CartItemModel cartItemModel, BindingResult result) {

        Customer customerEntity = new Customer();
        Cart cartEntity = new Cart();
        CartItem cartItemEntity = new CartItem();
        Product productEntity = new Product();


        return new ModelAndView("redirect:/customer/cart", model);
    }
}

