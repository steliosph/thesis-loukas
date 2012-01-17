<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script src="js/jquery.overlabel.min.js" type="text/javascript"></script>



<script type="text/javascript">
	$(document).ready(function() {
		var overlayColor = $('#fancybox-overlay')

		$(document).ready(function() {
			$("label.overlabel").overlabel();
		});
	});
</script>



<script type="text/javascript">
	$()
			.ready(
					function() {
						$("#signupForm")
								.validate(
										{
											rules : {
												firstname : "required",
												lastname : "required",
												username : {
													required : true,
													minlength : 2
												},
												password : {
													required : true,
													minlength : 5
												},
												confirm_password : {
													required : true,
													minlength : 5,
													equalTo : "#password"
												},												
												agree : "required"
											},
											messages : {
												firstname : "Παρακάλω εισάγεται το όνομα σας.",
												lastname : "Παρακάλω εισάγεται το επώνυμο σας.",
												username : {
													required : "Παρακάλω εισάγεται ένα username που θέλετε.",
													minlength : "Το username πρέπει να περιέχει το λιγότερο 2 χαρακτήρες"
												},
												password : {
													required : "Παρακάλω εισάγεται κωδικό.",
													minlength : "Ο κωδικός πρέπει να έιναι το λιγότερο 5 χαρακτήρες."
												},
												confirm_password : {
													required : "Παρακάλω εισάγεται κωδικό.",
													minlength : "Ο κωδικός πρέπει να έιναι το λιγότερο 5 χαρακτήρες.",
													equalTo : "Οι 2 κωδικοί πρέπει να είναι ίδιοι"
												},
												agree : "Διαβάστε και αποδεχτείτε τους όρους αν συμφωνείτε."
											}
										});

						// propose username by combining first- and lastname
						$("#username").focus(function() {
							var firstname = $("#firstname").val();
							var lastname = $("#lastname").val();
							if (firstname && lastname && !this.value) {
								this.value = firstname + "." + lastname;
							}
						});

					});
</script>

<style type="text/css">
#signupForm {
	width: 221px;
}

form label.error,label.error {
	font-size: 0.75em;
	color: red;
	font-style: italic
}

.regInput {
	width: 208px;
}
</style>

</head>
<body>


	<form id="signupForm" method="post" action="execute.jsp">
		<div class="regContainer">
			<h1>Nέος Χρήστης</h1>
			<p>
				<label for="firstname" class="overlabel">Όνομα</label> <input
					id="firstname" name="firstname" type="text"
					class="regInput textInput" />

			</p>
			<p>
				<label for="lastname" class="overlabel">Επώνυμο</label> <input
					id="lastname" name="lastname" type="text"
					class="regInput textInput" />
			</p>
			<p>
				<label for="username" class="overlabel">Username</label> <input
					id="username" name="username" type="text"
					class="regInput textInput" />
			</p>
			<p>
				<label for="password" class="overlabel">Κωδικός</label> <input
					id="password" name="password" type="password"
					class="regInput textInput" />
			</p>
			<p>
				<label for="confirm_password" class="overlabel">Επιβεβαίωση
					Κωδικού</label> <input id="confirm_password" name="confirm_password"
					type="password" class="regInput textInput" />
			</p>
			<p>
				<a href="oroi.jsp"> Όροι χρήσης </a> <input type="checkbox"
					class="checkbox" id="agree" name="agree" />
			</p>
			<p class="right noMargin">
				<button type="submit" class="btn" value="Submit">
					<span>Register</span>
				</button>
			</p>


		</div>
	</form>
</body>
</html>