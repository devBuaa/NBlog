package com.amc.domain;

/**
 * AmcSodetail entity. @author MyEclipse Persistence Tools
 */

public class AmcSodetail implements java.io.Serializable {

	// Fields

	private Integer sodid;
	private AmcSalesorder amcSalesorder;
	private AmcProduct amcProduct;
	private Integer sodamount;

	// Constructors

	/** default constructor */
	public AmcSodetail() {
	}

	/** full constructor */
	public AmcSodetail(AmcSalesorder amcSalesorder, AmcProduct amcProduct,
			Integer sodamount) {
		this.amcSalesorder = amcSalesorder;
		this.amcProduct = amcProduct;
		this.sodamount = sodamount;
	}

	// Property accessors

	public Integer getSodid() {
		return this.sodid;
	}

	public void setSodid(Integer sodid) {
		this.sodid = sodid;
	}

	public AmcSalesorder getAmcSalesorder() {
		return this.amcSalesorder;
	}

	public void setAmcSalesorder(AmcSalesorder amcSalesorder) {
		this.amcSalesorder = amcSalesorder;
	}

	public AmcProduct getAmcProduct() {
		return this.amcProduct;
	}

	public void setAmcProduct(AmcProduct amcProduct) {
		this.amcProduct = amcProduct;
	}

	public Integer getSodamount() {
		return this.sodamount;
	}

	public void setSodamount(Integer sodamount) {
		this.sodamount = sodamount;
	}

}