package com.amc.domain;

/**
 * AmcPayabledetail entity. @author MyEclipse Persistence Tools
 */

public class AmcPayabledetail implements java.io.Serializable {

	// Fields

	private Integer paydid;
	private AmcPayable amcPayable;
	private AmcProduct amcProduct;
	private Float paydprice;
	private Integer paydamount;
	private Float paydsum;

	// Constructors

	/** default constructor */
	public AmcPayabledetail() {
	}

	/** full constructor */
	public AmcPayabledetail(AmcPayable amcPayable, AmcProduct amcProduct,
			Float paydprice, Integer paydamount, Float paydsum) {
		this.amcPayable = amcPayable;
		this.amcProduct = amcProduct;
		this.paydprice = paydprice;
		this.paydamount = paydamount;
		this.paydsum = paydsum;
	}

	// Property accessors

	public Integer getPaydid() {
		return this.paydid;
	}

	public void setPaydid(Integer paydid) {
		this.paydid = paydid;
	}

	public AmcPayable getAmcPayable() {
		return this.amcPayable;
	}

	public void setAmcPayable(AmcPayable amcPayable) {
		this.amcPayable = amcPayable;
	}

	public AmcProduct getAmcProduct() {
		return this.amcProduct;
	}

	public void setAmcProduct(AmcProduct amcProduct) {
		this.amcProduct = amcProduct;
	}

	public Float getPaydprice() {
		return this.paydprice;
	}

	public void setPaydprice(Float paydprice) {
		this.paydprice = paydprice;
	}

	public Integer getPaydamount() {
		return this.paydamount;
	}

	public void setPaydamount(Integer paydamount) {
		this.paydamount = paydamount;
	}

	public Float getPaydsum() {
		return this.paydsum;
	}

	public void setPaydsum(Float paydsum) {
		this.paydsum = paydsum;
	}

}