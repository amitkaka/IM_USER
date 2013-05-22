package com.comviva.im.userportal.domain.model.contact;

import java.util.List;

public class Group {

	private List<Contact> contacts_;
	private String groupName_;
	private int noMembers_;
	
	public List<Contact> getContacts_() {
		return contacts_;
	}

	public void setContacts_(List<Contact> contacts_) {
		this.contacts_ = contacts_;
	}

	public String getGroupName_() {
		return groupName_;
	}

	public void setGroupName_(String groupName_) {
		this.groupName_ = groupName_;
	}

	public int getNoMembers_() {
		return noMembers_;
	}

	public void setNoMembers_(int noMembers_) {
		this.noMembers_ = noMembers_;
	}
	
}
