package com.jarq.login.service;

import java.util.List;

import com.jarq.login.entity.Customer;
import com.jarq.login.entity.Dictionary;

public interface CustomerService {

    public List<Customer> getCustomers();

    public void saveCustomer(Customer theCustomer);

    public Customer getCustomer(int theId);

    public void deleteCustomer(int theId);

    public List<Dictionary> getDictionary();
}
