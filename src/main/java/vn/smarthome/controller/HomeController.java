package vn.smarthome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
//    @Autowired
//    IProductService productService;
    @RequestMapping(value = {"", "home"}, method = RequestMethod.GET)
    public String StartHome(/*ModelMap modelMap*/)
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
