package com.amc.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * AmcReceivable entity. @author MyEclipse Persistence Tools
 */

public class AmcReceivable implements java.io.Serializable {

	// Fields

	private Integer rcid;
	private AmcSalesorder amcSalesorder;
	private AmcUser amcUser;
	private Float rctaccount;
	private Date rcdeadline;
	private Date rcctime;
	private Date rcrtime;
	private Integer rcstate;
	private Set amcReceivabledetails = new HashSet(0);
	private Set amcSaleaccounts = new HashSet(0);

	// Constructors

	/** default constructor */
	public AmcReceivable() {
	}

	/** minimal constructor */
	public AmcReceivable(AmcSalesorder amcSalesorder, AmcUser amcUser,
			Float rctaccount, Date rcdeadline, Date rcctime, Date rcrtime,
			Integer rcstate) {
		this.amcSalesorder = amcSalesorder;
		this.amcUser = amcUser;
		this.rctaccount = rctaccount;
		this.rcdeadline = rcdeadline;
		this.rcctime = rcctime;
		this.rcrtime = rcrtime;
		this.rcstate = rcstate;
	}

	/** full constructor */
	public AmcReceivable(AmcSalesorder amcSalesorder, AmcUser amcUser,
			Float rctaccount, Date rcdeadline, Date rcctime, Date rcrtime,
			Integer rcstate, Set amcReceivabledetails, Set amcSaleaccounts) {
		this.amcSalesorder = amcSalesorder;
		this.amcUser = amcUser;
		this.rctaccount = rctaccount;
		this.rcdeadline = rcdeadline;
		this.rcctime = rcctime;
		this.rcrtime = rcrtime;
		this.rcstate = rcstate;
		this.amcReceivabledetails = amcReceivabledetails;
		this.amcSaleaccounts = amcSaleaccounts;
	}

	// Property accessors

	public Integer getRcid() {
		return this.rcid;
	}

	public void setRcid(Integer rcid) {
		this.rcid = rcid;
	}

	public AmcSalesorder getAmcSalesorder() {
		return this.amcSalesorder;
	}

	public void setAmcSalesorder(AmcSalesorder amcSalesorder) {
		this.amcSalesorder = amcSalesorder;
	}

	public AmcUser getAmcUser() {
		return this.amcUser;
	}

	public void setAmcUser(AmcUser amcUser) {
		this.amcUser = amcUser;
	}

	public Float getRctaccount() {
		return this.rctaccount;
	}

	public void setRctaccount(Float rctaccount) {
		this.rctaccount = rctaccount;
	}

	public Date getRcdeadline() {
		return this.rcdeadline;
	}

	public void setRcdeadline(Date rcdeadline) {
		this.rcdeadline = rcdeadline;
	}

	public Date getRcctime() {
		return this.rcctime;
	}

	public void setRcctime(Date rcctime) {
		this.rcctime = rcctime;
	}

	public Date getRcrtime() {
		return this.rcrtime;
	}

	public void setRcrtime(Date rcrtime) {
		this.rcrtime = rcrtime;
	}

	public Integer getRcstate() {
		return this.rcstate;
	}

	public void setRcstate(Integer rcstate) {
		this.rcstate = rcstate;
	}

	public Set getAmcReceivabledetails() {
		return this.amcReceivabledetails;
	}

	public void setAmcReceivabledetails(Set amcReceivabledetails) {
		this.amcReceivabledetails = amcReceivabledetails;
	}

	public Set getAmcSaleaccounts() {
		return this.amcSaleaccounts;
	}

	public void setAmcSaleaccounts(Set amcSaleaccounts) {
		this.amcSaleaccounts = amcSaleaccounts;
	}

}