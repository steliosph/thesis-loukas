<html xmlns="http://www.w3.org/1999/xhtml">
<head>  
	<link rel="stylesheet" type="text/css" href="style.css" />     
	<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />
        <title>Τράπεζα Παπεί</title>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
         <!-- login menu -->
         
        <script src="../js/jquery.min.js" type="text/javascript" ></script>
        <script type="text/javascript" SRC="../js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
        <script src="../js/jquery.overlabel.min.js" type="text/javascript" ></script>
        <link rel="stylesheet" type="text/css" href="../css/fancybox.css" />       
        
<script type="text/javascript">
$(document).ready(function() {
    var overlayColor=$('#fancy_overlay')
$("a.login").fancybox({
	'padding':3,
	'overlayOpacity':0.2,
	'overlayColor':overlayColor,
	'frameWidth':400,
	'frameHeight':208,
	'hideOnContentClick':false,
	'callbackOnShow':modalStart,
        'transitionIn'    : 'elastic',
        'transitionOut'   : 'fade'       
});
$("a.register").fancybox({
	'padding':3,
	'overlayOpacity':0.2,
	'overlayColor':overlayColor,
	'frameWidth':400,
	'frameHeight':208,
	'hideOnContentClick':false,
	'callbackOnShow':modalStart,
        'transitionIn'    : 'elastic',
        'transitionOut'   : 'fade'         
});
                 

function modalStart(){
    Cufon.replace('.fancy_title > div')};
                   
               
                        
});

</script>
</head>
  
<body>
<div id="Wrapper">
    <div id="PageWrapper">
	<div class="pageTop"></div>
	<div id="Header">
            <div id="MenuWrapper">
		<div id="MainMenu">
                    <div id="MmLeft"></div>
                    <div id="MmBody">		
            <!-- Main Menu Links -->
                        <ul class="nav-main">                            
                            <li><a href="http://localhost:8080/Bank/">Αρχική</a></li>
                            <li><a href="http://localhost:8080/Bank/news.jsp">Νέα</a></li>
                            <li><a href="http://localhost:8080/Bank/programmata.jsp">Προγράμματα</a></li>
                            <li><a href="http://localhost:8080/Bank/katastimata.jsp">Καταστήματα</a></li>
                            <li><a href="http://localhost:8080/Bank/contact.jsp">Επικοινωνια</a></li>	
                        </ul>           

                    <div class="mmDivider"></div>
                          <% 
                               String elegxos1=(String) session.getAttribute("control");        
                                if (elegxos1=="no" || elegxos1==null) {
%>
<ul  class="nav-main">
        <li class="list"><span class="mmLogin">Login/Register</span>
	<ul class="nav-sub">
        <li><a HREF="../login popup.jsp" class="login" ><span class="Login">Login</span></a></li>
 	<li><a HREF="../register.jsp" class="register" ><span class="register">Register</span></a></li>
	</ul>
	</li>
</ul>                          
                           <%
                                }                    
                                else if (elegxos1=="yes")  { 
                                    %>                       
                                    <ul class="nav-main"> 
                                        <li><a href="../logout.jsp"><span class="logout">Logout</span></a></li></ul>
                            <% } %>
			</div>
                    <div id="MmRight"></div>
		</div>
            </div>
            <div id="Logo"><a HREF="../index.jsp"></a></div>	
        </div>		
	<div class="pageMain">         
        <div class="clear"></div>		
        </div>
        <div class="pageBottom"></div>	          

<%@page contentType="text/html" pageEncoding="UTF-8"%>

