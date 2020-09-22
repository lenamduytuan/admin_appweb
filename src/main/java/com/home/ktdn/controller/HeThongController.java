package com.home.ktdn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/ht")
public class HeThongController {
	@RequestMapping(value="/viewUser", method=RequestMethod.GET)
	public String viewUser(){
		
		return "ht_ql_nsd";
	}
	
	@RequestMapping(value="/viewRole", method=RequestMethod.GET)
	public String viewRole(){
		
		return "ht_ql_nhom";
	}
	
	@RequestMapping(value="/viewUserRole", method=RequestMethod.GET)
	public String viewUserRole(){
		
		return "ht_ql_nhom_nsd";
	}
	
	@RequestMapping(value="/viewMenuFunc", method=RequestMethod.GET)
	public String viewFunction(){
		
		return "ht_ql_nhom_chuc_nang";
	}
}
