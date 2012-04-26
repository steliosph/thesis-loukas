<html xmlns="http://www.w3.org/1999/xhtml">
<%
	if (session.getAttribute("isValid") == null) {
		session.setAttribute("isValid", "no");
	}
	// session.setAttribute("isValid", "no");
%>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />
<title>Τράπεζα Παπεί</title>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />

<!-- login menu -->

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" SRC="js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<script src="js/jquery.overlabel.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/fancybox.css" />

<script type="text/javascript">
	$(document).ready(function() {
		var overlayColor = $('#fancy_overlay')
		$("a.login").fancybox({
			'padding' : 3,
			'overlayOpacity' : 0.2,
			'overlayColor' : overlayColor,
			'frameWidth' : 400,
			'frameHeight' : 208,
			'hideOnContentClick' : false,
			'callbackOnShow' : modalStart 
		});
		$("a.register").fancybox({
			'padding' : 3,
			'overlayOpacity' : 0.2,
			'overlayColor' : overlayColor,
			'frameWidth' : 400,
			'frameHeight' : 208,
			'hideOnContentClick' : false,
			'callbackOnShow' : modalStart 
		});
		$("a.contact").fancybox({
			'padding' : 3,
			'overlayOpacity' : 0.2,
			'overlayColor' : overlayColor,
			'frameWidth' : 600,
			'frameHeight' : 308,
			'hideOnContentClick' : false,
			'callbackOnShow' : modalStart 
		});

		function modalStart() {
			Cufon.replace('.fancy_title > div')
		}
		;

	});
</script>
</head>

<body>
	<div id="PageWrapper">
		<div class="pageTop"></div>
		<div id="Header">
			<div id="MenuWrapper">
				<div id="MainMenu">
					<div id="MmLeft"></div>
					<div id="MmBody">
						<!-- Main Menu Links -->
						<ul class="nav-main">
							<li><a href="./">Αρχική</a></li>
							<li><a href="./news.jsp">Νέα</a></li>
							<li><a href="./programmata.jsp">Προγράμματα</a></li>
							<li><a href="./katastimata.jsp">Καταστήματα</a></li>
							<li><a href="./contact.jsp" class="contact">Επικοινωνια</a></li>
						</ul>

						<div class="mmDivider"></div>
						<%
							String isValid = (String) session.getAttribute("isValid");
							if (isValid == "no" || isValid == "") {
						%>
						<ul class="nav-main">
							<li class="list"><span class="mmLogin">Login/Register</span>
								<ul class="nav-sub">
									<li><a HREF="login.jsp" class="login"><span
											class="Login">Login</span></a></li>
									<li><a HREF="register.jsp" class="register"><span
											class="register">Register</span></a></li>
								</ul></li>
						</ul>
						<%
							} else if (isValid == "yes") {
						%>
						<ul class="nav-main">
							<li><a href="./logout.jsp"><span class="logout">Logout</span></a></li>
						</ul>
						<%
							}
						%>
					</div>
					<div id="MmRight"></div>
					<%
						if (isValid == "yes") {
							Integer accountTypeId = (Integer) session.getAttribute("accountTypeId");
							if (accountTypeId == 1) {
					%>
					<h2>
						<span>Γενικός Διευθυντής: <a href="./director/director.jsp"
							STYLE="text-decoration: none"> <%=session.getAttribute("firstname")%>
								<%=session.getAttribute("lastname")%></span> </a>
					</h2>
					<%
						}
							else if (accountTypeId == 0) {
					%>
					<h2>
						<span>Tαμίας: <a href="./cashier/cashier.jsp"
							STYLE="text-decoration: none"> <%=session.getAttribute("firstname")%>
								<%=session.getAttribute("lastname")%></span> </a>
					</h2>
					<%
						}
							else if (accountTypeId == 10) {
					%>
					<h2>
						<span>Πελάτης: <a href="./customer/customer.jsp"
							STYLE="text-decoration: none"> <%=session.getAttribute("firstname")%>
								<%=session.getAttribute("lastname")%></span> </a>
					</h2>
					<% 
					}}
					%>
				</div>
			</div>
			<div id="Logo">
				<a HREF="index.jsp"></a>
			</div>
		</div>
		<div class="pageMain">
			<!-- Video -->
			<div class="contentArea">
				<object width="930" height="290">
					<param wmode="opaque" />
					<param name="quality" value="high" />
					<embed src="images/Boat_EN.swf" quality="high"
						type="application/x-shockwave-flash" width="930" height="290"
						wmode="opaque"></embed>
				</object>
			</div>

		</div>
		<div class="pageBottom"></div>


		<%@page contentType="text/html" pageEncoding="UTF-8"%>