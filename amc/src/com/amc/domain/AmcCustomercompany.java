package com.amc.domain;

/**
 * AmcCustomercompany entity. @author MyEclipse Persistence Tools
 */

public class AmcCustomercompany implements java.io.Serializable {

	// Fields

	private Integer cpid;
	private AmcCustomer amcCustomer;
	private String cpname;
	private String cpfr;

	// Constructors

	/** default constructor */
	public AmcCustomercompany() {
	}

	/** full constructor */
	public AmcCustomercompany(AmcCustomer amcCustomer, String cpname,
			String cpfr) {
		this.amcCustomer = amcCustomer;
		this.cpname = cpname;
		this.cpfr = cpfr;
	}

	// Property accessors

	public Integer getCpid() {
		return this.cpid;
	}

	public void setCpid(Integer cpid) {
		this.cpid = cpid;
	}

	public AmcCustomer getAmcCustomer() {
		return this.amcCustomer;
	}

	public void setAmcCustomer(AmcCustomer amcCustomer) {
		this.amcCustomer = amcCustomer;
	}

	public String getCpname() {
		return this.cpname;
	}

	public void setCpname(String cpname) {
		this.cpname = cpname;
	}

	public String getCpfr() {
		return this.cpfr;
	}

	public void setCpfr(String cpfr) {
		this.cpfr = cpfr;
	}

}