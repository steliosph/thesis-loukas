
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/fancybox.css" />
<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery.overlabel.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var overlayColor = $('#fancybox-overlay')

		$(document).ready(function() {
			$("label.overlabel").overlabel();
		});
	});
</script>
</head>
<body>
	<form class="loginForm" method="post" action="checklogin.jsp">
		<div id="loginBg">
			<img SRC="images/lock-and-key.png" width="128" height="128"
				alt="lock and key" />
		</div>
		<div class="loginContainer">
			<h2>
				Είσοδος Εργαζομένου & Υπαλλήλου<span>Εισάγετε τα στοιχεία σας</span>
			</h2>


			<p>
				<label for="log" class="overlabel">Ψευδώνυμο</label> <input id="log"
					name="username" type="text" class="loginInput textInput rounded" />
			</p>
			<p>
				<label for="password" class="overlabel">Κωδικός</label> <input id="password"
					name="password" type="password"
					class="loginInput textInput rounded" />
			</p>
		</div>
		<div class="hr" style="margin-bottom: 3px;"></div>
		
		<p class="right noMargin">
			<button type="submit" class="btn">
				<span>Είσοδος</span>
			</button>
		</p>

	</form>


</body>
</html>
