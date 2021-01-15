/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.finalProjectWEPR.dao;

import com.learn.finalProjectWEPR.entities.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author HoangHieu
 */
public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    // saves the category to db
    public int saveCategory(Category cat)
    {
        Session session = this.factory.openSession();
        
        Transaction tx = session.beginTransaction();
        int catId = (int) session.save(cat);
        tx.commit();
        session.close();
        return catId;
    }
}
