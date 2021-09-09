package com.human.app;

import java.util.ArrayList;

public interface Member {
	void doSignin(String name, String loginid,String passcode);
	int doLogin(String loginid, String passcode);
}
