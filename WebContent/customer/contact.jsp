<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="SHORTCUT ICON" href="../images/favicon.ico" type="image/x-icon" />
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
	width: 164px;
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
			<div class="hr" style="margin-top: -12px; "></div>
	
			<img align="right" SRC="../images/contact.jpg" width="115" height="78"/>
	
			<p>
				<label for="Fullname" class="overlabel">Όνομα</label> <input
					id="Fullname" name="Fullname" type="text"
					class="Input  textInput" />
			</p>
			<p>
				<label for="Email" class="overlabel">Εmail</label> <input id="Email"
					name="Email" type="text" class="Input  textInput" />
			</p>
			<p>				
				<textarea name="Message" id="Message"
					style='resize: none; width: 278px; height: 150px;' /></textarea>
			</p>
			<p class="right noMargin">
				<button type="submit" class="btn" value="Submit">
					<span>Αποστολή...</span>
				</button>			
			</p>
	</form>

<script>
jQuery(function($) {
    $("#contactForm").validate({
    	rules : {
			Email : {
				required : true,
				email : true
			},
			Fullname : {
				required : true					
			},
			Message : {
				required : true,
				minlength : 15
			}
		},
		messages : {
			Email : "Εισάγετε έγκυρη διεύθυνση email.",
			Fullname : "Παρακαλώ εισάγετε το όνοματεπώνυμο σας.",
			Message : "Εισάγετε το μήνυμα που θέλετε (μεγαλύτερο απο 15 χαρακτήρες)."
		},
		
		submitHandler: function(form) {
				var Email = $('#Email').attr('value');
				var Message = $('#Message').attr('value');
				var Fullname = $('#Fullname').attr('value');				
					$.ajax({
						type: "POST",
						url: "submitMessage.jsp",
						data: {"Email": Email, "Message": Message, "Fullname": Fullname,},
						success: function(result){				
							$('#correct').fadeOut(1600, "linear");	
							var result = $.trim(result);
							setTimeout(function(){					
							if (result=='correct'){		
								$('#correct').fadeIn(500).show();			
							}			
						;},150);
							}
					});										            
    }
    });
});
    
    
    
</script>
<div id="correct" style="display: none; color: red; ">
	<strong>Το μύνημα εστάλη. Ευχαριστούμε! </strong>
</div>	

	
</body>
</html>