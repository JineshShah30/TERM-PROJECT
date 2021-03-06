<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Profile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js">
</script>
</head>

<body>

<script>
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
    	
      // Logged into your app and Facebook.
      testAPI();
    } else {
      // The person is not logged into your app or we are unable to tell.
      window.location = '/';
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    }
  }
  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '378682475964386',
      cookie     : true,  // enable cookies to allow the server to access 
                          // the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.8' // use graph api version 2.8
    });
    // Now that we've initialized the JavaScript SDK, we call 
    // FB.getLoginStatus().  This function gets the state of the
    // person visiting this page and can return one of three states to
    // the callback you provide.  They can be:
    //
    // 1. Logged into your app ('connected')
    // 2. Logged into Facebook, but not your app ('not_authorized')
    // 3. Not logged into Facebook and can't tell if they are logged into
    //    your app or not.
    //
    // These three cases are handled in the callback function.
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  };
  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me?fields=id,name,email', function(response) {
      console.log(response);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
      $('[name="myId"]').val(response.id);
      $('[name="myName"]').val(response.name);
     // $('[name="myEmail"]').val(response.email);
    
   // FB.api('/me/friends',function(response){
    //	console.log(response);
    	
    	//console.log(response);
        //Append the data
        /* response.data.forEach(function(ele,i){
        	
        	$("#tableBody").append(
        			'<tr><th scope = "row">'+i+'</th>'+
        			'<td>'+ ele.name+'</td>'+
        			'<td>'+ ele.id+'</td>'+
        			'</tr>'
        			);
        	//var earlierVal = $('[name=myFriends]').val();
        	$('[name=myFriends]').val(earlierVal + ele.id + "/" + ele.name + "/" );
       */
       // $("#redirectForm").submit();
      //});
    });
    
  }
    function sendid(q){
    	
    	console.log("hhhheeeyyyy");
    	console.log(q);
    	
    	$('[name="postid"]').val(q);
    	  $("#redirectForm").submit();
    }
</script>



<nav class="navbar navbar-light bg-light">
  <a class="navbar-brand" href="#">
    <img src="apple_raw.png" width="30" height="30" class="d-inline-block align-top"/>
    HeyThere !
  </a>
  <form action="/createpost">
  
  <button type="submit"> Post </button>
 </form>
 
  <form action="/editprofile">
  
  <button type="submit"> Edit Profile </button>
 </form>
  
 <fb:login-button class="fb-login-button" data-max-rows="1"
				data-size="large" data-button-type="login_with"
				data-show-faces="false" data-auto-logout-link="true"
				data-use-continue-as="false"
				scope="public_profile,email,user_friends"
				onlogin="checkLoginState();">
			</fb:login-button>
</nav>
<br> 
<div class="container">
  <div class="row">
    <div class="col-4"> 
      <img src="${u.imgurl}" alt="Profile Page Image" height="250" width="250" > 
    </div>
    <div class="col">
      
       <h3> <c:out value="${u.name}"/> </h3>
       <p> <c:out value="${u.description}"/>  
       </p>	  
    </div>
    </div>
      </div> <br> <br>
      <h3> Thumbnail </h3>
      <c:forEach items="${post}" var="i">
      
  <img src="${i.imguri}"  height="250" width="250" onclick="sendid('${i.postid}')"> 
  
</c:forEach>
<form action="/play" id="redirectForm">
<input type="hidden" name="postid" />
</form> 
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

</body>
</html>