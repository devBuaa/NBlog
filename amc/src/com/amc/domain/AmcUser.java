package com.amc.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * AmcUser entity. @author MyEclipse Persistence Tools
 */

public class AmcUser implements java.io.Serializable {

	// Fields

	private Integer id;
	private AmcRole amcRole;
	private AmcDepartment amcDepartment;
	private String name;
	private String password;
	private Set amcStockorders = new HashSet(0);
	private Set amcReplenishsheets = new HashSet(0);
	private Set amcSalesorders = new HashSet(0);
	private Set amcReceivables = new HashSet(0);
	private Set amcPayables = new HashSet(0);
	private Set amcPurchaseorders = new HashSet(0);
	private Set amcDispatchorders = new HashSet(0);
	private Set amcWantslips = new HashSet(0);

	// Constructors

	/** default constructor */
	public AmcUser() {
	}

	/** minimal constructor */
	public AmcUser(AmcRole amcRole, AmcDepartment amcDepartment, String name,
			String password) {
		this.amcRole = amcRole;
		this.amcDepartment = amcDepartment;
		this.name = name;
		this.password = password;
	}

	/** full constructor */
	public AmcUser(AmcRole amcRole, AmcDepartment amcDepartment, String name,
			String password, Set amcStockorders, Set amcReplenishsheets,
			Set amcSalesorders, Set amcReceivables, Set amcPayables,
			Set amcPurchaseorders, Set amcDispatchorders, Set amcWantslips) {
		this.amcRole = amcRole;
		this.amcDepartment = amcDepartment;
		this.name = name;
		this.password = password;
		this.amcStockorders = amcStockorders;
		this.amcReplenishsheets = amcReplenishsheets;
		this.amcSalesorders = amcSalesorders;
		this.amcReceivables = amcReceivables;
		this.amcPayables = amcPayables;
		this.amcPurchaseorders = amcPurchaseorders;
		this.amcDispatchorders = amcDispatchorders;
		this.amcWantslips = amcWantslips;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public AmcRole getAmcRole() {
		return this.amcRole;
	}

	public void setAmcRole(AmcRole amcRole) {
		this.amcRole = amcRole;
	}

	public AmcDepartment getAmcDepartment() {
		return this.amcDepartment;
	}

	public void setAmcDepartment(AmcDepartment amcDepartment) {
		this.amcDepartment = amcDepartment;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set getAmcStockorders() {
		return this.amcStockorders;
	}

	public void setAmcStockorders(Set amcStockorders) {
		this.amcStockorders = amcStockorders;
	}

	public Set getAmcReplenishsheets() {
		return this.amcReplenishsheets;
	}

	public void setAmcReplenishsheets(Set amcReplenishsheets) {
		this.amcReplenishsheets = amcReplenishsheets;
	}

	public Set getAmcSalesorders() {
		return this.amcSalesorders;
	}

	public void setAmcSalesorders(Set amcSalesorders) {
		this.amcSalesorders = amcSalesorders;
	}

	public Set getAmcReceivables() {
		return this.amcReceivables;
	}

	public void setAmcReceivables(Set amcReceivables) {
		this.amcReceivables = amcReceivables;
	}

	public Set getAmcPayables() {
		return this.amcPayables;
	}

	public void setAmcPayables(Set amcPayables) {
		this.amcPayables = amcPayables;
	}

	public Set getAmcPurchaseorders() {
		return this.amcPurchaseorders;
	}

	public void setAmcPurchaseorders(Set amcPurchaseorders) {
		this.amcPurchaseorders = amcPurchaseorders;
	}

	public Set getAmcDispatchorders() {
		return this.amcDispatchorders;
	}

	public void setAmcDispatchorders(Set amcDispatchorders) {
		this.amcDispatchorders = amcDispatchorders;
	}

	public Set getAmcWantslips() {
		return this.amcWantslips;
	}

	public void setAmcWantslips(Set amcWantslips) {
		this.amcWantslips = amcWantslips;
	}

}