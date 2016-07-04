package com.amc.domain;

/**
 * AmcReplenishdetail entity. @author MyEclipse Persistence Tools
 */

public class AmcReplenishdetail implements java.io.Serializable {

	// Fields

	private Integer rdid;
	private AmcReplenishsheet amcReplenishsheet;
	private AmcProduct amcProduct;
	private Integer rdamount;

	// Constructors

	/** default constructor */
	public AmcReplenishdetail() {
	}

	/** full constructor */
	public AmcReplenishdetail(AmcReplenishsheet amcReplenishsheet,
			AmcProduct amcProduct, Integer rdamount) {
		this.amcReplenishsheet = amcReplenishsheet;
		this.amcProduct = amcProduct;
		this.rdamount = rdamount;
	}

	// Property accessors

	public Integer getRdid() {
		return this.rdid;
	}

	public void setRdid(Integer rdid) {
		this.rdid = rdid;
	}

	public AmcReplenishsheet getAmcReplenishsheet() {
		return this.amcReplenishsheet;
	}

	public void setAmcReplenishsheet(AmcReplenishsheet amcReplenishsheet) {
		this.amcReplenishsheet = amcReplenishsheet;
	}

	public AmcProduct getAmcProduct() {
		return this.amcProduct;
	}

	public void setAmcProduct(AmcProduct amcProduct) {
		this.amcProduct = amcProduct;
	}

	public Integer getRdamount() {
		return this.rdamount;
	}

	public void setRdamount(Integer rdamount) {
		this.rdamount = rdamount;
	}

}