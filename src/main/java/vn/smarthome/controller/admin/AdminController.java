package vn.smarthome.controller.admin;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import vn.smarthome.entity.CartItem;
import vn.smarthome.entity.Category;
import vn.smarthome.entity.Customer;
import vn.smarthome.entity.Product;
import vn.smarthome.model.CategoryModel;
import vn.smarthome.model.CustomerModel;
import vn.smarthome.service.ICategoryService;
import vn.smarthome.service.IProductService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    ICategoryService categoryService;
    @RequestMapping("/listCategory")
    public ModelAndView ListCategory(ModelMap model, HttpServletRequest request) {
        List<Category> categories = categoryService.findAll();

        if (!categories.isEmpty()) {
            CategoryModel categoryModel = new CategoryModel();
            BeanUtils.copyProperties(categories, categoryModel);
            model.addAttribute("listP", categories);
        }
        return new ModelAndView("admin/listcategory", model);
    }
    @RequestMapping("/deleteCategory/{categoryId}")
    public ModelAndView RemoveProductToCart(ModelMap model, @PathVariable("categoryId") Integer categoryId) {
        Optional<Category> opt = categoryService.findById(categoryId);
        if (opt.isPresent()) {
            categoryService.deleteCategoryByCategoryId(categoryId);
        }
        return new ModelAndView("redirect:/admin/listCategory", model);
    }
}
