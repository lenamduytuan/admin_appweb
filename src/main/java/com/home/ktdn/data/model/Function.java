package com.home.ktdn.data.model;

import java.io.Serializable;

import javax.persistence.*;

import com.home.core.data.model.PersistentObject;

import java.sql.Timestamp;


/**
 * The persistent class for the function database table.
 * 
 */
@Entity
@NamedQuery(name="Function.findAll", query="SELECT f FROM Function f")
public class Function extends PersistentObject implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Column(name="date_created")
	private Timestamp dateCreated;

	@Column(name="date_modified")
	private Timestamp dateModified;

	private String note;

	private String url;

	@Column(name="user_created")
	private String userCreated;

	@Column(name="user_modified")
	private String userModified;

	public Function() {
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

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
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