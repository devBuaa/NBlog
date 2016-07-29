package com.nblog.bean;

import com.nblog.annotation.TableSeg;

@TableSeg(tableName="RoleResources",id="roleid")
public class RoleResources {
    private Integer roleid;

    private Integer resid;

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public Integer getResid() {
        return resid;
    }

    public void setResid(Integer resid) {
        this.resid = resid;
    }
}