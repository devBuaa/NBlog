package com.nblog.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nblog.bean.User;
import com.nblog.service.BaseService;
import com.nblog.util.DateUtil;
import com.nblog.util.IDGenerator;

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
	
	@Inject
	private BaseService baseService;
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
	@RequestMapping(value="/register", method = RequestMethod.POST)  
	public ModelAndView register(@ModelAttribute User user){
		
		user.setUserNo(IDGenerator.getInstance().getID());
		user.setSignTime(DateUtil.getTimestamp());
		try {
			baseService.insertBean(user);
			return new ModelAndView("common/login");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ModelAndView("index");//这里返回插入失败的信息
		}
		
		
	}
	/**登录界面跳转
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/lgin", method = RequestMethod.GET)  
	public ModelAndView loginForward(HttpServletRequest request,HttpServletResponse response){
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
