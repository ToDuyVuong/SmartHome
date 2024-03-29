package vn.smarthome.controller.customer;


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
import vn.smarthome.loginfactory.LoginFactory;
import vn.smarthome.loginfactory.RoleType;
import vn.smarthome.entity.Customer;
import vn.smarthome.model.CustomerModel;
import vn.smarthome.service.ILoginService;
import vn.smarthome.service.impl.CustomerLoginImpl;

import java.util.Objects;


@Controller
@RequestMapping("")
@SessionAttributes("user")
public class LoginController {
    @Autowired
    CustomerLoginImpl iLoginServiceCustomer;

    // Vao trang login
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String Login(ModelMap model, HttpServletRequest request) {
        model.addAttribute("message", "Nhập tài khoản và mật khẩu.");
        // Get the current URL
        String currentUrl = request.getRequestURI();
        System.out.println("currentUrl = " + currentUrl);

        return "customer/login";
    }

    // Hoat dong login
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String Login(ModelMap model, HttpSession session, @Valid @ModelAttribute("us") CustomerModel us,
                        BindingResult result, HttpServletRequest request, @RequestParam("username") String userName,
                        @RequestParam("password") String passWord, HttpServletRequest req) {

        // xử lý yêu cầu đăng nhập tại đây

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(Objects.equals(username,"admin")) {
            ILoginService iLoginServiceAdmin = LoginFactory.getRole(RoleType.admin);
            try {
                Customer Customer = iLoginServiceAdmin.findByUsername(userName);
                if(passWord.equals(Customer.getPassword())){
                    session.setAttribute("isAdmin", true);
                    return "admin/adminpage";
                } else {
                    model.addAttribute("message", "Sai tài khoản hoặc mật khẩu!");
                    return "customer/login";
                }
            } catch (Exception e) {
                return "customer/login";
            }
        }
        else{
            try {
                Customer Customer = iLoginServiceCustomer.findByUsername(username);

                if (result.hasErrors()) {
                    model.addAttribute("message", result.getAllErrors().toString());
                    return "index";
                }
                if (userName == "" && passWord == "") {
                    model.addAttribute("message", "Chưa nhập tài khoản và mật khẩu!");
                    return "customer/login";
                } else if (userName == "") {
                    model.addAttribute("message", "Chưa nhập tài khoản!");
                    return "customer/login";
                } else if (passWord == "") {
                    model.addAttribute("message", "Chưa nhập mật khẩu!");
                    return "customer/login";
                } else if (Customer == null) {
                    model.addAttribute("message", "Tài khoản không tồn tại!");
                    return "customer/login";
                } else if (password.equals(Customer.getPassword())) {
                    model.addAttribute("message", "Xin chào, đây là trang của tôi!co user" + Customer.getFullname());

                    session.setAttribute("id", Customer.getCustomerId());
                    session.setAttribute("fullname", Customer.getFullname());

                    // nếu sử dụng redirect thì sẻ ko lấy đc biến message.
                    // redirect sẻ trả về đường link map.
                    return "redirect:/"; // = return "index";
                } else {

                    System.out.println("Sai PassWord nhap-" + passWord + "-user-" + Customer.getPassword().toString() + "-");
                    model.addAttribute("message", "Sai mật khẩu!");
                    return "customer/login";
                }
            } catch (Exception e) {
                System.out.println(username);
                return "customer/login";
            }
        }
    }


    // Logout
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public ModelAndView logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return new ModelAndView("redirect:/");
    }

}
