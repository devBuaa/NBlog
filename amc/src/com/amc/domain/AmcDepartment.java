package com.amc.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * AmcDepartment entity. @author MyEclipse Persistence Tools
 */

public class AmcDepartment implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String description;
	private Set amcUsers = new HashSet(0);

	// Constructors

	/** default constructor */
	public AmcDepartment() {
	}

	/** minimal constructor */
	public AmcDepartment(String name) {
		this.name = name;
	}

	/** full constructor */
	public AmcDepartment(String name, String description, Set amcUsers) {
		this.name = name;
		this.description = description;
		this.amcUsers = amcUsers;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set getAmcUsers() {
		return this.amcUsers;
	}

	public void setAmcUsers(Set amcUsers) {
		this.amcUsers = amcUsers;
	}

}