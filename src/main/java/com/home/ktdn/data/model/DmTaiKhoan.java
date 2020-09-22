package com.home.ktdn.data.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.*;

import com.home.core.data.model.PersistentObject;

/**
 * The persistent class for the dm_tai_khoan database table.
 * 
 */
@Entity
@Table(name="dm_tai_khoan")
@NamedQuery(name="DmTaiKhoan.findAll", query="SELECT d FROM DmTaiKhoan d")
public class DmTaiKhoan extends PersistentObject implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(name="ma_tk")
	private String maTk;

	@Column(name="ten_tk")
	private String tenTk;
	
	@Column(name="date_created")
	private Timestamp dateCreated;

	@Column(name="date_modified")
	private Timestamp dateModified;
	
	@Column(name="user_created")
	private String userCreated;

	@Column(name="user_modified")
	private String userModified;

	public DmTaiKhoan() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMaTk() {
		return this.maTk;
	}

	public void setMaTk(String maTk) {
		this.maTk = maTk;
	}

	public String getTenTk() {
		return this.tenTk;
	}

	public void setTenTk(String tenTk) {
		this.tenTk = tenTk;
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