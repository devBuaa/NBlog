package com.nblog.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nblog.bean.User;
import com.nblog.service.UserService;

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
	public ModelAndView getUser(HttpServletRequest request,HttpServletResponse response){
		int userId = Integer.parseInt(request.getParameter("id"));  
        User user = this.userService.getUserById(userId);  
        Logger logger=Logger.getLogger(UserController.class);
        logger.info(user.toString());  
		return new ModelAndView("index", "user",user);
	}
	
	

}
