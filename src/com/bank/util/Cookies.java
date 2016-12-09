package com.bank.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cookies {
	public static String get(HttpServletRequest request, String name) {
		String value = null;
		Cookie cks[] = request.getCookies();
		for(int i = 0; i < cks.length; i++) {
			if(cks[i].getName().equals(name)) {
				value = cks[i].getValue();
				break;
			}
		}
		return value;
	}
	public static void set(HttpServletResponse response, String name) {
		Cookie ck = new Cookie(name, "");
		ck.setMaxAge(0);
		response.addCookie(ck);
	}
	public static void set(HttpServletResponse response, String name, String value) {
		Cookie ck = new Cookie(name, value);
		ck.setMaxAge(24 * 60 * 60);
		response.addCookie(ck);
	}
	public static void set(HttpServletResponse response, String name, String value, int age) {
		Cookie ck = new Cookie(name, value);
		ck.setMaxAge(age);
		response.addCookie(ck);
	}
}
