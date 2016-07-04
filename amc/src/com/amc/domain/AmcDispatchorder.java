package com.amc.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * AmcDispatchorder entity. @author MyEclipse Persistence Tools
 */

public class AmcDispatchorder implements java.io.Serializable {

	// Fields

	private Integer dsid;
	private AmcUser amcUser;
	private AmcSalesorder amcSalesorder;
	private AmcCustomer amcCustomer;
	private Date dsdate;
	private Float dstsize;
	private Float dstweight;
	private Set amcDodetails = new HashSet(0);

	// Constructors

	/** default constructor */
	public AmcDispatchorder() {
	}

	/** minimal constructor */
	public AmcDispatchorder(AmcUser amcUser, AmcSalesorder amcSalesorder,
			AmcCustomer amcCustomer, Date dsdate, Float dstsize, Float dstweight) {
		this.amcUser = amcUser;
		this.amcSalesorder = amcSalesorder;
		this.amcCustomer = amcCustomer;
		this.dsdate = dsdate;
		this.dstsize = dstsize;
		this.dstweight = dstweight;
	}

	/** full constructor */
	public AmcDispatchorder(AmcUser amcUser, AmcSalesorder amcSalesorder,
			AmcCustomer amcCustomer, Date dsdate, Float dstsize,
			Float dstweight, Set amcDodetails) {
		this.amcUser = amcUser;
		this.amcSalesorder = amcSalesorder;
		this.amcCustomer = amcCustomer;
		this.dsdate = dsdate;
		this.dstsize = dstsize;
		this.dstweight = dstweight;
		this.amcDodetails = amcDodetails;
	}

	// Property accessors

	public Integer getDsid() {
		return this.dsid;
	}

	public void setDsid(Integer dsid) {
		this.dsid = dsid;
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

	public AmcCustomer getAmcCustomer() {
		return this.amcCustomer;
	}

	public void setAmcCustomer(AmcCustomer amcCustomer) {
		this.amcCustomer = amcCustomer;
	}

	public Date getDsdate() {
		return this.dsdate;
	}

	public void setDsdate(Date dsdate) {
		this.dsdate = dsdate;
	}

	public Float getDstsize() {
		return this.dstsize;
	}

	public void setDstsize(Float dstsize) {
		this.dstsize = dstsize;
	}

	public Float getDstweight() {
		return this.dstweight;
	}

	public void setDstweight(Float dstweight) {
		this.dstweight = dstweight;
	}

	public Set getAmcDodetails() {
		return this.amcDodetails;
	}

	public void setAmcDodetails(Set amcDodetails) {
		this.amcDodetails = amcDodetails;
	}

}