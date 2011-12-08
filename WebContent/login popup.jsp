
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<link rel="stylesheet" type="text/css" href="css/style.css" />     
	<link rel="stylesheet" type="text/css" href="css/fancybox.css" />        
	<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery.overlabel.min.js" type="text/javascript" ></script> 
<script type="text/javascript">
    $(document).ready(function() {
        var overlayColor=$('#fancybox-overlay')             
                                     
    $(document).ready(function() {
        $("label.overlabel").overlabel();
    });                                                                
});
</script>      
</head>
<body>
<form class="loginForm" method="post" action="login.jsp">
    <div id="loginBg"><img SRC="images/lock-and-key.png" width="128" height="128" alt="lock and key" /></div>
    <div class="loginContainer">
         <h1>
		Administrative Portal
		<span>Sign in to your account</span>
	</h1>
        

           <p>
                <label for="log" class="overlabel">Username</label>
		<input id="log" name="onoma" type="text" class="loginInput textInput rounded" />
           </p>
           <p>
                <label for="pwd" class="overlabel">Password</label>
		<input id="pwd" name="password" type="password" class="loginInput textInput rounded" />
           </p>
        </div>
	<div class="hr" style="margin-bottom: 3px;"></div>
  	<p class="left" style="margin: 14px 0 0 15px">
		<a href="#">Forgot your password?</a><br>    
	</p>      
	<p class="right noMargin">
		<button type="submit" class="btn"><span>Sign in</span></button>
	</p>
        
</form>
        
       
    </body>
</html>
