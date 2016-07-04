package com.amc.domain;

import java.util.Date;

/**
 * AmcSaleaccount entity. @author MyEclipse Persistence Tools
 */

public class AmcSaleaccount implements java.io.Serializable {

	// Fields

	private Integer said;
	private AmcReceivable amcReceivable;
	private Date sactime;
	private Float satotalaccount;

	// Constructors

	/** default constructor */
	public AmcSaleaccount() {
	}

	/** full constructor */
	public AmcSaleaccount(AmcReceivable amcReceivable, Date sactime,
			Float satotalaccount) {
		this.amcReceivable = amcReceivable;
		this.sactime = sactime;
		this.satotalaccount = satotalaccount;
	}

	// Property accessors

	public Integer getSaid() {
		return this.said;
	}

	public void setSaid(Integer said) {
		this.said = said;
	}

	public AmcReceivable getAmcReceivable() {
		return this.amcReceivable;
	}

	public void setAmcReceivable(AmcReceivable amcReceivable) {
		this.amcReceivable = amcReceivable;
	}

	public Date getSactime() {
		return this.sactime;
	}

	public void setSactime(Date sactime) {
		this.sactime = sactime;
	}

	public Float getSatotalaccount() {
		return this.satotalaccount;
	}

	public void setSatotalaccount(Float satotalaccount) {
		this.satotalaccount = satotalaccount;
	}

}