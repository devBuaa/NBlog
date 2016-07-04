package com.amc.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * AmcStockorder entity. @author MyEclipse Persistence Tools
 */

public class AmcStockorder implements java.io.Serializable {

	// Fields

	private Integer stoid;
	private AmcUser amcUser;
	private AmcSalesorder amcSalesorder;
	private Date stoctime;
	private Integer stostate;
	private Set amcStockdetails = new HashSet(0);

	// Constructors

	/** default constructor */
	public AmcStockorder() {
	}

	/** minimal constructor */
	public AmcStockorder(AmcUser amcUser, AmcSalesorder amcSalesorder,
			Date stoctime, Integer stostate) {
		this.amcUser = amcUser;
		this.amcSalesorder = amcSalesorder;
		this.stoctime = stoctime;
		this.stostate = stostate;
	}

	/** full constructor */
	public AmcStockorder(AmcUser amcUser, AmcSalesorder amcSalesorder,
			Date stoctime, Integer stostate, Set amcStockdetails) {
		this.amcUser = amcUser;
		this.amcSalesorder = amcSalesorder;
		this.stoctime = stoctime;
		this.stostate = stostate;
		this.amcStockdetails = amcStockdetails;
	}

	// Property accessors

	public Integer getStoid() {
		return this.stoid;
	}

	public void setStoid(Integer stoid) {
		this.stoid = stoid;
	}

	public AmcUser getAmcUser() {
		return this.amcUser;
	}

	public void setAmcUser(AmcUser amcUser) {
		this.amcUser = amcUser;
	}

	public AmcSalesorder getAmcSalesorder() {
		return this.amcSalesorder;
	}

	public void setAmcSalesorder(AmcSalesorder amcSalesorder) {
		this.amcSalesorder = amcSalesorder;
	}

	public Date getStoctime() {
		return this.stoctime;
	}

	public void setStoctime(Date stoctime) {
		this.stoctime = stoctime;
	}

	public Integer getStostate() {
		return this.stostate;
	}

	public void setStostate(Integer stostate) {
		this.stostate = stostate;
	}

	public Set getAmcStockdetails() {
		return this.amcStockdetails;
	}

	public void setAmcStockdetails(Set amcStockdetails) {
		this.amcStockdetails = amcStockdetails;
	}

}