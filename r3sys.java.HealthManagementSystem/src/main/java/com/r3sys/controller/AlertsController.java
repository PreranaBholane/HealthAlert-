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
public class AlertsController {
	
	
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	Alerts alert = (Alerts) context.getBean("alerts");
	AlertsDao alertsDao = (AlertsDao) context.getBean("alertsDao");
	
	@RequestMapping(path="/RegisterAlert",method=RequestMethod.POST)
 	public String registerDoctor(HttpServletRequest request) 
 	{
	 	String dateStr = request.getParameter("dateIssued");
	 	java.sql.Date date = java.sql.Date.valueOf(dateStr);
	 	
	 	alert.setDiseaseName(request.getParameter("diseaseName"));
	 	alert.setAffectedArea(request.getParameter("affectedArea"));
	 	alert.setAlertLevel(request.getParameter("alertLevel"));
	 	alert.setDateIssued(date);
	 	alert.setDoctorContact(request.getParameter("doctorContact"));
	 	
	 	String i = alertsDao.addAlerts(alert);
	 	
	 	System.out.println(i);
	 	
	 	if(i!=null)
	 	{
	 		return "adminDashboard";
	 	}
	 	else
	 	{
	 		return "adminLogin";
	 	}
	 	
 	}
	
	@RequestMapping(path="/adminViewAlert")
	public String adminviewalert(Model m)
	{
		List<Alerts> allAlerts = alertsDao.getAllAlerts(); 
		m.addAttribute("allAlerts", allAlerts);
		return "adminViewAlert";
	}
	
	@RequestMapping(path="/adminDeleteAlerts")
	public String admindeletealert(Model m)
	{
		List<Alerts> allAlerts = alertsDao.getAllAlerts();
		m.addAttribute("allAlerts",allAlerts);
		return "adminDeleteAlerts";
	}
	
	@RequestMapping(path="/deleteCases")
	public String admindealertdelete(Model m,HttpServletRequest request)
	{
		int alertId=Integer.parseInt(request.getParameter("alertId"));
		alertsDao.deleteAlert(alertId);;
		return "redirect:/adminDeleteAlerts";
	}
	
	
}
