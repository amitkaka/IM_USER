package com.comviva.im.userportal.action.login;

import com.opensymphony.xwork2.ActionSupport;

public class WelcomeRedirectAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;

	public String redirect(){
		return SUCCESS;
	}
}
