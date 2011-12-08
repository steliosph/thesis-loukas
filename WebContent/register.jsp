<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />        
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/style.css" />     
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script src="js/jquery.overlabel.min.js" type="text/javascript" ></script>    
    
    
    
<script type="text/javascript">
    $(document).ready(function() {
        var overlayColor=$('#fancybox-overlay')             
                                     
    $(document).ready(function() {
        $("label.overlabel").overlabel();
    });                                                                
});

</script>          



    <script type="text/javascript">
$().ready(function() {
	$("#signupForm").validate({
		rules: {
			firstname: "required",
			lastname: "required",
			username: {
				required: true,
				minlength: 2
			},
			password: {
				required: true,
				minlength: 5
			},
			confirm_password: {
				required: true,
				minlength: 5,
				equalTo: "#password"
			},
			email: {
				required: true,
				email: true
			},
			agree: "required"
		},
		messages: {
			firstname: "Παρακάλω εισάγεται το όνομα σας.",
			lastname: "Παρακάλω εισάγεται το επώνυμο σας.",
			username: {
				required: "Παρακάλω εισάγεται ένα username που θέλετε.",
				minlength: "Το username πρέπει να περιέχει το λιγότερο 2 χαρακτήρες"
			},
			password: {
				required: "Παρακάλω εισάγεται κωδικό.",
				minlength: "Ο κωδικός πρέπει να έιναι το λιγότερο 5 χαρακτήρες."
			},
			confirm_password: {
				required: "Παρακάλω εισάγεται κωδικό.",
				minlength: "Ο κωδικός πρέπει να έιναι το λιγότερο 5 χαρακτήρες.",
				equalTo: "Οι 2 κωδικοί πρέπει να είναι ίδιοι"
			},
			email: "Εισάγετε έγκυρη διεύθυνση email.",
			agree: "Διαβάστε και αποδεχτείτε τους όρους αν συμφωνείτε."
		}
	});

	// propose username by combining first- and lastname
	$("#username").focus(function() {
		var firstname = $("#firstname").val();
		var lastname = $("#lastname").val();
		if(firstname && lastname && !this.value) {
			this.value = firstname + "." + lastname;
		}
	});

});

</script>

<style type="text/css">
#signupForm { width: 221px; }
#signupForm label.error {
	margin-left: 0px;
	width: auto;
}
/* Forms
------------------------------*/

form, fieldset {
	margin: 0px;
	padding: 0;
        width: 215px;
}
	
fieldset { border: 1px solid #000; }


input, textarea, select {
	margin: 0;
	padding: 1px;
	font-size: 100%;
	font-family: inherit;
}
	
select { padding: 0; }

/**********************************

Use: cmxform template

***********************************/


form.cmxform label {
	display: inline-block;
	line-height: 1.8;
	vertical-align: top;
	cursor: hand;
}

form.cmxform label { width: 200px; } /* Width of labels */
form.cmxform.oroi label { width: 100px; }
form.cmxform fieldset fieldset label { margin-left: 103px; } /* Width plus 3 (html space) */
form.cmxform label.error {
	margin-left: 103px;
	width: 220px;
}

form.cmxform input.submit {
	margin-left: 103px;
}

form.cmxform label.error, label.error {
	/* remove the next line when you have trouble in IE6 with labels in list */
	font-size: 0.75em;
        color: red;
	font-style: italic
}
div.error { display: none; }


.regInput		{ width: 208px; }

</style>

</head>
<body>

<div id="main">

<form class="cmxform" id="signupForm" method="post" action="execute.jsp">
	<div class="regContainer">
        <center><h1>Nέος Χρήστης</h1></center>
		<p>
                    <label for="firstname" class="overlabel">Όνομα</label>
                    <input id="firstname" name="firstname" type="text" class="regInput textInput" />

		</p>
		<p>
                    <label for="lastname" class="overlabel">Επώνυμο</label>
                    <input id="lastname" name="lastname" type="text" class="regInput textInput" />                    
		</p>
		<p>
                    <label for="username" class="overlabel">Username</label>
                    <input id="username" name="username" type="text" class="regInput textInput" />                        
		</p>
		<p>
                    <label for="password" class="overlabel">Κωδικός</label>
                    <input id="password" name="password" type="password" class="regInput textInput" />                                            
		</p>
		<p>
                    <label for="confirm_password" class="overlabel">Επιβεβαίωση Κωδικού</label>
                    <input id="confirm_password" name="confirm_password" type="password" class="regInput textInput" />                                           
		</p>
		<p>
                    <label for="email" class="overlabel">Εmail</label>
                    <input id="email" name="email" type="text" class="regInput textInput" />                     
		</p>
            	<p>
			<a href="oroi.jsp" /> Όροι χρήσης </a>
			<input type="checkbox" class="checkbox" id="agree" name="agree" />
		</p>
		<p class="right noMargin">
                        <button type="submit" class="btn" value="Submit"><span>Register</span></button>
                </p>
        
                
</div> 
</form>    
</body>
</html>
    