package com.amc.web.ajax;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amc.util.VerifyUtils;

/**
 * Servlet implementation class IdentityServlet
 */
public class IdentityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		Object[] objects = VerifyUtils.getCaptchaImage(100, 30, 18, 5, 30,
				true, true, VerifyUtils.ComplexLevel.SIMPLE);

		request.getSession().setAttribute("identity", objects[1]);
		ImageIO.write((BufferedImage) objects[0], "jpg",
				response.getOutputStream());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

	/*
	 * 旧方法
	 * 
	 * public static final char[] chars = { '2', '3', '4', '5', '6', '7', '8',
	 * '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'j', 'k', 'm', 'n', 'p',
	 * 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y' }; public static Random
	 * random=new Random();
	 * 
	 * public static Color getRandomColor(){ return new
	 * Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)); }
	 * public static Color getReverseColor(Color c){ return new
	 * Color(255-c.getRed(),255-c.getGreen(),255-c.getBlue()); }
	 * 
	 * Color color=getRandomColor(); Color revColor=getReverseColor(color); int
	 * w=100; int h=30; BufferedImage bufferedImage=new BufferedImage(w, h,
	 * BufferedImage.TYPE_INT_RGB); Graphics
	 * graphics=bufferedImage.getGraphics(); graphics.setColor(color);
	 * graphics.drawRect(0, 0, w, h); graphics.fillRect(1, 1, w-2, h-2);
	 * graphics.setColor(revColor);
	 * 
	 * for(int i=0;i<5;i++){ graphics.drawLine(random.nextInt(w),
	 * random.nextInt(h), random.nextInt(w), random.nextInt(h)); } for(int
	 * i=0;i<20;i++){ graphics.drawRect(random.nextInt(w), random.nextInt(h), 1,
	 * 1); }
	 * 
	 * graphics.setColor(revColor); graphics.setFont(new Font("宋体",
	 * Font.BOLD|Font.ITALIC, 20)); for(int i=0;i<4;i++){ int
	 * n=random.nextInt(chars.length); char c=chars[n];
	 * graphics.drawString(c+"",15*(i+1)+(n>7?7:n),18+i); sb.append(c); }
	 * request.getSession().setAttribute("code", sb.toString());
	 * ImageIO.write(bufferedImage,"jpg", response.getOutputStream());
	 */

}
