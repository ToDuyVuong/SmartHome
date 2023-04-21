package vn.smarthome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {
//    @Autowired
//    IProductService productService;
    @RequestMapping(value = {"", "home"}, method = RequestMethod.GET)
    public String StartHonme(/*ModelMap modelMap*/)
    {


//        List<ProductEntity> productEntityList = new ArrayList<>();
//
//        productEntityList = productService.findAll();
//
//        for (ProductEntity productEntity : productEntityList) {
//            System.out.println(productEntity.getProductName());
//        }
//
//        modelMap.addAttribute("productList", productEntityList);



        return "index";
    }

}
