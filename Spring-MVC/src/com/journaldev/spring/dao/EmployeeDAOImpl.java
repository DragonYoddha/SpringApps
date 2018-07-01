package com.journaldev.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.journaldev.spring.model.Employee;

public class EmployeeDAOImpl implements EmployeeDAO {

	private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    @SuppressWarnings("unchecked")
	@Override
	public List<Employee> list() {
		Session session = this.sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		List<Employee> personList = session.createQuery("from Employee").list();
		tx.commit();
		session.close();
		return personList;
	}

}
