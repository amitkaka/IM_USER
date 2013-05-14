<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- 	<%@page import="java.util.*"%> --%>

<%-- <% String val = (String) session.getAttribute( "userId" ); %> --%>

 <%-- <% @SuppressWarnings("unchecked")
 	String val =  session.getAttribute( "user" ); 
 %> --%>

<div id="header">
	<div class="logo">
		<a href="dashboard.action"><img src="images/logo.png" width="132"
			height="32" alt="Logo" title="Logo" /> </a>
	</div>
	<div class="tagLine">
		Integrated<br /> Messaging
	</div>
	<div class="userLogin">
		<div class="userTxt">
			Welcome, <span class="userName"> 
 </span><br /> XYZ Company,
			21 Jan 2013
		</div>
		<div class="sectionFive fLt">
			<a href="logout.action">Logout</a>
		</div>
	</div>
	<div id="headerRight">
		<div class="language">
			<span>English </span><span class="downArrow_icon"></span>
		</div>
		<div id="globalRLink">
			<ul>
				<li><a href="#">Help</a></li>
				<li><a href="#">FAQs</a></li>
			</ul>
		</div>
		<div id="searchwrapper">
			<input type="text" class="searchbox" id="searchBox" value="Search"
				onfocus="disableText('searchBox',0,'');"
				onblur="disableText('searchBox',0,'Search');" />
		</div>
		<div class="btn">
			<a href="#">Go</a>
		</div>
	</div>
</div>
<div class="clrBoth"></div>