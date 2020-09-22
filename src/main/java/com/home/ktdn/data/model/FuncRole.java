package com.home.ktdn.data.model;

import java.io.Serializable;

import javax.persistence.*;

import com.home.core.data.model.PersistentObject;

import java.sql.Timestamp;


/**
 * The persistent class for the func_role database table.
 * 
 */
@Entity
@Table(name="func_role")
@NamedQuery(name="FuncRole.findAll", query="SELECT f FROM FuncRole f")
public class FuncRole extends PersistentObject implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Column(name="date_created")
	private Timestamp dateCreated;

	@Column(name="date_modified")
	private Timestamp dateModified;

	@Column(name="id_func")
	private int idFunc;

	@Column(name="id_role")
	private int idRole;

	@Column(name="user_created")
	private String userCreated;

	@Column(name="user_modified")
	private String userModified;

	public FuncRole() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getIdFunc() {
		return this.idFunc;
	}

	public void setIdFunc(int idFunc) {
		this.idFunc = idFunc;
	}

	public int getIdRole() {
		return this.idRole;
	}

	public void setIdRole(int idRole) {
		this.idRole = idRole;
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