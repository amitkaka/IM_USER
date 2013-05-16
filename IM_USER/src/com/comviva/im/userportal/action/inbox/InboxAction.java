package com.comviva.im.userportal.action.inbox;

import java.util.ArrayList;
import java.util.List;

import com.comviva.im.userportal.domain.model.message.InboxMessage;
import com.opensymphony.xwork2.ActionSupport;

public class InboxAction  extends ActionSupport{


	private static final long serialVersionUID = 5475564801951213783L;
	private List<InboxMessage> messageList=null;
	private static List<InboxMessage> messagesFromDb=null;
	private String messageIdsForDeletion_=null;
	private int startPageNumber_=1;
	private int noRecords_=1;	
	private int selectedNoOfRecords_=10;
	private int defaultNoOfRecords_=10;

	static{
		messagesFromDb= new ArrayList<InboxMessage>();
			
		for(int i=0;i<50;i++){
			InboxMessage message= new InboxMessage();		
			message.setSender_("9405431312");
			message.setTime_("12/12/12");	
			message.setMessageContent_("Message " +(i+1) +":Today is a sunny day ");
			messagesFromDb.add(message);
		}
		
	}
	public String getMessageIdsForDeletion_() {
		return messageIdsForDeletion_;
	}

	public void setMessageIdsForDeletion_(String messageIdsForDeletion_) {
		this.messageIdsForDeletion_ = messageIdsForDeletion_;
	}

	public String deleteMessage(){		
		String [] messageIds=messageIdsForDeletion_.split(",");
		for(String messageId:messageIds){
			System.out.println(messageId + "is going to be deleted");
			System.out.println("the actual content of that messageId is  " + messagesFromDb.get(Integer.parseInt(messageId)).getMessageContent_());
			messagesFromDb.remove(Integer.parseInt(messageId));
		}
		
		return "success";
	}

	public String checkInbox(){
		int fromIndex,toIndex = 0;
		if(startPageNumber_==1){
			fromIndex=0;
		}else{
			fromIndex=startPageNumber_*selectedNoOfRecords_-selectedNoOfRecords_;
		}
		noRecords_=messagesFromDb.size();	
		if(defaultNoOfRecords_>messagesFromDb.size()){
			toIndex=messagesFromDb.size();
		}else{
			toIndex=startPageNumber_*selectedNoOfRecords_;
			if(toIndex>messagesFromDb.size()){
				toIndex=messagesFromDb.size();
			}
		}
		messageList=messagesFromDb.subList(fromIndex, toIndex);			
		System.out.println("total no of records in db are " + messagesFromDb.size());
		System.out.println("no of records requested are " + selectedNoOfRecords_);
		System.out.println("no of records that are going to be displayed are " + messageList.size());
		System.out.println("current page number is "+startPageNumber_);
		return SUCCESS;
	}
	
	public List<InboxMessage> getMessageList() {
		return messageList;
	}

	
	public void setMessageList(List<InboxMessage> messageList) {
		this.messageList = messageList;
	}

	public int getStartPageNumber_() {
		return startPageNumber_;
	}

	public void setStartPageNumber_(int startPageNumber_) {
		this.startPageNumber_ = startPageNumber_;
	}

	public int getNoRecords_() {
		return noRecords_;
	}

	public void setNoRecords_(int noRecords_) {
		this.noRecords_ = noRecords_;
	}

	public int getSelectedNoOfRecords_() {
		return selectedNoOfRecords_;
	}

	public void setSelectedNoOfRecords_(int selectedNoOfRecords_) {
		this.selectedNoOfRecords_ = selectedNoOfRecords_;
	}
	
}
