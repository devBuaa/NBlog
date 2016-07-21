package com.nblog.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nblog.bean.User;
import com.nblog.service.BaseService;
import com.nblog.util.DateUtil;
import com.nblog.util.IDGenerator;
import com.nblog.util.PasswordHelper;
import com.nblog.util.StringUtil;

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
	@RequestMapping(value="/register", method = RequestMethod.GET)  
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
		PasswordHelper passwordHelper = new PasswordHelper();
		passwordHelper.encryptPassword(user);
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
	@RequestMapping(value="/login", method = RequestMethod.GET)  
	public ModelAndView loginForward(HttpServletRequest request,HttpServletResponse response){
		request.removeAttribute("error");
		return new ModelAndView("common/login");
	}
	
	/**登陆
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)  
	public ModelAndView login(String UserName, String Password,HttpServletRequest request,HttpServletResponse response){
		try {
			if (StringUtil.isEmpty(UserName) || StringUtil.isEmpty(Password)) {
				request.setAttribute("error", "用户名或密码不能为空！");
				return new ModelAndView("common/login");
			}
			// 想要得到 SecurityUtils.getSubject()　的对象．．访问地址必须跟shiro的拦截地址内．不然后会报空指针
			Subject user = SecurityUtils.getSubject();
			// 用户输入的账号和密码,,存到UsernamePasswordToken对象中..然后由shiro内部认证对比,
			// 认证执行者交由ShiroDbRealm中doGetAuthenticationInfo处理
			// 当以上认证成功后会向下执行,认证失败会抛出异常
			UsernamePasswordToken token = new UsernamePasswordToken(UserName,Password);
			try {
				user.login(token);
			} catch (LockedAccountException lae) {
				token.clear();
				request.setAttribute("error", "用户已经被锁定不能登录，请与管理员联系！");
				return new ModelAndView("common/login");
			} catch (ExcessiveAttemptsException e) {
				token.clear();
				request.setAttribute("error", "账号：" + UserName
						+ " 登录失败次数过多,锁定10分钟!");
				return new ModelAndView("common/login");
			} catch (AuthenticationException e) {
				token.clear();
				request.setAttribute("error", "用户或密码不正确！");
				return new ModelAndView("common/login");
			}
			// 设置登陆信息 插入到表中
			/*
			 * User userLogin = new UserLoginFormMap(); Session session =
			 * SecurityUtils.getSubject().getSession(); userLogin.put("userId",
			 * session.getAttribute("userSessionId"));
			 * userLogin.put("accountName", username); userLogin.put("loginIP",
			 * session.getHost()); userLoginMapper.addEntity(userLogin);
			 */
			request.removeAttribute("error");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "登录异常，请联系管理员！");
			return new ModelAndView("common/login");
		}
		return new ModelAndView("common/index");
	}
}
