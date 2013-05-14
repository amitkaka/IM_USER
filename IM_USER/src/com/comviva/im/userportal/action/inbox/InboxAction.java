package com.comviva.im.userportal.action.inbox;

import java.util.ArrayList;
import java.util.List;

import com.comviva.im.userportal.domain.model.message.InboxMessage;
import com.opensymphony.xwork2.ActionSupport;

public class InboxAction  extends ActionSupport{


	private static final long serialVersionUID = 5475564801951213783L;
	private List<InboxMessage> messageList=null;

	public String checkInbox(){
		messageList= new ArrayList<InboxMessage>();
		InboxMessage message1 = new InboxMessage();
		message1.setMessageContent_("Today is a sunny day");
		message1.setSender_("9405431312");
		message1.setTime_("12/12/12");
		messageList.add(message1);
		messageList.add(message1);
		messageList.add(message1);
		return SUCCESS;
	}
	public String deleteMessages(){
		
		return "success";
	}

	public List<InboxMessage> getMessageList() {
		return messageList;
	}

	
	public void setMessageList(List<InboxMessage> messageList) {
		this.messageList = messageList;
	}
	
}
