package com.home.ktdn.data.model;

import java.io.Serializable;

import javax.persistence.*;

import com.home.core.data.model.PersistentObject;

import java.math.BigDecimal;
import java.util.Date;
import java.sql.Timestamp;


/**
 * The persistent class for the chung_tu_ps database table.
 * 
 */
@Entity
@Table(name="chung_tu_ps")
@NamedQuery(name="ChungTuPs.findAll", query="SELECT c FROM ChungTuPs c")
public class ChungTuPs extends PersistentObject implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	@Temporal(TemporalType.DATE)
	@Column(name="ct_ngay")
	private Date ctNgay;

	@Column(name="ct_so")
	private String ctSo;

	@Column(name="dg_co")
	private String dgCo;

	@Column(name="dg_no")
	private String dgNo;

	@Column(name="kh_co")
	private String khCo;

	@Column(name="kh_no")
	private String khNo;

	@Column(name="so_tien_vnd")
	private BigDecimal soTienVnd;

	private int stt;

	@Column(name="tk_co")
	private String tkCo;

	@Column(name="tk_no")
	private String tkNo;

	public ChungTuPs() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getCtNgay() {
		return this.ctNgay;
	}

	public void setCtNgay(Date ctNgay) {
		this.ctNgay = ctNgay;
	}

	public String getCtSo() {
		return this.ctSo;
	}

	public void setCtSo(String ctSo) {
		this.ctSo = ctSo;
	}

	public String getDgCo() {
		return this.dgCo;
	}

	public void setDgCo(String dgCo) {
		this.dgCo = dgCo;
	}

	public String getDgNo() {
		return this.dgNo;
	}

	public void setDgNo(String dgNo) {
		this.dgNo = dgNo;
	}

	public String getKhCo() {
		return this.khCo;
	}

	public void setKhCo(String khCo) {
		this.khCo = khCo;
	}

	public String getKhNo() {
		return this.khNo;
	}

	public void setKhNo(String khNo) {
		this.khNo = khNo;
	}

	public BigDecimal getSoTienVnd() {
		return this.soTienVnd;
	}

	public void setSoTienVnd(BigDecimal soTienVnd) {
		this.soTienVnd = soTienVnd;
	}

	public int getStt() {
		return this.stt;
	}

	public void setStt(int stt) {
		this.stt = stt;
	}

	public String getTkCo() {
		return this.tkCo;
	}

	public void setTkCo(String tkCo) {
		this.tkCo = tkCo;
	}

	public String getTkNo() {
		return this.tkNo;
	}

	public void setTkNo(String tkNo) {
		this.tkNo = tkNo;
	}

}