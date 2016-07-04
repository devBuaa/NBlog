package com.amc.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * AmcReplenishsheet entity. @author MyEclipse Persistence Tools
 */

public class AmcReplenishsheet implements java.io.Serializable {

	// Fields

	private Integer rid;
	private AmcPurchaseorder amcPurchaseorder;
	private AmcUser amcUser;
	private Date rarrivaltime;
	private Integer rstate;
	private Set amcReplenishdetails = new HashSet(0);

	// Constructors

	/** default constructor */
	public AmcReplenishsheet() {
	}

	/** minimal constructor */
	public AmcReplenishsheet(AmcPurchaseorder amcPurchaseorder,
			AmcUser amcUser, Date rarrivaltime, Integer rstate) {
		this.amcPurchaseorder = amcPurchaseorder;
		this.amcUser = amcUser;
		this.rarrivaltime = rarrivaltime;
		this.rstate = rstate;
	}

	/** full constructor */
	public AmcReplenishsheet(AmcPurchaseorder amcPurchaseorder,
			AmcUser amcUser, Date rarrivaltime, Integer rstate,
			Set amcReplenishdetails) {
		this.amcPurchaseorder = amcPurchaseorder;
		this.amcUser = amcUser;
		this.rarrivaltime = rarrivaltime;
		this.rstate = rstate;
		this.amcReplenishdetails = amcReplenishdetails;
	}

	// Property accessors

	public Integer getRid() {
		return this.rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public AmcPurchaseorder getAmcPurchaseorder() {
		return this.amcPurchaseorder;
	}

	public void setAmcPurchaseorder(AmcPurchaseorder amcPurchaseorder) {
		this.amcPurchaseorder = amcPurchaseorder;
	}

	public AmcUser getAmcUser() {
		return this.amcUser;
	}

	public void setAmcUser(AmcUser amcUser) {
		this.amcUser = amcUser;
	}

	public Date getRarrivaltime() {
		return this.rarrivaltime;
	}

	public void setRarrivaltime(Date rarrivaltime) {
		this.rarrivaltime = rarrivaltime;
	}

	public Integer getRstate() {
		return this.rstate;
	}

	public void setRstate(Integer rstate) {
		this.rstate = rstate;
	}

	public Set getAmcReplenishdetails() {
		return this.amcReplenishdetails;
	}

	public void setAmcReplenishdetails(Set amcReplenishdetails) {
		this.amcReplenishdetails = amcReplenishdetails;
	}

}