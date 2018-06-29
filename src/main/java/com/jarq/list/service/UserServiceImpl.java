package com.jarq.list.service;

import com.jarq.list.dao.UserDAO;
import com.jarq.list.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    @Transactional
    public List<Users> getUsers() {
        return userDAO.getUsers();
    }
}
