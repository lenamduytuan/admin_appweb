package com.home.ktdn.data.model;

import java.io.Serializable;

import javax.persistence.*;

import com.home.core.data.model.PersistentObject;

import java.sql.Timestamp;


/**
 * The persistent class for the khach_hang database table.
 * 
 */
@Entity
@Table(name="khach_hang")
@NamedQuery(name="KhachHang.findAll", query="SELECT k FROM KhachHang k")
public class KhachHang extends PersistentObject implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	@Column(name="chung_tu")
	private String chungTu;

	@Column(name="date_created")
	private Timestamp dateCreated;

	@Column(name="date_modified")
	private Timestamp dateModified;

	@Column(name="dia_chi")
	private String diaChi;

	@Column(name="don_vi")
	private String donVi;

	@Column(name="ho_ten")
	private String hoTen;

	@Column(name="kem_theo")
	private int kemTheo;

	@Column(name="ma_kh")
	private String maKh;

	@Column(name="user_created")
	private String userCreated;

	@Column(name="user_modified")
	private String userModified;

	public KhachHang() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getChungTu() {
		return this.chungTu;
	}

	public void setChungTu(String chungTu) {
		this.chungTu = chungTu;
	}

	public Timestamp getDateCreated() {
		return this.dateCreated;
	}

	public void setDateCreated(Timestamp dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Timestamp getDateModified() {
		return this.dateModified;
	}

	public void setDateModified(Timestamp dateModified) {
		this.dateModified = dateModified;
	}

	public String getDiaChi() {
		return this.diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getDonVi() {
		return this.donVi;
	}

	public void setDonVi(String donVi) {
		this.donVi = donVi;
	}

	public String getHoTen() {
		return this.hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public int getKemTheo() {
		return this.kemTheo;
	}

	public void setKemTheo(int kemTheo) {
		this.kemTheo = kemTheo;
	}

	public String getMaKh() {
		return this.maKh;
	}

	public void setMaKh(String maKh) {
		this.maKh = maKh;
	}

	public String getUserCreated() {
		return this.userCreated;
	}

	public void setUserCreated(String userCreated) {
		this.userCreated = userCreated;
	}

	public String getUserModified() {
		return this.userModified;
	}

	public void setUserModified(String userModified) {
		this.userModified = userModified;
	}

}