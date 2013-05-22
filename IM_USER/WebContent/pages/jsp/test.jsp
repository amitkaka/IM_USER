<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="/IM_USER/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
	function validate(){
		$("#test").submit();
	}
</script>
</head>
<body>
<form action="Test.html" id="test">
<input type="text" name="contact.contactName_" />
<input type="text" name="contact.contactNumber_" />
<button type="button" onclick="javascript:validate()">Submit</button>
</form>
</body>
</html>