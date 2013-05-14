<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<script type="text/javascript" src="js/jquery-1.9.1.js">
$("document").ready(function(){
var someObj={};
someObj.checkedMessages=[];
$("input:checkbox").change(function() {
	$("input:checkbox").each(function(){	 
	 if($(this).is(":checked")){
		 someObj.checkedMessages.push($this.attr("id"));
	 }
	 alert("Id of messages to be deleted are: " + someObj.checkedMessages);
});
});
});
</script>
<div class="secTab mT30">
	<ul>
		<li class="sel"><a href="#">Messages</a></li>
		<li><a href="#">Contacts</a></li>
		<li><a href="#">My Subscriptions</a></li>
		<li><a href="#">My Profile</a></li>
		<li><a href="#">Gallery</a></li>
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
									<li class="sel"><a href="Inbox.html">Inbox</a>
									</li>
									<li><a href="#">Sent Items</a>
									</li>
									<li><a href="#">Outbox</a>
									</li>
									<li><a href="#">Uploads</a>
									</li>
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
									<a href="Inbox.html">Delete</a>
								</div>
								<div class="clrBoth"></div>
							</div>
							<div class="grayContCorner corBL"></div>
							<div class="grayContCorner corBR"></div>
						</div>
						<!-- dataTable start here -->
						<div class="paginationCont">
							<div class="fLt">1-20 of 50</div>
							<span class="pagenation_LeftAro"></span> <span
								class="pagenation_RightAro"></span>
							<div class="clrBoth"></div>
						</div>
						<div class="clrBoth"></div>
						<div class="tableContainer">
							<div class="tableContCorner tableCorTL"></div>
							<div class="tableContCorner tableCorTR"></div>
							<s:form id="frm1" action="post" theme="simple">
								<table width="100%" border="0" class="dataTable">
									<tr>
										<th width="5%" class="no_sep center"><input
											type="checkbox" onclick="checkedAll('frm1');" />
										</th>
										<th width="3%" class="no_sep">&nbsp;</th>
										<th width="16%" class="no_sep">From</th>
										<th width="61%" class="no_sep">Mesage</th>
										<th width="4%" class="no_sep right">&nbsp;</th>
										<th width="11%" class="no_sep">Time</th>
									</tr>
									<s:iterator value="messageList" status="messageIndex">
										<tr>
											<td class="noRitBdr center"><s:checkbox name="checkbox" fieldValue="true" theme="simple" id="%{#messageIndex.index}"/>
											</td>
											<td class="center  noRitBdr"><span class=" grey_star"></span>
											</td>
											<td class="noRitBdr bolder"><s:property
													value="messageList[#messageIndex.index].sender_" />
											</td>
											<td class="noRitBdr bolder"><s:property
													value="messageList[#messageIndex.index].messageContent_" />
											</td>
											<td class="noRitBdr center"><span class="scene"></span>
											</td>
											<td class="noRitBdr bolder"><s:property
													value="messageList[#messageIndex.index].time_" />
											</td>
										</tr>
									</s:iterator>								
								</table>
							</s:form>
							<div class="tableContCorner tableCorBL"></div>
							<div class="tableContCorner tableCorBR"></div>
						</div>
						<!-- dataTable end here -->

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
