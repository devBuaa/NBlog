package com.nblog.bean;

import com.nblog.annotation.TableSeg;
import com.nblog.util.FormMap;
/**
 * @author hsu
 * Resources 代表菜单类
 */
@TableSeg(tableName = "resources",id = "Id")
public class Resources extends FormMap<String, Object> {
	private static final long serialVersionUID = 1L;
	
	private String Id;
	private String Name;
	private int ParentId;
	private String ResKey;
	private String Type;
	private String Url;
	private int Level;
	private String Icon;
	private int IsHide;
	private String Description;
	
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public int getParentId() {
		return ParentId;
	}
	public void setParentId(int parentId) {
		ParentId = parentId;
	}
	public String getResKey() {
		return ResKey;
	}
	public void setResKey(String resKey) {
		ResKey = resKey;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public String getUrl() {
		return Url;
	}
	public void setUrl(String url) {
		Url = url;
	}
	public int getLevel() {
		return Level;
	}
	public void setLevel(int level) {
		Level = level;
	}
	public String getIcon() {
		return Icon;
	}
	public void setIcon(String icon) {
		Icon = icon;
	}
	public int getIsHide() {
		return IsHide;
	}
	public void setIsHide(int isHide) {
		IsHide = isHide;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	
	
}
