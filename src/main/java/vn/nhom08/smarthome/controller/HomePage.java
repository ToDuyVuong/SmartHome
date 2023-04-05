package vn.nhom08.smarthome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
//@RequestMapping("/")
public class HomePage {

    @RequestMapping(value = {"", "home"}, method = RequestMethod.GET)
    public String Index(){
        return "index";
    }
}
