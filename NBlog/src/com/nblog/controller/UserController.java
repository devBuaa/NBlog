package com.nblog.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nblog.bean.User;
import com.nblog.service.UserService;
import com.nblog.util.Page;

/**
 * 用户管理控制器
 * @author hsu
 * 1.修改用户信息
 * 2.修改用户密码
 * 3.新增用户（管理员权限）
 * 4.删除用户（管理员权限）
 * 5.锁定用户（管理员权限）
 * 6.展示用户信息
 * 
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	
	
	@RequestMapping("/showUser")  
	public ModelAndView getUsers(String pageNo,HttpServletRequest request,HttpServletResponse response){
	    Page<User> page = new Page<User>();
        page.setPageNo(Integer.parseInt(pageNo));
        List<User> users = this.userService.getUserByPage(page);
        page.setResults(users);
		return new ModelAndView("index", "page",page);
	}
	
	

}
