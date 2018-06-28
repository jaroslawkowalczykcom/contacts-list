package com.jarq.login.dao;

import java.util.List;

import com.jarq.login.entity.Authorities;
import com.jarq.login.entity.Dictionary;
import com.jarq.login.entity.Users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

    // need to inject the session factory

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveUser(Users theUser) {

        // get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // save or update user finally
        currentSession.saveOrUpdate(theUser);
    }

    @Override
    public void saveUser(Authorities theAuthority) {

        // get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // save or update user finally
        currentSession.saveOrUpdate(theAuthority);
    }

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

    @Override
    public Users getUser(String theId) {

        // get the current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // now retrieve/read from database using the primary key
        Users theUser = currentSession.get(Users.class, theId);

        return theUser;
    }

    @Override
    public void deleteUser(String theId) {

        // get the current hiberante session
        Session currentSession = sessionFactory.getCurrentSession();

        // delete object with primary key
        Query theQuery = currentSession.createQuery("delete from Users where id=:userId");
        theQuery.setParameter("userId", theId);

        theQuery.executeUpdate();
    }

    @Override
    public void deleteUserAuthority(String theId) {

        // get the current hiberante session
        Session currentSession = sessionFactory.getCurrentSession();

        // delete object with primary key
        Query theQuery = currentSession.createQuery("delete from Authorities where id=:userId");
        theQuery.setParameter("userId", theId);

        theQuery.executeUpdate();
    }

    @Override
    public List<Dictionary> getDictionary() {

        // get the current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // create a query
        Query<Dictionary> theQuery = currentSession.createQuery("SELECT c FROM Dictionary c", Dictionary.class);

        // execute query and get result list
        List<Dictionary> theDictionary = theQuery.getResultList();

        // return the results
        return theDictionary;
    }

}
