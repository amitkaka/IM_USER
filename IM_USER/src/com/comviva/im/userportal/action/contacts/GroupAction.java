package com.comviva.im.userportal.action.contacts;

import java.util.ArrayList;
import java.util.List;

import com.comviva.im.userportal.domain.model.contact.Contact;
import com.comviva.im.userportal.domain.model.contact.Group;
import com.opensymphony.xwork2.ActionSupport;

public class GroupAction extends ActionSupport {

	
	private static final long serialVersionUID = -4420772180709802375L;
	private List<Group> groupsList_;
	private List<Contact> membersList_;
	private static List<Group>groupsFromDb=new ArrayList();
	private static List<Contact> membersFromDb_=new ArrayList<Contact>();
	private String groupName_;
	
	
static{
	for(int i=0;i<12;i++){
		Group group= new Group();
		group.setGroupName_("kaka" + i);
		group.setNoMembers_(1);
		groupsFromDb.add(group);
	}
	for(int i=0;i<12;i++){
		Contact contact=new Contact();
		contact.setContactName_("amit");
		contact.setGroupName_(groupsFromDb.get(i).getGroupName_());				
		membersFromDb_.add(contact);
	}
}

	public String checkMembers(){
		System.out.println("request recieved for checking memebers of group name" + groupName_);
		membersList_=membersFromDb_.subList(0,(int)(Math.random()*membersFromDb_.size())+1);
		return SUCCESS;
	}

	public String checkGroups(){
		groupsList_=groupsFromDb.subList(0, groupsFromDb.size());
		return SUCCESS;
	}

	public List<Group> getGroupsList_() {
		return groupsList_;
	}

	public void setGroupsList_(List<Group> groupsList_) {
		this.groupsList_ = groupsList_;
	}

	public List<Contact> getMembersList_() {
		return membersList_;
	}

	public void setMembersList_(List<Contact> membersList_) {
		this.membersList_ = membersList_;
	}

	public String getGroupName_() {
		return groupName_;
	}

	public void setGroupName_(String groupName_) {
		this.groupName_ = groupName_;
	}
}
