package vn.smarthome.controller.admin;

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
import vn.smarthome.service.ICategoryService;
import vn.smarthome.service.IProductService;

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
    public ModelAndView RemoveProductToCart(ModelMap model, @PathVariable("categoryId") Integer categoryId) {
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
        // do something in here
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
}
