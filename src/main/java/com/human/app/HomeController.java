package com.human.app;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private HttpSession session;
	@Autowired
	private SqlSession sqlSession;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/")
	public String home() {
		return"home";
	}
	@RequestMapping(value = "/newbie", method = RequestMethod.GET)
		public String selected(HttpServletRequest hsr) {
			return "newbie";
	}
	@RequestMapping(value="/check_user",method= RequestMethod.POST)
	public String check_user(HttpServletRequest hsr, Model model) {
		String uid = hsr.getParameter("uid");
		String pw = hsr.getParameter("pw");
		session = hsr.getSession();
		session.setAttribute("loginid",	uid);
		return "redirect:/booking";
	}
	@RequestMapping(value="/booking", method= RequestMethod.GET) 
	public String booking(HttpServletRequest hsr) {
		session = hsr.getSession();
		String loginid= (String)session.getAttribute("loginid");
		if(loginid.equals("") || loginid==null) {
			return "redirect:/";
		}
		return "booking";	
	}
	@RequestMapping("/room") 
	public String newInfo(HttpServletRequest hsr, Model model) {
		session = hsr.getSession();
		String loginid = (String)session.getAttribute("loginid");
		if(loginid==null || loginid.equals("")) {
			return "redirect:/";
		}
		// interface 호출하고 결과를 room.jsp에 전달.
		iRoom room = sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roomInfo = room.getRoomList();
		ArrayList<RoomType> roomType = room.getRoomType();
		model.addAttribute("list", roomInfo);
		model.addAttribute("type", roomType);
		return "room";		
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) {
		session = hsr.getSession();
		session.invalidate();
		return "redirect:/";
	}
}
