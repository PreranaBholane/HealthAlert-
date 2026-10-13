package com.r3sys.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.r3sys.model.Cases;

public class CasesDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	 
	 @Transactional //for making transaction with database like insert, delete, update
	 public String addCases(Cases cases) {
	 // insert
		 
     String i = String.valueOf(this.hibernateTemplate.save(cases)); // Safe String version
	 return i;
	 }
	 
	 
	 // get the single data(object)
	 public Cases getCases(long caseId) {
	 Cases cases = this.hibernateTemplate.get(Cases.class,caseId);
	 return cases;
	 }
	 
	 
	 // get all students(all rows)
	 public List<Cases> getAllCases() {
	 List<Cases> cases = this.hibernateTemplate.loadAll(Cases.class);
	 return cases;
	 }
	 
	 
	 // deleting the data
	 @Transactional //for making transaction with database like insert, delete, update
	 public void deleteCases(int caseId) {
	 Cases cases = this.hibernateTemplate.get(Cases.class, caseId);
	 this.hibernateTemplate.delete(cases);
	 }
	 
	 
	 // updating data...
	 @Transactional //for making transaction with database like insert, delete, update
	 public void updateCases(Cases cases) {
	 this.hibernateTemplate.update(cases);
	 }
	 
	 
	 public HibernateTemplate getHibernateTemplate() {
	 return hibernateTemplate;
	 }
	 
	 
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
	 this.hibernateTemplate = hibernateTemplate;
	 }
}
