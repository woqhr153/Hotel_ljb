package com.human.app;

public class Bookinfo {
	private int bookcode;
	private int roomcode;
	private String roomname;
	private String typename;
	private String checkIn;
	private String checkOut;
	private int person;
	private int howmany;
	private int howmuch;
	private String mobile;
	private String booker;
	public Bookinfo() {}
	public Bookinfo(int bookcode, int roomcode, String roomname,String typename, String checkIn, String checkOut, int person,
			int howmany, int howmuch, String mobile, String booker) {
		this.bookcode = bookcode;
		this.roomcode = roomcode;
		this.roomname = roomname;
		this.typename = typename;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.person = person;
		this.howmany = howmany;
		this.howmuch = howmuch;
		this.mobile = mobile;
		this.booker = booker;
	}
	public int getBookcode() {
		return bookcode;
	}
	public void setBookcode(int bookcode) {
		this.bookcode = bookcode;
	}
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public int getPerson() {
		return person;
	}
	public void setPerson(int person) {
		this.person = person;
	}
	public int getHowmany() {
		return howmany;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public int getHowmuch() {
		return howmuch;
	}
	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getBooker() {
		return booker;
	}
	public void setBooker(String booker) {
		this.booker = booker;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	

	
	
}
