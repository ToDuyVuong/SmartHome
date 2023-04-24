package vn.smarthome.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vn.smarthome.entity.Product;
import vn.smarthome.service.IProductService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    IProductService productService;

    @RequestMapping("/detail/{productId}")
    public String productDetail(ModelMap model, @PathVariable("productId") Integer productId,
                                HttpServletRequest request){

        System.out.println("aaaa="+ productId);
//
        Product product = productService.findById(productId).get();
//
        model.addAttribute("product", product);


        return "customer/productdetail";
    }

    @RequestMapping("/list")
    public String productList(ModelMap model, HttpServletRequest request){

        List<Product> products = productService.findAll();
        model.addAttribute("products", products);

        return "customer/productlist";
    }

    @RequestMapping("/search/{txt}")
    public String productCart(ModelMap model, @PathVariable("txt") String txt,  HttpServletRequest request){

        System.out.println("aaaa="+ txt);

        return "customer/searchproduct";
    }

    @GetMapping(path = "/search")
    public String searchProduct(@RequestParam("keyword") String keyword, Model model) {
        List<Product> searchResult = productService.findByNameContaining(keyword);
        model.addAttribute("products", searchResult);
        return "/customer/productlist";
    }

}
