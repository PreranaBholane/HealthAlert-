package com.r3sys.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="cases")
@Component
public class Cases {
	@Id 
	int id;
	long doctorContact;
	String diseaseName; 
	String location;
	String patientName;
	Date reportDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public long getDoctorContact() {
		return doctorContact;
	}
	public void setDoctorContact(long doctorContact) {
		this.doctorContact = doctorContact;
	}
	public String getDiseaseName() {
		return diseaseName;
	}
	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public Cases(int id, long doctorContact, String diseaseName, String location, String patientName, Date reportDate) {
		super();
		this.id = id;
		this.doctorContact = doctorContact;
		this.diseaseName = diseaseName;
		this.location = location;
		this.patientName = patientName;
		this.reportDate = reportDate;
	}
	public Cases() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Cases [id=" + id + ", doctorContact=" + doctorContact + ", diseaseName=" + diseaseName + ", location="
				+ location + ", patientName=" + patientName + ", reportDate=" + reportDate + "]";
	}  
	
	

}
