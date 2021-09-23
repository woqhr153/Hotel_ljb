package com.human.app;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


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
	public String home(HttpServletRequest hsr) {

		return"home";
	}
	@RequestMapping(value = "/newbie", method = RequestMethod.GET)
		public String selected(HttpServletRequest hsr) {
			session = hsr.getSession();
			session.invalidate();
			return "newbie";
	}
	@RequestMapping(value="/check_user",method= RequestMethod.POST)
	public String check_user(HttpServletRequest hsr, Model model) {
		String uid = hsr.getParameter("uid");
		String pw = hsr.getParameter("pw");
		Member member = sqlSession.getMapper(Member.class);
		int n = member.doLogin(uid,pw);
		if(n>0) {
			session = hsr.getSession();
			session.setAttribute("loginid", uid);
			return "redirect:/booking";
		}
		session = hsr.getSession();
		session.setAttribute("nonmember", "아이디 또는 비밀번호를 확인해주세요.");
		return "home";
	}
	@RequestMapping(value="/booking", method= RequestMethod.GET) 
	public String booking(HttpServletRequest hsr,Model model) {
		session = hsr.getSession();
		String loginid= (String)session.getAttribute("loginid");
		if(loginid.equals("") || loginid == null) {			
			return "redirect:/";
		}
		iRoom room = sqlSession.getMapper(iRoom.class);
		ArrayList<RoomType> roomType = room.getRoomType();
		model.addAttribute("type", roomType);
		ArrayList<Roominfo> roomInfo = room.getRoom_List();
		model.addAttribute("list", roomInfo);
		iBook book = sqlSession.getMapper(iBook.class);
		ArrayList<Bookinfo> bookinfo = book.get_bookList();
		model.addAttribute("booklist", bookinfo);
		return "booking";	
	}
	@RequestMapping("/room") 
	public String newInfo(HttpServletRequest hsr, Model model) {
		session = hsr.getSession();
		String loginid = (String)session.getAttribute("loginid");
		if(loginid==null || loginid.equals("")) {
			return "redirect:/";
		}
		// interface �샇異쒗븯怨� 寃곌낵瑜� room.jsp�뿉 �쟾�떖.
		iRoom room = sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roomInfo = room.getRoom_List();
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
	@RequestMapping(value="/getRoom_List", method= RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String getRoom_List(HttpServletRequest hsr) {
		iRoom room = sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roominfo = room.getRoom_List();
		
		// 李얠븘吏� �뜲�씠�꽣濡� JSONAraay �깮�꽦
		JSONArray ja= new JSONArray();
		for(int i=0; i<roominfo.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode",roominfo.get(i).getRoomcode());
			jo.put("roomname",roominfo.get(i).getRoomname());			
			jo.put("typename",roominfo.get(i).getTypename());
			jo.put("howmany",roominfo.get(i).getHowmany());
			jo.put("howmuch",roominfo.get(i).getHowmuch());
			ja.add(jo);
		}
		return ja.toString();
	}
	@RequestMapping(value="/getRoomList", method= RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String getRoomList(HttpServletRequest hsr) {
		iRoom room = sqlSession.getMapper(iRoom.class);
		String checkin = hsr.getParameter("checkin");
		String checkout = hsr.getParameter("checkout");
		int typecode = Integer.parseInt(hsr.getParameter("typecode"));
		ArrayList<Roominfo> roominfo = room.getRoomList(checkin,checkout,typecode);
		
		// 李얠븘吏� �뜲�씠�꽣濡� JSONAraay �깮�꽦
		JSONArray ja= new JSONArray();
		for(int i=0; i<roominfo.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode",roominfo.get(i).getRoomcode());
			jo.put("roomname",roominfo.get(i).getRoomname());			
			jo.put("typename",roominfo.get(i).getTypename());
			jo.put("howmany",roominfo.get(i).getHowmany());
			jo.put("howmuch",roominfo.get(i).getHowmuch());
			ja.add(jo);
		}
		return ja.toString();
	}
	@RequestMapping(value="/getBookList", method= RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String getBookList(HttpServletRequest hsr) {
		iBook book = sqlSession.getMapper(iBook.class);
		String checkin = hsr.getParameter("checkin");
		String checkout = hsr.getParameter("checkout");
		int typecode = Integer.parseInt(hsr.getParameter("typecode"));
		ArrayList<Bookinfo> bookinfo = book.getBookList(checkin,checkout,typecode);		
		// 李얠븘吏� �뜲�씠�꽣濡� JSONAraay �깮�꽦
		JSONArray ja= new JSONArray();
		for(int i=0; i<bookinfo.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("bookcode",bookinfo.get(i).getBookcode());
			jo.put("roomcode",bookinfo.get(i).getRoomcode());
			jo.put("roomname",bookinfo.get(i).getRoomname());			
			jo.put("typename",bookinfo.get(i).getTypename());
			jo.put("checkin",bookinfo.get(i).getCheckIn());
			jo.put("checkout",bookinfo.get(i).getCheckOut());
			jo.put("person",bookinfo.get(i).getPerson());
			jo.put("howmany",bookinfo.get(i).getHowmany());
			jo.put("howmuch",bookinfo.get(i).getHowmuch());
			jo.put("booker",bookinfo.get(i).getBooker());
			jo.put("mobile",bookinfo.get(i).getMobile());
			jo.put("total",bookinfo.get(i).getTotal());
			ja.add(jo);
		}
		return ja.toString();
	}
	@RequestMapping(value="/deleteRoom", method= RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteRoom(HttpServletRequest hsr) {
		int roomcode = Integer.parseInt(hsr.getParameter("roomcode"));
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.doDeleteRoom(roomcode);
		return "ok";
	}
	@RequestMapping(value="/addRoom", method= RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String addRoom(HttpServletRequest hsr) {
		String rname = hsr.getParameter("roomname");
		String rtype = hsr.getParameter("roomtype");
		int howmany = Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch = Integer.parseInt(hsr.getParameter("howmuch"));
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.doAddRoom(rname, rtype, howmany, howmuch);
		return "ok";
	}
	@RequestMapping(value="/updateRoom", method= RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateRoom(HttpServletRequest hsr) {
		int roomcode = Integer.parseInt(hsr.getParameter("roomcode"));
		String rname = hsr.getParameter("roomname");
		String rtype = hsr.getParameter("roomtype");
		int howmany = Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch = Integer.parseInt(hsr.getParameter("howmuch"));
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.doUpdateRoom(roomcode,rname, rtype, howmany, howmuch);
		return "ok";
	}
	@RequestMapping(value="/signin", method=RequestMethod.POST)
	public  String doSignin(HttpServletRequest hsr) {
		String name = hsr.getParameter("name");
		String loginid = hsr.getParameter("uid");
		String passcode = hsr.getParameter("pw");
		Member member = sqlSession.getMapper(Member.class);
		member.doSignin(name, loginid, passcode);	
		return "home";
	}
	@RequestMapping(value="/addBook", method= RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String addBook(HttpServletRequest hsr) {
		int roomcode = Integer.parseInt(hsr.getParameter("roomcode"));
		String checkIn = hsr.getParameter("checkIn");
		String checkOut = hsr.getParameter("checkOut");
		int person = Integer.parseInt(hsr.getParameter("person"));
		int total = Integer.parseInt(hsr.getParameter("total"));
		String booker = hsr.getParameter("booker");
		String mobile = hsr.getParameter("mobile");
		iBook book = sqlSession.getMapper(iBook.class);
		book.doAddBook(roomcode, person, checkIn, checkOut,total,booker, mobile);
		return "ok";
	}
	@RequestMapping(value="/updateBook", method= RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateBook(HttpServletRequest hsr) {
		int bookcode = Integer.parseInt(hsr.getParameter("bookcode"));
		int person = Integer.parseInt(hsr.getParameter("person"));
		String booker = hsr.getParameter("booker");
		String mobile = hsr.getParameter("mobile");
		iBook book = sqlSession.getMapper(iBook.class);
		book.doUpdateBook(bookcode, person, booker, mobile);
		return "ok";
	}
	@RequestMapping(value="/deleteBook", method= RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteBook(HttpServletRequest hsr) {
		int bookcode = Integer.parseInt(hsr.getParameter("bookcode"));
		iBook book = sqlSession.getMapper(iBook.class);
		book.doDeleteBook(bookcode);
		return "ok";
	}
}
