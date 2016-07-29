package com.nblog.bean;

import com.nblog.annotation.TableSeg;

@TableSeg(tableName="UserRole",id="userno")
public class UserRole {
    private String userno;

    private Integer roleid;

    public String getUserno() {
        return userno;
    }

    public void setUserno(String userno) {
        this.userno = userno == null ? null : userno.trim();
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    
}