package com.amc.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * AmcSupplier entity. @author MyEclipse Persistence Tools
 */

public class AmcSupplier implements java.io.Serializable {

	// Fields

	private Integer sid;
	private String sname;
	private String scontactPerson;
	private String saddress;
	private String sphone;
	private String semail;
	private Set amcPurchaseorders = new HashSet(0);

	// Constructors

	/** default constructor */
	public AmcSupplier() {
	}

	/** minimal constructor */
	public AmcSupplier(String sname, String scontactPerson, String saddress,
			String sphone) {
		this.sname = sname;
		this.scontactPerson = scontactPerson;
		this.saddress = saddress;
		this.sphone = sphone;
	}

	/** full constructor */
	public AmcSupplier(String sname, String scontactPerson, String saddress,
			String sphone, String semail, Set amcPurchaseorders) {
		this.sname = sname;
		this.scontactPerson = scontactPerson;
		this.saddress = saddress;
		this.sphone = sphone;
		this.semail = semail;
		this.amcPurchaseorders = amcPurchaseorders;
	}

	// Property accessors

	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getSname() {
		return this.sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getScontactPerson() {
		return this.scontactPerson;
	}

	public void setScontactPerson(String scontactPerson) {
		this.scontactPerson = scontactPerson;
	}

	public String getSaddress() {
		return this.saddress;
	}

	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}

	public String getSphone() {
		return this.sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public String getSemail() {
		return this.semail;
	}

	public void setSemail(String semail) {
		this.semail = semail;
	}

	public Set getAmcPurchaseorders() {
		return this.amcPurchaseorders;
	}

	public void setAmcPurchaseorders(Set amcPurchaseorders) {
		this.amcPurchaseorders = amcPurchaseorders;
	}

}