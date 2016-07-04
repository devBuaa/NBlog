package com.amc.domain;

/**
 * AmcWsdetail entity. @author MyEclipse Persistence Tools
 */

public class AmcWsdetail implements java.io.Serializable {

	// Fields

	private Integer wsdid;
	private AmcWantslip amcWantslip;
	private AmcProduct amcProduct;
	private Integer wsdamount;

	// Constructors

	/** default constructor */
	public AmcWsdetail() {
	}

	/** full constructor */
	public AmcWsdetail(AmcWantslip amcWantslip, AmcProduct amcProduct,
			Integer wsdamount) {
		this.amcWantslip = amcWantslip;
		this.amcProduct = amcProduct;
		this.wsdamount = wsdamount;
	}

	// Property accessors

	public Integer getWsdid() {
		return this.wsdid;
	}

	public void setWsdid(Integer wsdid) {
		this.wsdid = wsdid;
	}

	public AmcWantslip getAmcWantslip() {
		return this.amcWantslip;
	}

	public void setAmcWantslip(AmcWantslip amcWantslip) {
		this.amcWantslip = amcWantslip;
	}

	public AmcProduct getAmcProduct() {
		return this.amcProduct;
	}

	public void setAmcProduct(AmcProduct amcProduct) {
		this.amcProduct = amcProduct;
	}

	public Integer getWsdamount() {
		return this.wsdamount;
	}

	public void setWsdamount(Integer wsdamount) {
		this.wsdamount = wsdamount;
	}

}