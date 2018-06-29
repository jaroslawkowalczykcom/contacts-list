package com.jarq.list.entity;

import javax.persistence.*;

@Entity
@Table(name = "authorities")
public class Authorities {

    @Id
    @OneToOne
    @JoinColumn(name = "username")
    private Users users;

    @Column(name = "authority")
    private String authority;

    public Authorities() {
    }

    public Authorities(Users users, String authority) {
        this.users = users;
        this.authority = authority;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    @Override
    public String toString() {
        return "Authorities{" +
                "users=" + users +
                ", authority='" + authority + '\'' +
                '}';
    }
}
