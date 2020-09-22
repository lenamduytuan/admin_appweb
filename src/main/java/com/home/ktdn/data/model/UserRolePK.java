package com.home.ktdn.data.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the user_role database table.
 * 
 */
@Embeddable
public class UserRolePK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	private int id;

	@Column(name="id_user")
	private String idUser;

	@Column(name="id_role")
	private int idRole;

	public UserRolePK() {
	}
	public int getId() {
		return this.id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIdUser() {
		return this.idUser;
	}
	public void setIdUser(String idUser) {
		this.idUser = idUser;
	}
	public int getIdRole() {
		return this.idRole;
	}
	public void setIdRole(int idRole) {
		this.idRole = idRole;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof UserRolePK)) {
			return false;
		}
		UserRolePK castOther = (UserRolePK)other;
		return 
			(this.id == castOther.id)
			&& this.idUser.equals(castOther.idUser)
			&& (this.idRole == castOther.idRole);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.id;
		hash = hash * prime + this.idUser.hashCode();
		hash = hash * prime + this.idRole;
		
		return hash;
	}
}