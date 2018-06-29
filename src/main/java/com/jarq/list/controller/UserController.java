package com.jarq.list.controller;

import com.jarq.list.entity.Users;
import com.jarq.list.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    // need to inject user service
    @Autowired
    private UserService userService;

    @GetMapping("/list")
    public String lustUsers(Model theModel) {

        // get users from dao
        List<Users> theUsers = userService.getUsers();

        // add the users to the model
        theModel.addAttribute("users", theUsers);

        return "home";
    }
}
