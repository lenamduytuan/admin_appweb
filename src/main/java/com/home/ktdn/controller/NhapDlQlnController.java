package com.home.ktdn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/qln")
public class NhapDlQlnController {
	
	@RequestMapping(value="/nhapDlQln", method=RequestMethod.GET)
	public String nhapDlQln(){
		
		return "nhap_qln";
	}
}
