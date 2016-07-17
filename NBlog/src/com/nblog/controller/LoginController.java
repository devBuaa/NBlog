package com.nblog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author hsu
 *  登陆控制器
 *  包含：
 *  1.注册（网页注册）
 *  2.登陆
 *  3.找回密码
 *  4.邮箱注册（暂未实现）
 *  5.手机注册（暂未实现）
 *  
 *  
 */
@Controller
public class LoginController {
	/**
	 * 注册界面跳转
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/regist")  
	public ModelAndView registerForward(HttpServletRequest request,HttpServletResponse response){
		return new ModelAndView("common/register");
	}
	/**注册
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/register")  
	public ModelAndView register(HttpServletRequest request,HttpServletResponse response){
		
		return null;
	}
	/**登录界面跳转
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/lgin")  
	public ModelAndView loginForwaard(HttpServletRequest request,HttpServletResponse response){
		
		return new ModelAndView("common/login");
	}
	
	/**登陆
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/login")  
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response){
	
		return new ModelAndView("common/login");
	}
}
