package com.jarq.login.controller;

import java.util.List;

import com.jarq.login.entity.Authorities;
import com.jarq.login.entity.Dictionary;
import com.jarq.login.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jarq.login.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

    // need to inject customer service
    @Autowired
    private UserService userService;

    @GetMapping("/list")
    public String listUsers(Model theModel) {

        // get users from dao
        List<Users> theUsers = userService.getUsers();

        // add the users to the model
        theModel.addAttribute("users", theUsers);

        return "list-users";
    }

    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model theModel) {

        // create model attribute to bind form data
        Users theUser = new Users();
        Authorities theAuthority = new Authorities();

        // add User to model
        theModel.addAttribute("user", theUser);
        theModel.addAttribute("authority", theAuthority);

        // get dictionary from service
        List<Dictionary> theDictionary = userService.getDictionary();

        // set dictionary as a model
        theModel.addAttribute("dictionary", theDictionary);

        return "user-form";
    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("userId") String theId, Model theModel) {

        // get the user from service
        Users theUser = userService.getUser(theId);
        Authorities theAuthority = new Authorities();

        // set user as a model attribute to pre-populate the form
        theModel.addAttribute("user", theUser);
        theModel.addAttribute("authority", theAuthority);

        // get dictionary from service
        List<Dictionary> theDictionary = userService.getDictionary();

        // set dictionary as a model
        theModel.addAttribute("dictionary", theDictionary);

        // send over to form
        return "user-form";
    }

    @GetMapping("/showFormDetails")
    public String showFormForDetails(@RequestParam("userId") String theId, Model theModel) {

        // get the user from service
        Users theUser = userService.getUser(theId);

        // set user as a model attribute to pre-populate the form
        theModel.addAttribute("user", theUser);

        // get dictionary from service
        List<Dictionary> theDictionary = userService.getDictionary();

        // set dictionary as a model
        theModel.addAttribute("dictionary", theDictionary);

        // send over to form
        return "user-details";
    }

    @PostMapping("/saveUser")
    public String saveUser(@ModelAttribute("user") Users theUser,
                           @ModelAttribute("authority") Authorities theAuthority) {

        // save the user using service
        userService.saveUser(theUser);
        userService.saveUser(theAuthority);

        return "redirect:/user/list";
    }

    @GetMapping("/delete")
    public String deleteUser(@RequestParam("userId") String theId) {

        // delete the user
        userService.deleteUserAuthority(theId);
        userService.deleteUser(theId);

        return "redirect:/user/list";
    }

}
