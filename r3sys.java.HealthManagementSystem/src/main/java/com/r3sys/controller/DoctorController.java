package com.r3sys.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.r3sys.dao.AlertsDao;
import com.r3sys.dao.CasesDao;
import com.r3sys.dao.DoctorDao;
import com.r3sys.model.Alerts;
import com.r3sys.model.Cases;
import com.r3sys.model.Doctor;

@Controller
public class DoctorController {

	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	Doctor doctor = (Doctor) context.getBean("doctor");
	DoctorDao doctorDao = (DoctorDao) context.getBean("doctorDao");
	Cases cases = (Cases) context.getBean("cases");
	CasesDao casesDao = (CasesDao) context.getBean("casesDao");
	Alerts alert = (Alerts) context.getBean("alerts");
	AlertsDao alertsDao = (AlertsDao) context.getBean("alertsDao");

	String status = "Approve";
	long d_contact;

	@RequestMapping("/doctorlogin")
	public String doctorLoginPage() {
		System.out.println("Opening doctor login page...");
		return "doctorLogin"; // doctorLogin.jsp should be inside
								// /WEB-INF/views/
	}

	@RequestMapping(path = "/DoctorLogin", method = RequestMethod.POST)
	public String doctorLogin(HttpServletRequest request) {
		d_contact = Long.parseLong(request.getParameter("doctorcontact"));
		String password = request.getParameter("doctorpassword");

		doctor = doctorDao.getDoctor(d_contact);

		if (doctor != null && doctor.getDoctorpassword().equals(password) && doctor.getDoctorStatus().equals(status)) {
			return "doctorDashboard";
		} else {
			return "doctorLogin";
		}

	}

	@RequestMapping("/registerDoctor")
	public String doctorRegisterPage() {
		System.out.println("Opening doctor login page...");
		return "doctorRegister"; // doctorLogin.jsp should be inside
									// /WEB-INF/views/
	}

	@RequestMapping(path = "/RegisterDoctor", method = RequestMethod.POST)
	public String registerDoctor(HttpServletRequest request) {
		doctor.setDoctorContact(Long.parseLong(request.getParameter("doctorContact")));
		doctor.setDoctorName(request.getParameter("doctorName"));
		doctor.setDoctorSpecialization(request.getParameter("doctorSpecialization"));
		doctor.setDoctorEmail(request.getParameter("doctorEmail"));
		doctor.setDoctorpassword(request.getParameter("doctorPassword"));
		doctor.setDoctorStatus("Pending");

		long i = doctorDao.addDoctor(doctor);

		if (i > 0) {
			return "doctorLogin";
		} else {
			return "doctorRegister";
		}

	}

	@RequestMapping("/doctorAddCases")
	public String addcasesbydoctor() {
		return "doctorAddCases";
	}

	@RequestMapping(path = "/RegisterCases", method = RequestMethod.POST)
	public String doctoraddcases(HttpServletRequest request) {
		String dateStr = request.getParameter("reportDate");
		java.sql.Date date = java.sql.Date.valueOf(dateStr);

		long doctorContact = Long.parseLong(request.getParameter("doctorContact"));
		String location = request.getParameter("location");
		String patientName = request.getParameter("patientName");
		String diseaseName = request.getParameter("diseaseName");

		if (doctor.getDoctorContact() == (d_contact)) {
			cases.setDiseaseName(diseaseName);
			cases.setDoctorContact(doctorContact);
			cases.setLocation(location);
			cases.setPatientName(patientName);
			cases.setReportDate(date);

			String i = casesDao.addCases(cases);

			if (i != null) {
				return "doctorDashboard";
			} else {
				return "doctorAddCases";
			}
		} else {
			return "doctorLogin";
		}
	}

	@RequestMapping("/doctorViewCases")
	public String viewcasesbydoctor(Model m) {
		if (doctor.getDoctorContact() == (d_contact)) {
			List<Cases> allcases = casesDao.getAllCases();
			m.addAttribute("allCases", allcases);
			return "doctorCasesView";
		} else {
			return "doctorLogin";
		}
	}

	@RequestMapping("/doctordeleteCases")
	public String deletecasesbydoctor(Model m) {
		if (doctor.getDoctorContact() == (d_contact)) {
			List<Cases> allcases = casesDao.getAllCases();
			m.addAttribute("allCases", allcases);
			return "doctorDeleteCases";
		} else {
			return "doctorLogin";
		}
	}

	@RequestMapping(path = "/deletecases", method = RequestMethod.GET)
	public String deletecases(HttpServletRequest request) {

		if (doctor.getDoctorContact() == (d_contact)) {
			int caseId = Integer.parseInt(request.getParameter("caseId"));
			casesDao.deleteCases(caseId);
			
			return "redirect:/doctorDeleteCases";
		} else {
			return "doctorLogin";
		}
	}

	@RequestMapping("/doctorAlertView")
	public String viewalertbydoctor(Model m) {
		if (doctor.getDoctorContact() == (d_contact)) {
			
			long contact = doctor.getDoctorContact();
			List<Alerts> allAlerts = alertsDao.getAllAlerts();
			m.addAttribute("allAlerts",allAlerts);
	        return "doctorViewAlert";
		} else {
			return "doctorLogin";
		}
	}
	
	
	@RequestMapping("/doctorChangePassword")
	public String changepassword()
	{
		return "doctorPasswordChange";
	}
	
	@RequestMapping(path="/ChangePassword",method = RequestMethod.POST)
	public String passwordchangebydoctor(HttpServletRequest request)
	{
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		String doctoroldpass= doctor.getDoctorpassword();
		System.out.println(newpassword);
		if(doctoroldpass.equals(oldpassword))
		{
			doctor.setDoctorpassword(newpassword);
			doctorDao.updateDoctor(doctor);
			return "doctorLogin";
		}
		else
		{
			return "doctorPasswordChange";
		}
		
	}
	
	
	

}
