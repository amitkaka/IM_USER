package com.comviva.im.userportal.action.testing;

import com.comviva.im.userportal.domain.model.contact.Contact;
import com.opensymphony.xwork2.ActionSupport;

public class TestAction extends ActionSupport {

	
	private static final long serialVersionUID = -3898643362248389973L;
	private Contact contact;

	
	public String test(){
		System.out.println("" + getContact().getContactName_());
		return SUCCESS;
	}
	
	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}
	
}
