package com.amc.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * AmcSalesorder entity. @author MyEclipse Persistence Tools
 */

public class AmcSalesorder implements java.io.Serializable {

	// Fields

	private Integer soid;
	private AmcUser amcUser;
	private AmcCustomer amcCustomer;
	private Date soctime;
	private String soaddress;
	private String sostate;
	private String soReceivePerson;
	private Set amcSodetails = new HashSet(0);
	private Set amcReceivables = new HashSet(0);
	private Set amcStockorders = new HashSet(0);

	// Constructors

	/** default constructor */
	public AmcSalesorder() {
	}

	/** minimal constructor */
	public AmcSalesorder(AmcUser amcUser, AmcCustomer amcCustomer,
			Date soctime, String sostate) {
		this.amcUser = amcUser;
		this.amcCustomer = amcCustomer;
		this.soctime = soctime;
		this.sostate = sostate;
	}

	/** full constructor */
	public AmcSalesorder(AmcUser amcUser, AmcCustomer amcCustomer,
			Date soctime, String soaddress, String sostate,
			String soReceivePerson, Set amcSodetails, Set amcReceivables,
			Set amcStockorders) {
		this.amcUser = amcUser;
		this.amcCustomer = amcCustomer;
		this.soctime = soctime;
		this.soaddress = soaddress;
		this.sostate = sostate;
		this.soReceivePerson = soReceivePerson;
		this.amcSodetails = amcSodetails;
		this.amcReceivables = amcReceivables;
		this.amcStockorders = amcStockorders;
	}

	// Property accessors

	public Integer getSoid() {
		return this.soid;
	}

	public void setSoid(Integer soid) {
		this.soid = soid;
	}

	public AmcUser getAmcUser() {
		return this.amcUser;
	}

	public void setAmcUser(AmcUser amcUser) {
		this.amcUser = amcUser;
	}

	public AmcCustomer getAmcCustomer() {
		return this.amcCustomer;
	}

	public void setAmcCustomer(AmcCustomer amcCustomer) {
		this.amcCustomer = amcCustomer;
	}

	public Date getSoctime() {
		return this.soctime;
	}

	public void setSoctime(Date soctime) {
		this.soctime = soctime;
	}

	public String getSoaddress() {
		return this.soaddress;
	}

	public void setSoaddress(String soaddress) {
		this.soaddress = soaddress;
	}

	public String getSostate() {
		return this.sostate;
	}

	public void setSostate(String sostate) {
		this.sostate = sostate;
	}

	public String getSoReceivePerson() {
		return this.soReceivePerson;
	}

	public void setSoReceivePerson(String soReceivePerson) {
		this.soReceivePerson = soReceivePerson;
	}

	public Set getAmcSodetails() {
		return this.amcSodetails;
	}

	public void setAmcSodetails(Set amcSodetails) {
		this.amcSodetails = amcSodetails;
	}

	public Set getAmcReceivables() {
		return this.amcReceivables;
	}

	public void setAmcReceivables(Set amcReceivables) {
		this.amcReceivables = amcReceivables;
	}

	public Set getAmcStockorders() {
		return this.amcStockorders;
	}

	public void setAmcStockorders(Set amcStockorders) {
		this.amcStockorders = amcStockorders;
	}

}