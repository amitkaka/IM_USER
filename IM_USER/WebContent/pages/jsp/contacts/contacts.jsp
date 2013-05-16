<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<script type="text/javascript" src="js/jquery-1.9.1.js">   </script>
<script type="text/javascript" src="js/jquery.paginate.js"> </script>
<script>
var messageIdContainer={};
messageIdContainer.checkedMessages=[];
var totalPages,startNumber,displayNumber,noPageElements;

$("document").ready(function(){

});



function calculatePaginationParameters(){
	startNumber=$("#startPageNumber_").val();
 	totalPages=$("#noRecords_").val();			
	noPageElements=$("#selectedNoOfRecords_").val();	
// 	alert("Selected no of records are " + noPageElements);	
	totalPages=((Math.floor(totalPages/noPageElements)==0)?1:(Math.floor(totalPages/noPageElements)+(totalPages%noPageElements==0?0:1)));
	if(startNumber>totalPages){
		startNumber=totalPages;
	}
}
function initializePagination(){
	calculatePaginationParameters();
	paginate();		
}
function reinitializePagination(){
	initializePagination();
	$("#inboxMessages").attr("action","Inbox.html");
	$("#startPageNumber_").val($(".jPag-current").text());
	$("#selectedNoOfRecords_").val(noPageElements);
//		alert("No of records selected by user is " + noPageElements);					
	$("#inboxMessages").submit();			
}
function checkMessages(){	
	if(messageIdContainer.checkedMessages.length>0){		
		var choice=confirm("You are going to delete "+ messageIdContainer.checkedMessages.length + (messageIdContainer.checkedMessages.length>1? " messages":" message"));
		if(choice==true){
				$("#messageIdsForDeletion_").val(messageIdContainer.checkedMessages);				
				$("#inboxMessages").attr("action","DelMessages.html");
				alert("messageId that are going to be deleted are " + messageIdContainer.checkedMessages);
				$("#inboxMessages").submit();			
		}			
	}else{
		alert("Please select a message to delete");
		return false;
	}
}
</script>

<div class="secTab mT30">
	<ul>
		<li  id="Messages"><a href="Inbox" id="message">Messages</a>
		</li>
		<li class="sel" id="Contacts"><a href="Contacts" id="contact">Contacts</a>
		</li>
		<li id="Subscriptions"><a href="#" id="subscription">My Subscriptions</a>
		</li>
		<li id="Profile"><a href="#" id="profile">My Profile</a>
		</li>
		<li id="Gallery"><a href="#" id="gallery">Gallery</a>
		</li>
	</ul>
	<div class="clrBoth"></div>
</div>
<div class="portlet">
	<div class="portletCorner cornerTR"></div>
	<div class="portletBottomShadow">
		<div class="portletRightShadow">
			<div class="portletLeftShadow">
				<div class="portletInner">
					<!-- data container start here -->

					<!-- left penel start here -->

					<div class="leftPanelRSP">
						<div class="mT10 mB5">
							<div class="btn">
								<a href="rsp_compose.html">Compose</a>
							</div>
							<div class=" clrBoth"></div>
						</div>
						<div class="grayContainer grayContainer_slide">
							<div class="grayContCorner corTL"></div>
							<div class="grayContCorner corTR"></div>
							<div class="leftToc_slide">
								<ul>
									<li class="sel"><a href="Inbox.html">Inbox</a></li>
									<li><a href="#">Sent Items</a></li>
									<li><a href="#">Outbox</a></li>
									<li><a href="#">Uploads</a></li>
								</ul>
								<div class="clrBoth"></div>
							</div>
							<div class="grayContCorner corBL"></div>
							<div class="grayContCorner corBR"></div>
						</div>
					</div>

					<!-- left panel end here -->

					<!-- right panel start here -->
					<div class="rightPenel mT10">
						<h1 class="mB10">Inbox</h1>
						<div class="grayContainer litGrayBG mB10">
							<div class="grayContCorner corTL"></div>
							<div class="grayContCorner corTR"></div>
							<div class="pd7">
								<div class="sectionFour bdrRightDot mT5">
									<span>Message Type: <strong>SMS and MMS </strong> </span> <span
										class="downArrow_icon"></span>
								</div>
								<div class="btn_deactive">
									<a href="javascript:checkMessages()">Delete</a>
								</div>
								<div class="clrBoth"></div>
							</div>
							<div class="grayContCorner corBL"></div>
							<div class="grayContCorner corBR"></div>
						</div>
						<!-- dataTable start here -->
						<s:form id="inboxMessages" action="Inbox.html" theme="simple">
						<div class="paginationCont">
						<label>Select no of records</label>
						<s:select list="{'10','20','30','40'}" name="selectedNoOfRecords_" id="selectedNoOfRecords_" label="select no of records" theme="simple"></s:select>
						<div class="clrBoth"></div>
						</div>
						<div id="pagination"></div>						
						<!-- 						<div class="paginationCont"> -->
<%-- 							<div class="fLt">1-20 of <s:property value="messageList.size"/></div> --%>
<%-- 							<span class="pagenation_LeftAro"></span> <span --%>
<%-- 								class="pagenation_RightAro"></span>								 --%>
<!-- 							<div class="clrBoth"></div> -->
<!-- 						</div> -->
						<div class="clrBoth"></div>
						<div class="tableContainer">
							<div class="tableContCorner tableCorTL"></div>
							<div class="tableContCorner tableCorTR"></div>							
							<s:hidden name="messageIdsForDeletion_" id="messageIdsForDeletion_" theme="simple"></s:hidden>
							<s:hidden name="startPageNumber_" id="startPageNumber_" theme="simple"></s:hidden>
							<s:hidden name="displayNumber_" id="displayNumber_" theme="simple"></s:hidden>
							<s:hidden name="noRecords_" id="noRecords_" theme="simple"></s:hidden>							
								<table width="100%" border="0" class="dataTable">
									<tr>
										<th width="5%" class="no_sep center"><input
											type="checkbox" onclick="checkedAll('frm1');" /></th>
										<th width="3%" class="no_sep">&nbsp;</th>
										<th width="16%" class="no_sep">From</th>
										<th width="61%" class="no_sep">Mesage</th>
										<th width="4%" class="no_sep right">&nbsp;</th>
										<th width="11%" class="no_sep">Time</th>
									</tr>
									<s:iterator value="messageList" status="messageIndex">
										<tr>
											<td class="noRitBdr center"><s:checkbox name="checkbox"
													fieldValue="true" theme="simple"
													id="%{#messageIndex.index}" /></td>
											<td class="center  noRitBdr"><span class=" grey_star"></span>
											</td>
											<td class="noRitBdr bolder"><s:property
													value="messageList[#messageIndex.index].sender_" /></td>
											<td class="noRitBdr bolder"><s:property
													value="messageList[#messageIndex.index].messageContent_" />
											</td>
											<td class="noRitBdr center"><span class="scene"></span>
											</td>
											<td class="noRitBdr bolder"><s:property
													value="messageList[#messageIndex.index].time_" /></td>
										</tr>
									</s:iterator>
								</table>							
							<div class="tableContCorner tableCorBL"></div>
							<div class="tableContCorner tableCorBR"></div>
						</div>
						<!-- dataTable end here -->
						</s:form>
					</div>
					<!-- right panel end here -->

					<div class="clrBoth"></div>
				</div>
			</div>
			<div class="portletCorner cornerBL"></div>
			<div class="portletCorner cornerBR"></div>
		</div>
	</div>	
</div>
