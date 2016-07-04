package com.amc.domain;

/**
 * AmcDodetail entity. @author MyEclipse Persistence Tools
 */

public class AmcDodetail implements java.io.Serializable {

	// Fields

	private Integer dsdid;
	private AmcProduct amcProduct;
	private AmcDispatchorder amcDispatchorder;
	private Float dsdsize;
	private Float dsdweight;
	private Integer dsdamount;

	// Constructors

	/** default constructor */
	public AmcDodetail() {
	}

	/** full constructor */
	public AmcDodetail(AmcProduct amcProduct,
			AmcDispatchorder amcDispatchorder, Float dsdsize, Float dsdweight,
			Integer dsdamount) {
		this.amcProduct = amcProduct;
		this.amcDispatchorder = amcDispatchorder;
		this.dsdsize = dsdsize;
		this.dsdweight = dsdweight;
		this.dsdamount = dsdamount;
	}

	// Property accessors

	public Integer getDsdid() {
		return this.dsdid;
	}

	public void setDsdid(Integer dsdid) {
		this.dsdid = dsdid;
	}

	public AmcProduct getAmcProduct() {
		return this.amcProduct;
	}

	public void setAmcProduct(AmcProduct amcProduct) {
		this.amcProduct = amcProduct;
	}

	public AmcDispatchorder getAmcDispatchorder() {
		return this.amcDispatchorder;
	}

	public void setAmcDispatchorder(AmcDispatchorder amcDispatchorder) {
		this.amcDispatchorder = amcDispatchorder;
	}

	public Float getDsdsize() {
		return this.dsdsize;
	}

	public void setDsdsize(Float dsdsize) {
		this.dsdsize = dsdsize;
	}

	public Float getDsdweight() {
		return this.dsdweight;
	}

	public void setDsdweight(Float dsdweight) {
		this.dsdweight = dsdweight;
	}

	public Integer getDsdamount() {
		return this.dsdamount;
	}

	public void setDsdamount(Integer dsdamount) {
		this.dsdamount = dsdamount;
	}

}