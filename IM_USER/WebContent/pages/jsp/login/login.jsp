<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<!--META-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>RSP-MMS PORTAL</title>
<!--STYLESHEETS-->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<!--SCRIPTS-->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
<!--Slider-in icons-->
<script type="text/javascript">
	$(document).ready(function() {
		$(".username").focus(function() {
			$(".user-icon").css("left", "-48px");
		});
		$(".username").blur(function() {
			$(".user-icon").css("left", "0px");
		});

		$(".password").focus(function() {
			$(".pass-icon").css("left", "-48px");
		});
		$(".password").blur(function() {
			$(".pass-icon").css("left", "0px");
		});
	});
</script>

</head>
<body>

	<!--WRAPPER-->
<div id="wrapper">
	<!--SLIDE-IN ICONS-->
    <div class="user-icon"></div>
    <div class="pass-icon"></div>
    <!--END SLIDE-IN ICONS-->

<!--LOGIN FORM-->
<s:form name="login-form" cssClass="login-form" action="" method="post" theme="simple">

	<!--HEADER-->
    <div class="header">
    <!--TITLE--><h1>RSP-MMS PORTAL</h1><!--END TITLE-->
    <!--DESCRIPTION--><span>Enter a new world of messaging.</span><!--END DESCRIPTION-->
    </div>
    <!--END HEADER-->
	
	<!--CONTENT-->
    <div class="content">
    <s:textfield name="username" value="Username" cssClass="input username" onfocus="this.value=''" theme="simple" label="Username"/>	
    <s:password name="password" value="Password" cssClass="input password" onfocus="this.value=''" theme="simple" label="Password"/>
    </div>
    <!--END CONTENT-->
    
    <!--FOOTER-->
    <div class="footer">
    <!--LOGIN BUTTON--><input type="submit" name="submit" value="Login" class="button" /><!--END LOGIN BUTTON-->
    <!--REGISTER BUTTON--><input type="submit" name="submit" value="Register" class="register" /><!--END REGISTER BUTTON-->
    </div>
    <!--END FOOTER-->

</s:form>
<!--END LOGIN FORM-->

</div>
<!--END WRAPPER-->

<!--GRADIENT--><div class="gradient"></div><!--END GRADIENT-->

</body>
</html>