package com.home.ktdn.data.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the dm_khu_vuc database table.
 * 
 */
@Entity
@Table(name="dm_khu_vuc")
@NamedQuery(name="DmKhuVuc.findAll", query="SELECT d FROM DmKhuVuc d")
public class DmKhuVuc implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ma_khu_vuc")
	private String maKhuVuc;

	@Column(name="mo_ta")
	private String moTa;

	@Column(name="ten_khu_vuc")
	private String tenKhuVuc;

	public DmKhuVuc() {
	}

	public String getMaKhuVuc() {
		return this.maKhuVuc;
	}

	public void setMaKhuVuc(String maKhuVuc) {
		this.maKhuVuc = maKhuVuc;
	}

	public String getMoTa() {
		return this.moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getTenKhuVuc() {
		return this.tenKhuVuc;
	}

	public void setTenKhuVuc(String tenKhuVuc) {
		this.tenKhuVuc = tenKhuVuc;
	}

}