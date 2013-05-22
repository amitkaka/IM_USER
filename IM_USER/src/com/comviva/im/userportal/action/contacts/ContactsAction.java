package com.comviva.im.userportal.action.contacts;

import java.util.ArrayList;
import java.util.List;

import com.comviva.im.userportal.domain.model.contact.Contact;
import com.opensymphony.xwork2.ActionSupport;

public class ContactsAction  extends ActionSupport{  

	private static final long serialVersionUID = -7620762417485913180L;
	private static List<Contact> contactsFromDb=new ArrayList<Contact>();
	private List<Contact> contactsList=null;
	private Contact contact;
	private int contactIndex;
static{	
	for(int i=0;i<12;i++){
		Contact sampleContact= new Contact();
		sampleContact.setContactName_("Amit" + i);
		sampleContact.setContactNumber_("94054212312");
		contactsFromDb.add(sampleContact);
	}
}

	public String deleteContact(){
	contactsFromDb.remove(contactIndex);
	return SUCCESS;
	}
public String addContact(){
	contactsFromDb.add(contact);
	return SUCCESS;
}

	public String updateContact(){
		System.out.println("Contact Index is" + contactIndex);
		contactsFromDb.get(contactIndex).setContactName_(contact.getContactName_());
		contactsFromDb.get(contactIndex).setContactNumber_(contact.getContactNumber_());
		return SUCCESS;
		}
	public String checkContacts(){
		contactsList=contactsFromDb.subList(0, contactsFromDb.size());		
		return SUCCESS;
	}
	public List<Contact> getContactsList() {
		return contactsList;
	}
	public void setContactsList(List<Contact> contactsList) {
		this.contactsList = contactsList;
	}
	public int getContactIndex() {
		return contactIndex;
	}
	public void setContactIndex(int contactIndex) {
		this.contactIndex = contactIndex;
	}
	public Contact getContact() {
		return contact;
	}
	public void setContact(Contact contact) {
		this.contact = contact;
	}
}
