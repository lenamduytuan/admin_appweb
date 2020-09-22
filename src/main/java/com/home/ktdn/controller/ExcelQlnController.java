package com.home.ktdn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/rp")
public class ExcelQlnController {
	@RequestMapping(value="/viewExcelQLN", method=RequestMethod.GET)
	public String viewExcelQLN(){
		return "nhap_chi_so";
	}
	@RequestMapping(value="/viewDmKhInQLN", method=RequestMethod.GET)
	public String viewDmKhInQLN(){
		return "in_phieu_thu";
	}
	
	@RequestMapping(value="/viewDmInvoice", method=RequestMethod.GET)
	public String viewDmInvoice(){
		return "dm_hoa_don";
	}
}
