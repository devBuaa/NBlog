package com.nblog.bean;

import com.nblog.annotation.TableSeg;

@TableSeg(tableName="Resources",id="id")
public class Resources{
	private Integer id;
	private String name;
	private Integer parentId;
	private String resKey;
	private String type;
	private String url;
	private Integer level;
	private String icon;
	private Integer isHide;
	private String description;
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getId() {
		return this.id;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return this.name;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	
	public Integer getParentId() {
		return this.parentId;
	}
	public void setResKey(String resKey) {
		this.resKey = resKey;
	}
	
	public String getResKey() {
		return this.resKey;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getType() {
		return this.type;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getUrl() {
		return this.url;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	
	public Integer getLevel() {
		return this.level;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	public String getIcon() {
		return this.icon;
	}
	public void setIsHide(Integer isHide) {
		this.isHide = isHide;
	}
	
	public Integer getIsHide() {
		return this.isHide;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return this.description;
	}

	public String toString() {
		return new StringBuilder()
		    .append("Resources[")
		    .append("Id = "+id)
		    .append(",")
		    .append("Name = "+name)
		    .append(",")
		    .append("ParentId = "+parentId)
		    .append(",")
		    .append("ResKey = "+resKey)
		    .append(",")
		    .append("Type = "+type)
		    .append(",")
		    .append("Url = "+url)
		    .append(",")
		    .append("Level = "+level)
		    .append(",")
		    .append("Icon = "+icon)
		    .append(",")
		    .append("IsHide = "+isHide)
		    .append(",")
		    .append("Description = "+description)
		    .append("]").toString();
	}	
}
