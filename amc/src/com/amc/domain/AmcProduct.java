package com.amc.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * AmcProduct entity. @author MyEclipse Persistence Tools
 */

public class AmcProduct implements java.io.Serializable {

	// Fields

	private Integer pid;
	private String pname;
	private Float psize;
	private Float pweight;
	private Float psaleprice;
	private Float ppurchaseprice;
	private Integer pinventoryamount;
	private Integer psafeamount;
	private Integer pinventorystate;
	private Integer pshortamount;
	private Set amcPodetails = new HashSet(0);
	private Set amcReceivabledetails = new HashSet(0);
	private Set amcDodetails = new HashSet(0);
	private Set amcReplenishdetails = new HashSet(0);
	private Set amcShortstocks = new HashSet(0);
	private Set amcShortstocks_1 = new HashSet(0);
	private Set amcSodetails = new HashSet(0);
	private Set amcPayabledetails = new HashSet(0);
	private Set amcStockdetails = new HashSet(0);
	private Set amcWsdetails = new HashSet(0);

	// Constructors

	/** default constructor */
	public AmcProduct() {
	}

	/** minimal constructor */
	public AmcProduct(String pname, Float psize, Float pweight,
			Float ppurchaseprice, Integer pinventoryamount,
			Integer psafeamount, Integer pinventorystate) {
		this.pname = pname;
		this.psize = psize;
		this.pweight = pweight;
		this.ppurchaseprice = ppurchaseprice;
		this.pinventoryamount = pinventoryamount;
		this.psafeamount = psafeamount;
		this.pinventorystate = pinventorystate;
	}

	/** full constructor */
	public AmcProduct(String pname, Float psize, Float pweight,
			Float psaleprice, Float ppurchaseprice, Integer pinventoryamount,
			Integer psafeamount, Integer pinventorystate, Integer pshortamount,
			Set amcPodetails, Set amcReceivabledetails, Set amcDodetails,
			Set amcReplenishdetails, Set amcShortstocks, Set amcShortstocks_1,
			Set amcSodetails, Set amcPayabledetails, Set amcStockdetails,
			Set amcWsdetails) {
		this.pname = pname;
		this.psize = psize;
		this.pweight = pweight;
		this.psaleprice = psaleprice;
		this.ppurchaseprice = ppurchaseprice;
		this.pinventoryamount = pinventoryamount;
		this.psafeamount = psafeamount;
		this.pinventorystate = pinventorystate;
		this.pshortamount = pshortamount;
		this.amcPodetails = amcPodetails;
		this.amcReceivabledetails = amcReceivabledetails;
		this.amcDodetails = amcDodetails;
		this.amcReplenishdetails = amcReplenishdetails;
		this.amcShortstocks = amcShortstocks;
		this.amcShortstocks_1 = amcShortstocks_1;
		this.amcSodetails = amcSodetails;
		this.amcPayabledetails = amcPayabledetails;
		this.amcStockdetails = amcStockdetails;
		this.amcWsdetails = amcWsdetails;
	}

	// Property accessors

	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Float getPsize() {
		return this.psize;
	}

	public void setPsize(Float psize) {
		this.psize = psize;
	}

	public Float getPweight() {
		return this.pweight;
	}

	public void setPweight(Float pweight) {
		this.pweight = pweight;
	}

	public Float getPsaleprice() {
		return this.psaleprice;
	}

	public void setPsaleprice(Float psaleprice) {
		this.psaleprice = psaleprice;
	}

	public Float getPpurchaseprice() {
		return this.ppurchaseprice;
	}

	public void setPpurchaseprice(Float ppurchaseprice) {
		this.ppurchaseprice = ppurchaseprice;
	}

	public Integer getPinventoryamount() {
		return this.pinventoryamount;
	}

	public void setPinventoryamount(Integer pinventoryamount) {
		this.pinventoryamount = pinventoryamount;
	}

	public Integer getPsafeamount() {
		return this.psafeamount;
	}

	public void setPsafeamount(Integer psafeamount) {
		this.psafeamount = psafeamount;
	}

	public Integer getPinventorystate() {
		return this.pinventorystate;
	}

	public void setPinventorystate(Integer pinventorystate) {
		this.pinventorystate = pinventorystate;
	}

	public Integer getPshortamount() {
		return this.pshortamount;
	}

	public void setPshortamount(Integer pshortamount) {
		this.pshortamount = pshortamount;
	}

	public Set getAmcPodetails() {
		return this.amcPodetails;
	}

	public void setAmcPodetails(Set amcPodetails) {
		this.amcPodetails = amcPodetails;
	}

	public Set getAmcReceivabledetails() {
		return this.amcReceivabledetails;
	}

	public void setAmcReceivabledetails(Set amcReceivabledetails) {
		this.amcReceivabledetails = amcReceivabledetails;
	}

	public Set getAmcDodetails() {
		return this.amcDodetails;
	}

	public void setAmcDodetails(Set amcDodetails) {
		this.amcDodetails = amcDodetails;
	}

	public Set getAmcReplenishdetails() {
		return this.amcReplenishdetails;
	}

	public void setAmcReplenishdetails(Set amcReplenishdetails) {
		this.amcReplenishdetails = amcReplenishdetails;
	}

	public Set getAmcShortstocks() {
		return this.amcShortstocks;
	}

	public void setAmcShortstocks(Set amcShortstocks) {
		this.amcShortstocks = amcShortstocks;
	}

	public Set getAmcShortstocks_1() {
		return this.amcShortstocks_1;
	}

	public void setAmcShortstocks_1(Set amcShortstocks_1) {
		this.amcShortstocks_1 = amcShortstocks_1;
	}

	public Set getAmcSodetails() {
		return this.amcSodetails;
	}

	public void setAmcSodetails(Set amcSodetails) {
		this.amcSodetails = amcSodetails;
	}

	public Set getAmcPayabledetails() {
		return this.amcPayabledetails;
	}

	public void setAmcPayabledetails(Set amcPayabledetails) {
		this.amcPayabledetails = amcPayabledetails;
	}

	public Set getAmcStockdetails() {
		return this.amcStockdetails;
	}

	public void setAmcStockdetails(Set amcStockdetails) {
		this.amcStockdetails = amcStockdetails;
	}

	public Set getAmcWsdetails() {
		return this.amcWsdetails;
	}

	public void setAmcWsdetails(Set amcWsdetails) {
		this.amcWsdetails = amcWsdetails;
	}

}