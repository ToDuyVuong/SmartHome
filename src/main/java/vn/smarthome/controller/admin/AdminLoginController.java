package vn.smarthome.controller.admin;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import vn.smarthome.entity.Customer;
import vn.smarthome.model.CustomerModel;
import vn.smarthome.service.ICustomerService;

import java.util.Objects;


@Controller
@RequestMapping("")
public class AdminLoginController {
    // Vao trang admin
    @RequestMapping(value = {"/admin", "admin"}, method = RequestMethod.GET)
    public String LoginForAdmin(HttpServletRequest request) {
        // Get the current URL
        String currentUrl = request.getRequestURI();
        System.out.println("currentUrl = " + currentUrl);

        return "admin/loginforadmin";
    }

    // Hoat dong login
    @RequestMapping(value = {"/admin", "admin"}, method = RequestMethod.POST)
    public String LoginForAdmin(ModelMap model, HttpServletRequest request) {

        // xử lý yêu cầu đăng nhập tại đây
         String username = request.getParameter("username");
         String password = request.getParameter("password");
        try {
            if (Objects.equals(username, "admin") && Objects.equals(password, "admin")) {
                return "admin/listcategory";
            } else {
                model.addAttribute("message", "Sai tài khoản hoặc mật khẩu!");
                return "admin/loginforadmin";
            }
        } catch (Exception e) {
            return "admin/loginforadmin";
        }
    }
}
