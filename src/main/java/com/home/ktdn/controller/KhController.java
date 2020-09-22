package com.home.ktdn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/kh")
public class KhController {
	
	@RequestMapping(value="/viewKH", method=RequestMethod.GET)
	public String viewKH(){
		
		return "lov_khach_hang";
	}
	@RequestMapping(value="/viewDmKh", method=RequestMethod.GET)
	public String viewDmKh(){
		
		return "nhap_khach_hang";
	}
}
