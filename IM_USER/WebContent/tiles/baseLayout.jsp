<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title><tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
</title>
</head>
<body>
	<div id="mainContainer">
		<div id="headerContainer">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="dataContainer">
			<tiles:insertAttribute name="main_content" />
			<div class="clrBoth"></div>
			<div class="push"></div>
		</div>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
	<!-- end footer -->
</body>
</html>