<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script src="../js/jquery.overlabel.min.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var overlayColor = $('#fancybox-overlay')

		$(document).ready(function() {
			$("label.overlabel").overlabel();
		});
	});
</script>

<script type="text/javascript">
	$().ready(function() {
		$("#contactForm").validate({
			rules : {
				email : {
					required : true,
					email : true
				}
			},
			messages : {
				email : "Εισάγετε έγκυρη διεύθυνση email."
			}
		});
	});
</script>

<style type="text/css">
#contactForm {
	width: 291px;
}

form label.error,label.error {
	font-size: 0.75em;
	color: red;
	font-style: italic
}

.Input {
	width: 173px;
}

.box {
	width: 298;
}
</style>

</head>
<body>

	<form id="contactForm" method="post" action="">
			<center>
				<h1>Φόρμα Επικοινωνίας</h1>
			</center>
			<div class="hr" style="margin-top: -12px; margin-right: 52px;"></div>
	<div id="contactimg">
			<img SRC="../images/contact.jpg" width="115" height="78"/>
		</div>
			<p>
				<label for="firstname" class="overlabel">Όνομα</label> <input
					id="firstname" name="firstname" type="text"
					class="Input  textInput" />
			</p>
			<p>
				<label for="email" class="overlabel">Εmail</label> <input id="email"
					name="email" type="text" class="Input  textInput" />
			</p>
			<p>
				<label for="comment" class="overlabel"> </label>
				<textarea name="message" id="message"
					style='resize: none; width: 288px; height: 150px;' /></textarea>
			</p>
			<p class="right noMargin">
				<button type="submit" class="btn" value="Submit">
					<span>Submit</span>
				</button>			
			</p>
	</form>

</body>
</html>