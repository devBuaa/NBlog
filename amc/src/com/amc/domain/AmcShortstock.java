package com.amc.domain;

/**
 * AmcShortstock entity. @author MyEclipse Persistence Tools
 */

public class AmcShortstock implements java.io.Serializable {

	// Fields

	private Integer id;
	private AmcProduct amcProduct;
	private Float purchaseprice;
	private Integer inventory;
	private Integer safeamount;
	private Integer stockamount;
	private Integer totalamount;
	private Float totalprice;

	// Constructors

	/** default constructor */
	public AmcShortstock() {
	}

	/** minimal constructor */
	public AmcShortstock(AmcProduct amcProduct, Float purchaseprice,
			Integer inventory, Integer safeamount, Integer totalamount,
			Float totalprice) {
		this.amcProduct = amcProduct;
		this.purchaseprice = purchaseprice;
		this.inventory = inventory;
		this.safeamount = safeamount;
		this.totalamount = totalamount;
		this.totalprice = totalprice;
	}

	/** full constructor */
	public AmcShortstock(AmcProduct amcProduct, Float purchaseprice,
			Integer inventory, Integer safeamount, Integer stockamount,
			Integer totalamount, Float totalprice) {
		this.amcProduct = amcProduct;
		this.purchaseprice = purchaseprice;
		this.inventory = inventory;
		this.safeamount = safeamount;
		this.stockamount = stockamount;
		this.totalamount = totalamount;
		this.totalprice = totalprice;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public AmcProduct getAmcProduct() {
		return this.amcProduct;
	}

	public void setAmcProduct(AmcProduct amcProduct) {
		this.amcProduct = amcProduct;
	}

	public Float getPurchaseprice() {
		return this.purchaseprice;
	}

	public void setPurchaseprice(Float purchaseprice) {
		this.purchaseprice = purchaseprice;
	}

	public Integer getInventory() {
		return this.inventory;
	}

	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}

	public Integer getSafeamount() {
		return this.safeamount;
	}

	public void setSafeamount(Integer safeamount) {
		this.safeamount = safeamount;
	}

	public Integer getStockamount() {
		return this.stockamount;
	}

	public void setStockamount(Integer stockamount) {
		this.stockamount = stockamount;
	}

	public Integer getTotalamount() {
		return this.totalamount;
	}

	public void setTotalamount(Integer totalamount) {
		this.totalamount = totalamount;
	}

	public Float getTotalprice() {
		return this.totalprice;
	}

	public void setTotalprice(Float totalprice) {
		this.totalprice = totalprice;
	}

}