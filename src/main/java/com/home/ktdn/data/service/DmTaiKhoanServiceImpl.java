package com.home.ktdn.data.service;

import org.springframework.stereotype.Service;

import com.home.core.data.service.BaseServiceImpl;
import com.home.ktdn.data.dao.DmTaiKhoanDAO;
import com.home.ktdn.data.model.DmTaiKhoan;

@Service
public class DmTaiKhoanServiceImpl extends BaseServiceImpl<DmTaiKhoan, Integer> implements DmTaiKhoanService{
	private DmTaiKhoanDAO dmTaiKhoanDAO;

	public DmTaiKhoanServiceImpl(){
		
	}

	public DmTaiKhoanServiceImpl(DmTaiKhoanDAO dmTaiKhoanDAO) {
        super(dmTaiKhoanDAO);
        this.dmTaiKhoanDAO = dmTaiKhoanDAO;
    }
	
	
}
