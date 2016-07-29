package com.nblog.bean;

import com.nblog.annotation.TableSeg;

@TableSeg(tableName="User",id="")
public class UserPasswordChange {
    private String name;

    private String oldpassword;

    private String newpassword;

    private String changetime;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getOldpassword() {
        return oldpassword;
    }

    public void setOldpassword(String oldpassword) {
        this.oldpassword = oldpassword == null ? null : oldpassword.trim();
    }

    public String getNewpassword() {
        return newpassword;
    }

    public void setNewpassword(String newpassword) {
        this.newpassword = newpassword == null ? null : newpassword.trim();
    }

    public String getChangetime() {
        return changetime;
    }

    public void setChangetime(String changetime) {
        this.changetime = changetime == null ? null : changetime.trim();
    }
}