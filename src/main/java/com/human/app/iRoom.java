package com.human.app;

import java.util.ArrayList;

public interface iRoom {
	ArrayList<Roominfo> getRoomList(String checkin,String checkout,int typecode);
	ArrayList<Roominfo> getRoom_List();
	ArrayList<RoomType> getRoomType();	
	void doDeleteRoom(int roomcode);
	void doAddRoom(String roomname,String roomtype,int howmany, int howmuch);
	void doUpdateRoom(int roomcode, String roomname,String roomtype,int howmany, int howmuch);	
}
