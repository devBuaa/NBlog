package com.nblog.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nblog.bean.User;
import com.nblog.dao.UserDao;
import com.nblog.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	
	/*@RequestMapping("/showUser")  
    public String toIndex(HttpServletRequest request,Model model){  
        int userId = Integer.parseInt(request.getParameter("id"));  
        User user = this.userService.getUserById(userId);  
        Logger logger=Logger.getLogger(UserController.class);
        logger.info(user.toString());
        model.addAttribute("user", user);  
        return "index";  
	}*/
	@RequestMapping("/showUser")  
	public ModelAndView getUser(HttpServletRequest request,HttpServletResponse response){
		int userId = Integer.parseInt(request.getParameter("id"));  
        User user = this.userService.getUserById(userId);  
        Logger logger=Logger.getLogger(UserController.class);
        logger.info(user.toString());  
		return new ModelAndView("index", "user",user);
	}
	
	@RequestMapping("/registerForward")  
	public ModelAndView registerForward(HttpServletRequest request,HttpServletResponse response){
		return new ModelAndView("common/register");
	}
	
	@RequestMapping("/register")  
	public ModelAndView register(HttpServletRequest request,HttpServletResponse response){
		String name=request.getParameter("userName");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		User user=new User();
		
		user.setSystemNo("1");
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setSignTime("20160715220801");
		userService.addUser(user);
		return new ModelAndView("common/login");
	}

}
