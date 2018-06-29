package com.jarq.list.dao;

import com.jarq.list.entity.Users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Users> getUsers() {

        // get the current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // create a query
        Query<Users> theQuery = currentSession.createQuery("SELECT c FROM Users c", Users.class);

        // execute query and get result list
        List<Users> users = theQuery.getResultList();

        // return the results
        return users;
    }
}
