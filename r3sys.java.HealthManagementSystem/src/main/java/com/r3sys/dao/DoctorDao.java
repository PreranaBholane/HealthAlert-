package com.r3sys.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import com.r3sys.model.Doctor;
public class DoctorDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	 
	 @Transactional //for making transaction with database like insert, delete, update
	 public long addDoctor(Doctor doctor) {
	 // insert
	 Long i = (Long) this.hibernateTemplate.save(doctor);
	 return i;
	 }
	 
	 
	 // get the single data(object)
	 public Doctor getDoctor(long DoctorContact) {
	 Doctor doctor = this.hibernateTemplate.get(Doctor.class, DoctorContact);
	 return doctor;
	 }
	 
	 
	 // get all students(all rows)
	 public List<Doctor> getAllDoctors() {
	 List<Doctor> doctors = this.hibernateTemplate.loadAll(Doctor.class);
	 return doctors;
	 }
	 
	 
	 // deleting the data
	 @Transactional //for making transaction with database like insert, delete, update
	 public void deleteDoctor(long doctorContact) {
	 Doctor doctor = this.hibernateTemplate.get(Doctor.class, doctorContact);
	 this.hibernateTemplate.delete(doctor);
	 }
	 
	 
	 // updating data...
	 @Transactional //for making transaction with database like insert, delete, update
	 public void updateDoctor(Doctor doctor) {
	 this.hibernateTemplate.update(doctor);
	 }
	 
	 
	 public HibernateTemplate getHibernateTemplate() {
	 return hibernateTemplate;
	 }
	 
	 
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
	 this.hibernateTemplate = hibernateTemplate;
	 }
}
