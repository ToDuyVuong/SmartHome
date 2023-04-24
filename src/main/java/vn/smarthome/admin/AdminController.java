package vn.smarthome.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
    //    @Autowired
//    IProductService productService;
    @RequestMapping(value = {"/admin", "admin"}, method = RequestMethod.GET)
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



        return "admin/addcategory";
    }

}
