package com.jarq.login.dao;

import java.util.List;

import com.jarq.login.entity.Authorities;
import com.jarq.login.entity.Dictionary;
import com.jarq.login.entity.Users;

public interface UserDAO {

    public List<Users> getUsers();

    public Users getUser(String theId);

    public void saveUser(Users theUser);

    public void saveUser(Authorities theAuthority);

    public void deleteUser(String theId);

    public void deleteUserAuthority(String theId);

    public List<Dictionary> getDictionary();
}
