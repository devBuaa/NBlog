package com.amc.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * AmcCustomer entity. @author MyEclipse Persistence Tools
 */

public class AmcCustomer implements java.io.Serializable {

	// Fields

	private Integer cid;
	private String cname;
	private String cphone;
	private String caddress;
	private Integer ctype;
	private Integer ccredit;
	private Set amcSalesorders = new HashSet(0);
	private Set amcDispatchorders = new HashSet(0);
	private Set amcCustomercompanies = new HashSet(0);

	// Constructors

	/** default constructor */
	public AmcCustomer() {
	}

	/** minimal constructor */
	public AmcCustomer(String cname, String cphone, String caddress) {
		this.cname = cname;
		this.cphone = cphone;
		this.caddress = caddress;
	}

	/** full constructor */
	public AmcCustomer(String cname, String cphone, String caddress,
			Integer ctype, Integer ccredit, Set amcSalesorders,
			Set amcDispatchorders, Set amcCustomercompanies) {
		this.cname = cname;
		this.cphone = cphone;
		this.caddress = caddress;
		this.ctype = ctype;
		this.ccredit = ccredit;
		this.amcSalesorders = amcSalesorders;
		this.amcDispatchorders = amcDispatchorders;
		this.amcCustomercompanies = amcCustomercompanies;
	}

	// Property accessors

	public Integer getCid() {
		return this.cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCphone() {
		return this.cphone;
	}

	public void setCphone(String cphone) {
		this.cphone = cphone;
	}

	public String getCaddress() {
		return this.caddress;
	}

	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}

	public Integer getCtype() {
		return this.ctype;
	}

	public void setCtype(Integer ctype) {
		this.ctype = ctype;
	}

	public Integer getCcredit() {
		return this.ccredit;
	}

	public void setCcredit(Integer ccredit) {
		this.ccredit = ccredit;
	}

	public Set getAmcSalesorders() {
		return this.amcSalesorders;
	}

	public void setAmcSalesorders(Set amcSalesorders) {
		this.amcSalesorders = amcSalesorders;
	}

	public Set getAmcDispatchorders() {
		return this.amcDispatchorders;
	}

	public void setAmcDispatchorders(Set amcDispatchorders) {
		this.amcDispatchorders = amcDispatchorders;
	}

	public Set getAmcCustomercompanies() {
		return this.amcCustomercompanies;
	}

	public void setAmcCustomercompanies(Set amcCustomercompanies) {
		this.amcCustomercompanies = amcCustomercompanies;
	}

}