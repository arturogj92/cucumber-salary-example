package com.abeldevelop.cucumber.salaryexample.utils;

public abstract class StringUtils {

	public static String setNull(String strIn) {
		if(strIn == null || strIn.trim().length() == 0 || strIn.equals("null")) {
			return null;
		}
    	
    	return strIn;
    }
}
