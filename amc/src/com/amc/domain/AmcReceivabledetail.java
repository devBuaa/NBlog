package com.amc.domain;

/**
 * AmcReceivabledetail entity. @author MyEclipse Persistence Tools
 */

public class AmcReceivabledetail implements java.io.Serializable {

	// Fields

	private Integer rcdid;
	private AmcProduct amcProduct;
	private AmcReceivable amcReceivable;
	private Float rcdsaleprice;
	private Integer rcdamount;
	private Float rcdsum;

	// Constructors

	/** default constructor */
	public AmcReceivabledetail() {
	}

	/** full constructor */
	public AmcReceivabledetail(AmcProduct amcProduct,
			AmcReceivable amcReceivable, Float rcdsaleprice, Integer rcdamount,
			Float rcdsum) {
		this.amcProduct = amcProduct;
		this.amcReceivable = amcReceivable;
		this.rcdsaleprice = rcdsaleprice;
		this.rcdamount = rcdamount;
		this.rcdsum = rcdsum;
	}

	// Property accessors

	public Integer getRcdid() {
		return this.rcdid;
	}

	public void setRcdid(Integer rcdid) {
		this.rcdid = rcdid;
	}

	public AmcProduct getAmcProduct() {
		return this.amcProduct;
	}

	public void setAmcProduct(AmcProduct amcProduct) {
		this.amcProduct = amcProduct;
	}

	public AmcReceivable getAmcReceivable() {
		return this.amcReceivable;
	}

	public void setAmcReceivable(AmcReceivable amcReceivable) {
		this.amcReceivable = amcReceivable;
	}

	public Float getRcdsaleprice() {
		return this.rcdsaleprice;
	}

	public void setRcdsaleprice(Float rcdsaleprice) {
		this.rcdsaleprice = rcdsaleprice;
	}

	public Integer getRcdamount() {
		return this.rcdamount;
	}

	public void setRcdamount(Integer rcdamount) {
		this.rcdamount = rcdamount;
	}

	public Float getRcdsum() {
		return this.rcdsum;
	}

	public void setRcdsum(Float rcdsum) {
		this.rcdsum = rcdsum;
	}

}