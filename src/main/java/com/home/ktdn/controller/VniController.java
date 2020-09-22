package com.home.ktdn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/vni")
public class VniController {
	
	@RequestMapping(value="/viewVni", method=RequestMethod.GET)
	public String viewVni(){
		
		return "syn_nuoc_to_vni";
	}
}
