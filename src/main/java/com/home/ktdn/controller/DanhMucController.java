package com.home.ktdn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/dm")
public class DanhMucController {
	
	@RequestMapping(value="/viewDmTk", method=RequestMethod.GET)
	public String viewDmTk(){
		
		return "dm_tai_khoan";
	}

	@RequestMapping(value="/viewDmCanBo", method=RequestMethod.GET)
	public String viewDmCanBo(){
		
		return "dm_can_bo";
	}
	
	@RequestMapping(value="/viewDmTuyen", method=RequestMethod.GET)
	public String viewDmTuyen(){
		return "dm_tuyen";
	}
	
	@RequestMapping(value="/viewDmKhuVuc", method=RequestMethod.GET)
	public String viewDmKhuVuc(){
		return "dm_khu_vuc";
	}
	
	@RequestMapping(value="/viewDmBangGiaNuoc", method=RequestMethod.GET)
	public String viewDmBangGiaNuoc(){
		return "dm_bang_gia_nuoc";
	}
	
	@RequestMapping(value="/viewDmSoDoc", method=RequestMethod.GET)
	public String viewDmTo(){
		return "dm_so_doc";
	}
	
}
