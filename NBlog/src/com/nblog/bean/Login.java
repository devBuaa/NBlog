package com.nblog.bean;

import com.nblog.annotation.TableSeg;

@TableSeg(tableName="Login",id="systemno")
public class Login {
    private String systemno;

    private String name;

    private String loginip;

    private String loginbrowser;

    private String offlinetime;

    public String getSystemno() {
        return systemno;
    }

    public void setSystemno(String systemno) {
        this.systemno = systemno == null ? null : systemno.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getLoginip() {
        return loginip;
    }

    public void setLoginip(String loginip) {
        this.loginip = loginip == null ? null : loginip.trim();
    }

    public String getLoginbrowser() {
        return loginbrowser;
    }

    public void setLoginbrowser(String loginbrowser) {
        this.loginbrowser = loginbrowser == null ? null : loginbrowser.trim();
    }

    public String getOfflinetime() {
        return offlinetime;
    }

    public void setOfflinetime(String offlinetime) {
        this.offlinetime = offlinetime == null ? null : offlinetime.trim();
    }
}