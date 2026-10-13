package com.r3sys.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.r3sys.model.Alerts;

public class AlertsDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	 
	 @Transactional //for making transaction with database like insert, delete, update
	 public String addAlerts(Alerts alert) {
	 // insert
		 
     String i = String.valueOf(this.hibernateTemplate.save(alert)); // Safe String version
	 return i;
	 }
	 
	 
	 // get the single data(object)
	 public Alerts getAlerts(int alertId) {
	 Alerts alert = this.hibernateTemplate.get(Alerts.class,alertId);
	 return alert;
	 }
	 
	 
	 // get all students(all rows)
	 public List<Alerts> getAllAlerts() {
	 List<Alerts> alerts = this.hibernateTemplate.loadAll(Alerts.class);
	 return alerts;
	 }
	 
	 
	 // deleting the data
	 @Transactional //for making transaction with database like insert, delete, update
	 public void deleteAlert(int alertId) {
	 Alerts alert = this.hibernateTemplate.get(Alerts.class, alertId);
	 this.hibernateTemplate.delete(alert);
	 }
	 
	 
	 // updating data...
	 @Transactional //for making transaction with database like insert, delete, update
	 public void updateAlert(Alerts alert) {
	 this.hibernateTemplate.update(alert);
	 }
	 
	 
	 public HibernateTemplate getHibernateTemplate() {
	 return hibernateTemplate;
	 }
	 
	 
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
	 this.hibernateTemplate = hibernateTemplate;
	 }
}
