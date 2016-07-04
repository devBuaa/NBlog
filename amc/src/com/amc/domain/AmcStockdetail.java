package com.amc.domain;

/**
 * AmcStockdetail entity. @author MyEclipse Persistence Tools
 */

public class AmcStockdetail implements java.io.Serializable {

	// Fields

	private Integer stodid;
	private AmcStockorder amcStockorder;
	private AmcProduct amcProduct;
	private Integer stodamount;

	// Constructors

	/** default constructor */
	public AmcStockdetail() {
	}

	/** full constructor */
	public AmcStockdetail(AmcStockorder amcStockorder, AmcProduct amcProduct,
			Integer stodamount) {
		this.amcStockorder = amcStockorder;
		this.amcProduct = amcProduct;
		this.stodamount = stodamount;
	}

	// Property accessors

	public Integer getStodid() {
		return this.stodid;
	}

	public void setStodid(Integer stodid) {
		this.stodid = stodid;
	}

	public AmcStockorder getAmcStockorder() {
		return this.amcStockorder;
	}

	public void setAmcStockorder(AmcStockorder amcStockorder) {
		this.amcStockorder = amcStockorder;
	}

	public AmcProduct getAmcProduct() {
		return this.amcProduct;
	}

	public void setAmcProduct(AmcProduct amcProduct) {
		this.amcProduct = amcProduct;
	}

	public Integer getStodamount() {
		return this.stodamount;
	}

	public void setStodamount(Integer stodamount) {
		this.stodamount = stodamount;
	}

}