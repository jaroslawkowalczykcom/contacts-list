package com.jarq.login.entity;

import javax.persistence.*;

@Entity
@Table(name = "dictionary")
public class Dictionary {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(unique = true, name = "word")
    private String word;

    public Dictionary() {
    }

    public Dictionary(String word) {
        this.word = word;
    }

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    @Override
    public String toString() {
        return "Dictionary{" +
                "word='" + word + '\'' +
                '}';
    }
}
