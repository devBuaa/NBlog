package com.amc.domain;

import java.util.Date;

/**
 * AmcPurchaseaccount entity. @author MyEclipse Persistence Tools
 */

public class AmcPurchaseaccount implements java.io.Serializable {

	// Fields

	private Integer paid;
	private AmcPayable amcPayable;
	private Date pactime;
	private Float patotalaccount;

	// Constructors

	/** default constructor */
	public AmcPurchaseaccount() {
	}

	/** full constructor */
	public AmcPurchaseaccount(AmcPayable amcPayable, Date pactime,
			Float patotalaccount) {
		this.amcPayable = amcPayable;
		this.pactime = pactime;
		this.patotalaccount = patotalaccount;
	}

	// Property accessors

	public Integer getPaid() {
		return this.paid;
	}

	public void setPaid(Integer paid) {
		this.paid = paid;
	}

	public AmcPayable getAmcPayable() {
		return this.amcPayable;
	}

	public void setAmcPayable(AmcPayable amcPayable) {
		this.amcPayable = amcPayable;
	}

	public Date getPactime() {
		return this.pactime;
	}

	public void setPactime(Date pactime) {
		this.pactime = pactime;
	}

	public Float getPatotalaccount() {
		return this.patotalaccount;
	}

	public void setPatotalaccount(Float patotalaccount) {
		this.patotalaccount = patotalaccount;
	}

}