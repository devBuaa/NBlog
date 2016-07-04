package com.amc.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * AmcWantslip entity. @author MyEclipse Persistence Tools
 */

public class AmcWantslip implements java.io.Serializable {

	// Fields

	private Integer wsid;
	private AmcUser amcUser;
	private AmcSalesorder amcSalesorder;
	private Date wsctime;
	private Date wsetime;
	private Integer wsstate;
	private Set amcWsdetails = new HashSet(0);

	// Constructors

	/** default constructor */
	public AmcWantslip() {
	}

	/** minimal constructor */
	public AmcWantslip(AmcUser amcUser, AmcSalesorder amcSalesorder,
			Date wsctime, Date wsetime, Integer wsstate) {
		this.amcUser = amcUser;
		this.amcSalesorder = amcSalesorder;
		this.wsctime = wsctime;
		this.wsetime = wsetime;
		this.wsstate = wsstate;
	}

	/** full constructor */
	public AmcWantslip(AmcUser amcUser, AmcSalesorder amcSalesorder,
			Date wsctime, Date wsetime, Integer wsstate, Set amcWsdetails) {
		this.amcUser = amcUser;
		this.amcSalesorder = amcSalesorder;
		this.wsctime = wsctime;
		this.wsetime = wsetime;
		this.wsstate = wsstate;
		this.amcWsdetails = amcWsdetails;
	}

	// Property accessors

	public Integer getWsid() {
		return this.wsid;
	}

	public void setWsid(Integer wsid) {
		this.wsid = wsid;
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

	public Date getWsctime() {
		return this.wsctime;
	}

	public void setWsctime(Date wsctime) {
		this.wsctime = wsctime;
	}

	public Date getWsetime() {
		return this.wsetime;
	}

	public void setWsetime(Date wsetime) {
		this.wsetime = wsetime;
	}

	public Integer getWsstate() {
		return this.wsstate;
	}

	public void setWsstate(Integer wsstate) {
		this.wsstate = wsstate;
	}

	public Set getAmcWsdetails() {
		return this.amcWsdetails;
	}

	public void setAmcWsdetails(Set amcWsdetails) {
		this.amcWsdetails = amcWsdetails;
	}

}