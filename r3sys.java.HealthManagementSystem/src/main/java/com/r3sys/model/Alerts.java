package com.r3sys.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="alerts")
@Component
public class Alerts {
	
	@Id
	int alertId;
	String diseaseName;
	String affectedArea;
	String alertLevel;
	Date dateIssued;
	String doctorContact;
	public int getAlertId() {
		return alertId;
	}
	public void setAlertId(int alertId) {
		this.alertId = alertId;
	}
	public String getDiseaseName() {
		return diseaseName;
	}
	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}
	public String getAffectedArea() {
		return affectedArea;
	}
	public void setAffectedArea(String affectedArea) {
		this.affectedArea = affectedArea;
	}
	public String getAlertLevel() {
		return alertLevel;
	}
	public void setAlertLevel(String alertLevel) {
		this.alertLevel = alertLevel;
	}
	public Date getDateIssued() {
		return dateIssued;
	}
	public void setDateIssued(Date dateIssued) {
		this.dateIssued = dateIssued;
	}
	public String getDoctorContact() {
		return doctorContact;
	}
	public void setDoctorContact(String doctorContact) {
		this.doctorContact = doctorContact;
	}
	public Alerts(int alertId, String diseaseName, String affectedArea, String alertLevel, Date dateIssued,
			String doctorContact) {
		super();
		this.alertId = alertId;
		this.diseaseName = diseaseName;
		this.affectedArea = affectedArea;
		this.alertLevel = alertLevel;
		this.dateIssued = dateIssued;
		this.doctorContact = doctorContact;
	}
	public Alerts() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Alerts [alertId=" + alertId + ", diseaseName=" + diseaseName + ", affectedArea=" + affectedArea
				+ ", alertLevel=" + alertLevel + ", dateIssued=" + dateIssued + ", doctorContact=" + doctorContact
				+ "]";
	}
	
}
