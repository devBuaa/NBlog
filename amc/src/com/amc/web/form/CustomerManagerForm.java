package com.amc.web.form;

import org.apache.struts.action.ActionForm;

public class CustomerManagerForm extends ActionForm {
	
	private String cid;
	private String cname;
	private String cphone;
	private String caddress;
	private String ccredit;
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCphone() {
		return cphone;
	}
	public void setCphone(String cphone) {
		this.cphone = cphone;
	}
	public String getCaddress() {
		return caddress;
	}
	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}
	public String getCcredit() {
		return ccredit;
	}
	public void setCcredit(String ccredit) {
		this.ccredit = ccredit;
	}
	
	

}
