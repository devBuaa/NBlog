package com.amc.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * AmcPayable entity. @author MyEclipse Persistence Tools
 */

public class AmcPayable implements java.io.Serializable {

	// Fields

	private Integer payid;
	private AmcUser amcUser;
	private AmcPurchaseorder amcPurchaseorder;
	private Float paytotalaccount;
	private Date payctime;
	private Date paydate;
	private Integer paystate;
	private Set amcPurchaseaccounts = new HashSet(0);
	private Set amcPayabledetails = new HashSet(0);

	// Constructors

	/** default constructor */
	public AmcPayable() {
	}

	/** minimal constructor */
	public AmcPayable(AmcUser amcUser, AmcPurchaseorder amcPurchaseorder,
			Float paytotalaccount, Date payctime, Date paydate, Integer paystate) {
		this.amcUser = amcUser;
		this.amcPurchaseorder = amcPurchaseorder;
		this.paytotalaccount = paytotalaccount;
		this.payctime = payctime;
		this.paydate = paydate;
		this.paystate = paystate;
	}

	/** full constructor */
	public AmcPayable(AmcUser amcUser, AmcPurchaseorder amcPurchaseorder,
			Float paytotalaccount, Date payctime, Date paydate,
			Integer paystate, Set amcPurchaseaccounts, Set amcPayabledetails) {
		this.amcUser = amcUser;
		this.amcPurchaseorder = amcPurchaseorder;
		this.paytotalaccount = paytotalaccount;
		this.payctime = payctime;
		this.paydate = paydate;
		this.paystate = paystate;
		this.amcPurchaseaccounts = amcPurchaseaccounts;
		this.amcPayabledetails = amcPayabledetails;
	}

	// Property accessors

	public Integer getPayid() {
		return this.payid;
	}

	public void setPayid(Integer payid) {
		this.payid = payid;
	}

	public AmcUser getAmcUser() {
		return this.amcUser;
	}

	public void setAmcUser(AmcUser amcUser) {
		this.amcUser = amcUser;
	}

	public AmcPurchaseorder getAmcPurchaseorder() {
		return this.amcPurchaseorder;
	}

	public void setAmcPurchaseorder(AmcPurchaseorder amcPurchaseorder) {
		this.amcPurchaseorder = amcPurchaseorder;
	}

	public Float getPaytotalaccount() {
		return this.paytotalaccount;
	}

	public void setPaytotalaccount(Float paytotalaccount) {
		this.paytotalaccount = paytotalaccount;
	}

	public Date getPayctime() {
		return this.payctime;
	}

	public void setPayctime(Date payctime) {
		this.payctime = payctime;
	}

	public Date getPaydate() {
		return this.paydate;
	}

	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}

	public Integer getPaystate() {
		return this.paystate;
	}

	public void setPaystate(Integer paystate) {
		this.paystate = paystate;
	}

	public Set getAmcPurchaseaccounts() {
		return this.amcPurchaseaccounts;
	}

	public void setAmcPurchaseaccounts(Set amcPurchaseaccounts) {
		this.amcPurchaseaccounts = amcPurchaseaccounts;
	}

	public Set getAmcPayabledetails() {
		return this.amcPayabledetails;
	}

	public void setAmcPayabledetails(Set amcPayabledetails) {
		this.amcPayabledetails = amcPayabledetails;
	}

}