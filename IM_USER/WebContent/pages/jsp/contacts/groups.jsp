<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<script type="text/javascript" src="js/jquery-1.9.1.js">   </script>
<script type="text/javascript" src="js/jquery.paginate.js"> </script>
<script type="text/javascript" src="js/ddslick.js"> </script>
<script type="text/javascript" src="js/migrate.js"></script>
<script>
var messageIdContainer={};
messageIdContainer.checkedMessages=[];
var totalPages,startNumber,displayNumber,noPageElements;
var ddData = [
              {
                  text: "Contacts",
                  value: 1,
                  selected: false,
                  description: "Displays your contacts",                     
              },
              {
                  text: "Groups",
                  value: 2,
                  selected: false,
                  description: "Displays your Groups",
                  imageSrc: "/IM_USER/images/groups.png"
              }              
];

$("document").ready(function(){	
	initializePopUp();
	$("a.delete-contact").click(function (){
		var choice=confirm("Sure to delete this contact ");
		if(choice==true){
				alert("The contact index for this element is" + $(this).closest("tr").find("#inboxMessages_contactId").val());
				$("#delContactIndex").val($(this).closest("tr").find("#inboxMessages_contactId").val());
				$("#delContact").submit();
		}else{
			return false;			
		}			
	});
	$("#selectGroupsContacts").ddslick({
	    data: ddData,
	    width: 300,
	    imagePosition: "left",
	    selectText: "Select your Contacts and Groups",
	    onSelected: function (data) {
	       alert("you selected something" + data);
	    }
	});
	
});

function submitValidateEdit(){
	$(".editContact").submit();
}
function submitValidateAdd(){
	$(".addContact").submit();
}

	function initializePopUp() {
		$('a.login-window').click(function() {
			/*Get the Contact Name and Contact Number present at 2nd and 3rd cell respectively*/
			var contactId=	$(this).closest("tr").find("#inboxMessages_contactId").val();
			var contactName = $(this).closest("tr").find("td:eq(2)").text();
			var contactNumber=$(this).closest("tr").find("td:eq(3)").text();
			alert(contactId);
			$("#contactName").val(contactName);
			$("#contactNumber").val(contactNumber);
			$("#contactIndex").val(contactId);
			//Getting the variable's value from a link			
			var loginBox = $(this).attr('href');
				
			//Fade in the Popup
			$(loginBox).fadeIn(300);

			//Set the center alignment padding + border see css style
			var popMargTop = ($(loginBox).height() + 24) / 2;
			var popMargLeft = ($(loginBox).width() + 24) / 2;

			$(loginBox).css({
				'margin-top' : -popMargTop,
				'margin-left' : -popMargLeft
			});

			// Add the mask to body
			$('body').append('<div id="mask"></div>');
			$('#mask').fadeIn(300);

			return false;
		});

		//When clicking on the button close or the mask layer the popup closed
		$('a.close, #mask').live('click', function() {
			$('#mask , .login-popup').fadeOut(300, function() {
				$('#mask').remove();
			});
			return false;
		});
	}
	
	
	function calculatePaginationParameters() {
		startNumber = $("#startPageNumber_").val();
		totalPages = $("#noRecords_").val();
		noPageElements = $("#selectedNoOfRecords_").val();
		// 	alert("Selected no of records are " + noPageElements);	
		totalPages = ((Math.floor(totalPages / noPageElements) == 0) ? 1
				: (Math.floor(totalPages / noPageElements) + (totalPages
						% noPageElements == 0 ? 0 : 1)));
		if (startNumber > totalPages) {
			startNumber = totalPages;
		}
	}
	function initializePagination() {
		calculatePaginationParameters();
		paginate();
	}
	function reinitializePagination() {
		initializePagination();
		$("#inboxMessages").attr("action", "Inbox.html");
		$("#startPageNumber_").val($(".jPag-current").text());
		$("#selectedNoOfRecords_").val(noPageElements);
		//		alert("No of records selected by user is " + noPageElements);					
		$("#inboxMessages").submit();
	}
	function checkMessages() {
		if (messageIdContainer.checkedMessages.length > 0) {
			var choice = confirm("You are going to delete "
					+ messageIdContainer.checkedMessages.length
					+ (messageIdContainer.checkedMessages.length > 1 ? " messages"
							: " message"));
			if (choice == true) {
				$("#messageIdsForDeletion_").val(
						messageIdContainer.checkedMessages);
				$("#inboxMessages").attr("action", "DelMessages.html");
				alert("messageId that are going to be deleted are "
						+ messageIdContainer.checkedMessages);
				$("#inboxMessages").submit();
			}
		} else {
			alert("Please select a message to delete");
			return false;
		}
	}
</script>

<div class="secTab mT30">
	<ul>
		<li  id="Messages"><a href="Inbox.html" id="message">Messages</a>
		</li>
		<li class="sel" id="Contacts.html"><a href="Contacts" id="contact">Contacts</a>
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
							<div class="clrBoth"></div>
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
<!-- 					hidden popup box for editing contacts -->
					<div id="login-box" class="login-popup">
						<a href="#" class="close"><img src="/IM_USER/images/close_pop.png"
							class="btn_close" title="Close Window" alt="Close" />
						</a>
						<form method="post" class="editContact" action="UpdateContact.html">
							<fieldset class="textbox">
								<label class="contactName"> <span>Contact Name</span>
									<input id="contactName" name="contact.contactName_" value="" type="text"
									autocomplete="on" placeholder="ContactName"> </label> <label
									class="contactNumber"> <span>Contact Number</span> <input
									id="contactNumber" name="contact.contactNumber_" value="" type="text"
									placeholder="contactNumber"> </label>								
								<button class="submit button" type="button" onclick="javascript:submitValidateEdit()">Update</button>								
							</fieldset>
						</form>
					</div>
					<!-- 					hidden popup box for adding contacts -->
					<div id="AddContact" class="login-popup">
						<a href="#" class="close"><img src="/IM_USER/images/close_pop.png"
							class="btn_close" title="Close Window" alt="Close" />
						</a>
						<form method="post" class="addContact" action="AddContact.html">
							<fieldset class="textbox">
								<label class="contactName"> <span>Contact Name</span>
									<input id="contactName" name="contact.contactName_" value="" type="text"
									autocomplete="on" placeholder="ContactName"> </label> <label
									class="contactNumber"> <span>Contact Number</span> <input
									id="contactNumber" name="contact.contactNumber_" value="" type="text"
									placeholder="contactNumber"> </label>
								<input type=hidden name="contactIndex" id="contactIndex">
								<button class="submit button" type="button" onclick="javascript:submitValidateAdd()">Add</button>								
							</fieldset>
						</form>
					</div>
<!-- 					form for submitting the contactIndex of the contact to be deleted -->
					<form action="DeleteContact.html" id="delContact">
					<input type="hidden" id="delContactIndex" name="contactIndex"/>
					</form>
					<!-- right panel start here -->
					<div class="rightPenel mT10">
						<h1 class="mB10">Contacts</h1>
						<div class="grayContainer litGrayBG mB10">
<!-- 						Displaying a rounded corner by using css clip property(using a rounded image and then clipping it usign clip:rect(top,right,bottom,left) property)-->
							<div class="grayContCorner corTL"></div>
							<div class="grayContCorner corTR"></div>
							<div class="pd7">
<!-- 								<div class="sectionFour bdrRightDot mT5"> -->
<%-- 										<span>Message Type: <strong>SMS and MMS </strong> </span> <span --%>
<%-- 											class="downArrow_icon"></span> --%>
<!-- 								</div> -->
							<div id="selectGroupsContacts">
							</div>
							<div class="btn_deactive">
									<a href="#AddContact" class="login-window">Add Contact</a>
								</div>
								<div class="btn_deactive">
									<a href="javascript:checkMessages()">Delete Contact</a>
								</div>
								<div class="clrBoth"></div>
							</div>
							<div class="grayContCorner corBL"></div>
							<div class="grayContCorner corBR"></div>
						</div>
						<!-- dataTable start here -->
						<s:form id="inboxMessages" action="Contacts.html" theme="simple">
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
										<th width="16%" class="no_sep">Group Name</th>
										<th width="30%" class="no_sep">No of Members</th>
										<th width="20%" class="no_sep">View Members</th>										
										<th width="5%" class="no_sep">Edit</th>
										<th width="11%" class="no_sep">Delete</th>
									</tr>
									<s:iterator value="contactsList" status="contactsIndex">
										<tr>
											<td class="noRitBdr center"><s:checkbox name="checkbox"
													fieldValue="true" theme="simple"
													id="%{#contactsIndex.index}" />
											<s:hidden name="contactId" value="%{#contactsIndex.index}"></s:hidden>		
											</td>
											<td class="center  noRitBdr"><span class=" grey_star"></span>											
											</td>
											<td class="noRitBdr bolder"><s:property
													value="contactName_" /></td>
											<td class="noRitBdr bolder"><s:property
													value="contactNumber_" />
											</td>
											<td class="noRitBdr center"><a href="#login-box" class="login-window"><img src="/IM_USER/images/edit.gif"/></a></td>
											<td class="noRitBdr bolder"><a href="javascript:deleteContact()" class="delete-contact"><img src="/IM_USER/images/delete_group.png" style="width: 25px;"/></a></td>
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
