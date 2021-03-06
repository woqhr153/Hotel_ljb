package com.human.app;

import java.util.ArrayList;

public interface iBook {
	ArrayList<Bookinfo> getBookList(String checkin, String checkout, int typecode);
	ArrayList<Bookinfo> get_bookList();
	void doAddBook(int roomcode,int person, String checkIn,String checkOut,int total,String booker,String mobile);
	void doUpdateBook(int bookcode, int person, String booker, String mobile);
	void doDeleteBook(int bookcode);
}
