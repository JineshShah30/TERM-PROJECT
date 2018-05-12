<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<img src="${post.imguri}"  height="250" width="250"  > <br> <br>
<audio autoplay>
<source src="${post.audiourl}">
</audio> 
${post.text} <br> <br>

<form action="/savecomment" method="post">
<input type="text" placeholder="comment here" name="comment"/>
<input type="hidden" name="postid" value="${post.postid }"/>
<button type="submit" >Save </button>
</form>
</body>
</html>