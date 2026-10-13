package com.r3sys.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.r3sys.dao.*;
import com.r3sys.model.*;

@Controller
public class AdminController {
	
	
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	Doctor doctor = (Doctor) context.getBean("doctor");
	DoctorDao doctorDao = (DoctorDao) context.getBean("doctorDao");
	Alerts alert = (Alerts) context.getBean("alerts");
	AlertsDao alertsDao = (AlertsDao) context.getBean("alertsDao");
	

	@RequestMapping("/")
	public String home() {
		System.out.println("Opening index page..");
		return "index";
	}
	
	@RequestMapping("/adminlogin")
	public String adminLoginPage() {
	    System.out.println("Opening admin login page...");
	    return "adminLogin";  // Make sure your adminlogin.jsp is inside /WEB-INF/views/ if using InternalResourceViewResolver
	}
	
	@RequestMapping(path="AdminLogin", method=RequestMethod.POST)
	public String adminLogin(HttpServletRequest request)
	{
		String adminemail = request.getParameter("adminemail");
		String adminpassword = request.getParameter("adminpassword");
		
		if(adminemail.equals("admin@gmail.com") && adminpassword.equals("admin"))
		{
			return "adminDashboard";
		}
		else
		{
			return "adminLogin";
		}
	}
	
	@RequestMapping("/adminAddDoctor")
	public String adminAddDoctorPage() {
	    System.out.println("Opening admin login page...");
	    return "adminAddDoctor";  // Make sure your adminlogin.jsp is inside /WEB-INF/views/ if using InternalResourceViewResolver
	}
	
	
	@RequestMapping("/adminApproveDisapproveDoctor")
	public String adminDoctorStatus(Model m)
	{
		List<Doctor> allDoctors = doctorDao.getAllDoctors(); 
		m.addAttribute("allDoctors", allDoctors);
		return "adminApproveDisapproveDoctor";
	}
	
	@RequestMapping(path="/approveDoctor", method=RequestMethod.GET)
	public String approveDoctor(HttpServletRequest request)
	{
		long doctorContact = Long.parseLong(request.getParameter("doctorContact"));
		
		doctor = doctorDao.getDoctor(doctorContact);
		doctor.setDoctorStatus("Approve");
		doctorDao.updateDoctor(doctor);
		return "redirect:/adminApproveDisapproveDoctor";
	}
	
	@RequestMapping(path="/disapproveDoctor", method=RequestMethod.GET)
	public String disapproveDoctor(HttpServletRequest request)
	{
		long doctorContact = Long.parseLong(request.getParameter("doctorContact"));
		
		doctor = doctorDao.getDoctor(doctorContact);
		doctor.setDoctorStatus("Disapprove");
		doctorDao.updateDoctor(doctor);
		return "redirect:/adminApproveDisapproveDoctor";
	}
	
	@RequestMapping("/adminDoctorView")
	public String adminViewDoctor(Model m)
	{
		List<Doctor> allDoctors = doctorDao.getAllDoctors(); 
		m.addAttribute("allDoctors", allDoctors);
		return "adminDoctorView";
	}
	
	
	@RequestMapping("/adminDeleteDoctor")
	public String admindeletedoctor(Model m)
	{
		List<Doctor> allDoctors = doctorDao.getAllDoctors();
		m.addAttribute("allDoctors",allDoctors);
		return "adminDoctorDelete";
	}
	
	@RequestMapping(path="/deleteDoctor", method=RequestMethod.GET)
	public String deleteDoctor(HttpServletRequest request)
	{
		long doctorcontact=Long.parseLong(request.getParameter("doctorContact"));
		doctorDao.deleteDoctor(doctorcontact);
		return "redirect:/adminDoctorDelete";
	}
	
	
	@RequestMapping("adminAddAlert")
	public String adminaddalert()
	{
		return "adminAddAlert";
	}
	

	
	

}
