package com.amc.domain;

/**
 * AmcPodetail entity. @author MyEclipse Persistence Tools
 */

public class AmcPodetail implements java.io.Serializable {

	// Fields

	private Integer podid;
	private AmcPurchaseorder amcPurchaseorder;
	private AmcProduct amcProduct;
	private Integer podamount;
	private Integer podorderamount;
	private Integer podsafeamount;

	// Constructors

	/** default constructor */
	public AmcPodetail() {
	}

	/** minimal constructor */
	public AmcPodetail(AmcProduct amcProduct, Integer podamount) {
		this.amcProduct = amcProduct;
		this.podamount = podamount;
	}

	/** full constructor */
	public AmcPodetail(AmcPurchaseorder amcPurchaseorder,
			AmcProduct amcProduct, Integer podamount, Integer podorderamount,
			Integer podsafeamount) {
		this.amcPurchaseorder = amcPurchaseorder;
		this.amcProduct = amcProduct;
		this.podamount = podamount;
		this.podorderamount = podorderamount;
		this.podsafeamount = podsafeamount;
	}

	// Property accessors

	public Integer getPodid() {
		return this.podid;
	}

	public void setPodid(Integer podid) {
		this.podid = podid;
	}

	public AmcPurchaseorder getAmcPurchaseorder() {
		return this.amcPurchaseorder;
	}

	public void setAmcPurchaseorder(AmcPurchaseorder amcPurchaseorder) {
		this.amcPurchaseorder = amcPurchaseorder;
	}

	public AmcProduct getAmcProduct() {
		return this.amcProduct;
	}

	public void setAmcProduct(AmcProduct amcProduct) {
		this.amcProduct = amcProduct;
	}

	public Integer getPodamount() {
		return this.podamount;
	}

	public void setPodamount(Integer podamount) {
		this.podamount = podamount;
	}

	public Integer getPodorderamount() {
		return this.podorderamount;
	}

	public void setPodorderamount(Integer podorderamount) {
		this.podorderamount = podorderamount;
	}

	public Integer getPodsafeamount() {
		return this.podsafeamount;
	}

	public void setPodsafeamount(Integer podsafeamount) {
		this.podsafeamount = podsafeamount;
	}

}