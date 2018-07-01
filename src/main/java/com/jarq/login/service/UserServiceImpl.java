package com.jarq.login.service;

import java.util.List;

import com.jarq.login.entity.Authorities;
import com.jarq.login.entity.Dictionary;
import com.jarq.login.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jarq.login.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    // user service forward methods to userDAO
    @Override
    @Transactional
    public void saveUser(Users theUser) {

        userDAO.saveUser(theUser);
    }

    @Override
    @Transactional
    public void saveUserAuthority(Authorities theAuthority) {

        userDAO.saveUserAuthority(theAuthority);
    }

    @Override
    @Transactional
    public Users getUser(String theId) {

        return userDAO.getUser(theId);
    }

    @Override
    @Transactional
    public void deleteUser(String theId) {

        userDAO.deleteUser(theId);
    }

    @Override
    @Transactional
    public void deleteUserAuthority(String theId) {

        userDAO.deleteUserAuthority(theId);
    }

    @Override
    @Transactional
    public List<Dictionary> getDictionary() {
        return userDAO.getDictionary();
    }

    @Override
    @Transactional
    public Boolean doesUsernameExist(String sourceUsername) {

        return userDAO.doesUsernameExist(sourceUsername);
    }

    @Override
    @Transactional
    public Boolean doesEmailExist(String sourceEmail) {

        return userDAO.doesEmailExist(sourceEmail);
    }

    @Override
    @Transactional
    public List<Users> getUsers() {
        return userDAO.getUsers();
    }
}
