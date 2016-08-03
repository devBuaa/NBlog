package com.nblog.bean;

import com.nblog.annotation.TableSeg;

@TableSeg(tableName="Role",id="id")
public class Role{
	private Integer id;
	private String state;
	private String name;
	private String flag;
	private String description;
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getId() {
		return this.id;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public String getState() {
		return this.state;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return this.name;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	public String getFlag() {
		return this.flag;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return this.description;
	}

	public String toString() {
		return new StringBuilder()
			.append("Id = "+id)
			.append(",")
			.append("State = "+state)
			.append(",")
			.append("Name = "+name)
			.append(",")
			.append("Flag = "+flag)
			.append(",")
			.append("Description = "+description)
			
			.toString();
	}	
}
