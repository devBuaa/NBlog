package com.amc.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * AmcPurchaseorder entity. @author MyEclipse Persistence Tools
 */

public class AmcPurchaseorder implements java.io.Serializable {

	// Fields

	private Integer poid;
	private AmcSupplier amcSupplier;
	private AmcUser amcUser;
	private Date poctime;
	private Integer postate;
	private Float poamount;
	private Set amcReplenishsheets = new HashSet(0);
	private Set amcPodetails = new HashSet(0);
	private Set amcPayables = new HashSet(0);

	// Constructors

	/** default constructor */
	public AmcPurchaseorder() {
	}

	/** minimal constructor */
	public AmcPurchaseorder(AmcSupplier amcSupplier, AmcUser amcUser,
			Date poctime, Integer postate, Float poamount) {
		this.amcSupplier = amcSupplier;
		this.amcUser = amcUser;
		this.poctime = poctime;
		this.postate = postate;
		this.poamount = poamount;
	}

	/** full constructor */
	public AmcPurchaseorder(AmcSupplier amcSupplier, AmcUser amcUser,
			Date poctime, Integer postate, Float poamount,
			Set amcReplenishsheets, Set amcPodetails, Set amcPayables) {
		this.amcSupplier = amcSupplier;
		this.amcUser = amcUser;
		this.poctime = poctime;
		this.postate = postate;
		this.poamount = poamount;
		this.amcReplenishsheets = amcReplenishsheets;
		this.amcPodetails = amcPodetails;
		this.amcPayables = amcPayables;
	}

	// Property accessors

	public Integer getPoid() {
		return this.poid;
	}

	public void setPoid(Integer poid) {
		this.poid = poid;
	}

	public AmcSupplier getAmcSupplier() {
		return this.amcSupplier;
	}

	public void setAmcSupplier(AmcSupplier amcSupplier) {
		this.amcSupplier = amcSupplier;
	}

	public AmcUser getAmcUser() {
		return this.amcUser;
	}

	public void setAmcUser(AmcUser amcUser) {
		this.amcUser = amcUser;
	}

	public Date getPoctime() {
		return this.poctime;
	}

	public void setPoctime(Date poctime) {
		this.poctime = poctime;
	}

	public Integer getPostate() {
		return this.postate;
	}

	public void setPostate(Integer postate) {
		this.postate = postate;
	}

	public Float getPoamount() {
		return this.poamount;
	}

	public void setPoamount(Float poamount) {
		this.poamount = poamount;
	}

	public Set getAmcReplenishsheets() {
		return this.amcReplenishsheets;
	}

	public void setAmcReplenishsheets(Set amcReplenishsheets) {
		this.amcReplenishsheets = amcReplenishsheets;
	}

	public Set getAmcPodetails() {
		return this.amcPodetails;
	}

	public void setAmcPodetails(Set amcPodetails) {
		this.amcPodetails = amcPodetails;
	}

	public Set getAmcPayables() {
		return this.amcPayables;
	}

	public void setAmcPayables(Set amcPayables) {
		this.amcPayables = amcPayables;
	}

}