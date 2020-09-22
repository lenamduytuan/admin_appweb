package com.home.ktdn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/report")
public class ReportController {
	@RequestMapping(value="/viewReportMonth", method=RequestMethod.GET)
	public String viewUser(){
		
		return "report_thang";
	}
	
	@RequestMapping(value="/viewReportAll", method=RequestMethod.GET)
	public String viewRole(){
		
		return "report_tong_hop";
	}
	@RequestMapping(value="/viewReportWater", method=RequestMethod.GET)
	public String viewRpWater(){
		
		return "report_water";
	}
}
