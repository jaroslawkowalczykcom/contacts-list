package com.jarq.login.service;

import java.util.List;

import com.jarq.login.entity.Authorities;
import com.jarq.login.entity.Dictionary;
import com.jarq.login.entity.Users;

public interface UserService {

    public List<Users> getUsers();

    public Users getUser(String theId);

    public void saveUser(Users theUser);

    public void saveUserAuthority(Authorities theAuthority);

    public void deleteUser(String theId);

    public void deleteUserAuthority(String theId);

    public List<Dictionary> getDictionary();

    public  Boolean doesEmailExist(String sourceEmail);

    public Boolean doesUsernameExist(String sourceUsername);
}
