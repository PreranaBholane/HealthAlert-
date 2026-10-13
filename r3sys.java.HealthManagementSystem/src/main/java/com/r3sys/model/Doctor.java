package com.r3sys.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="Doctor")
@Component
public class Doctor {
	
	@Id
	long doctorContact;
	String doctorName;
	String doctorSpecialization;
	String doctorEmail;
	String doctorpassword;
	String doctorStatus;
	public long getDoctorContact() {
		return doctorContact;
	}
	public void setDoctorContact(long doctorContact) {
		this.doctorContact = doctorContact;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getDoctorSpecialization() {
		return doctorSpecialization;
	}
	public void setDoctorSpecialization(String doctorSpecialization) {
		this.doctorSpecialization = doctorSpecialization;
	}
	public String getDoctorEmail() {
		return doctorEmail;
	}
	public void setDoctorEmail(String doctorEmail) {
		this.doctorEmail = doctorEmail;
	}
	public String getDoctorpassword() {
		return doctorpassword;
	}
	public void setDoctorpassword(String doctorpassword) {
		this.doctorpassword = doctorpassword;
	}
	public String getDoctorStatus() {
		return doctorStatus;
	}
	public void setDoctorStatus(String doctorStatus) {
		this.doctorStatus = doctorStatus;
	}
	public Doctor(long doctorContact, String doctorName, String doctorSpecialization, String doctorEmail,
			String doctorpassword, String doctorStatus) {
		super();
		this.doctorContact = doctorContact;
		this.doctorName = doctorName;
		this.doctorSpecialization = doctorSpecialization;
		this.doctorEmail = doctorEmail;
		this.doctorpassword = doctorpassword;
		this.doctorStatus = doctorStatus;
	}
	public Doctor() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Doctor [doctorContact=" + doctorContact + ", doctorName=" + doctorName + ", doctorSpecialization="
				+ doctorSpecialization + ", doctorEmail=" + doctorEmail + ", doctorpassword=" + doctorpassword
				+ ", doctorStatus=" + doctorStatus + "]";
	}
	
}
