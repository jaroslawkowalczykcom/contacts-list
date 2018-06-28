package com.jarq.login.controller;

import java.util.List;

import com.jarq.login.entity.Customer;
import com.jarq.login.entity.Dictionary;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jarq.login.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    // need to inject customer service
    @Autowired
    private CustomerService customerService;

    @GetMapping("/list")
    public String listCustomers(Model theModel) {

        // get customers from dao
        List<Customer> theCustomers = customerService.getCustomers();

        // add the customers to the model
        theModel.addAttribute("customers", theCustomers);

        return "list-customers";
    }

    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model theModel) {

        // create model attribute to bind form data
        Customer theCustomer = new Customer();

        // add Customer to model
        theModel.addAttribute("customer", theCustomer);

        // get dictionary from service
        List<Dictionary> theDictionary = customerService.getDictionary();

        // set dictionary as a model
        theModel.addAttribute("dictionary", theDictionary);
        System.out.println(theDictionary);
        return "customer-form";
    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("customerId") int theId, Model theModel) {

        // get the customer from service
        Customer theCustomer = customerService.getCustomer(theId);

        // set customer as a model attribute to pre-populate the form
        theModel.addAttribute("customer", theCustomer);

        // get dictionary from service
        List<Dictionary> theDictionary = customerService.getDictionary();

        // set dictionary as a model
        theModel.addAttribute("dictionary", theDictionary);

        // send over to form
        return "customer-form";
    }

    @GetMapping("/showFormDetails")
    public String showFormForDetails(@RequestParam("customerId") int theId, Model theModel) {

        // get the customer from service
        Customer theCustomer = customerService.getCustomer(theId);

        // set customer as a model attribute to pre-populate the form
        theModel.addAttribute("customer", theCustomer);

        // get dictionary from service
        List<Dictionary> theDictionary = customerService.getDictionary();

        // set dictionary as a model
        theModel.addAttribute("dictionary", theDictionary);

        // send over to form
        return "customer-details";
    }

    @PostMapping("/saveCustomer")
    public String saveUser(@ModelAttribute("customer") Customer theCustomer) {

        // save the customer using service
        customerService.saveCustomer(theCustomer);

        return "redirect:/customer/list";
    }

    @GetMapping("/delete")
    public String deleteCustomer(@RequestParam("customerId") int theId) {

        // delete the customer
        customerService.deleteCustomer(theId);

        return "redirect:/customer/list";
    }

}
