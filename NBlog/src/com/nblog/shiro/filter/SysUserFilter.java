package com.nblog.shiro.filter;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.filter.PathMatchingFilter;
import com.nblog.bean.User;
import com.nblog.dao.UserDao;


public class SysUserFilter extends PathMatchingFilter {

	@Inject
	private UserDao userDao;

    @Override
    protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {

        String username = (String)SecurityUtils.getSubject().getPrincipal();
        User user = new User();
		user.put("UserName", "" + username + "");
        request.setAttribute("user", userDao.findByNames(user));
        return true;
    }
}