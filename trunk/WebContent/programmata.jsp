<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Rotate image script-->


<script type="text/javascript">
	var i = 0;

	var imageArray = new Array();

	//Create each element of the array as a unique object with a src and href parameter. This is quick and dirty; you could create an
	//object 'class' for this.. but.. perhaps it's overkill. You could also use a pair of arrays with matching subscripts.

	var img0 = new Object();

    img0.src = "images/card1.jpg";
    img0.href = "karta1.jsp";
     
    var img1 = new Object( );
     
    img1.src = "images/card2.jpg";
    img1.href = "karta2.jsp";
     
    var img2 = new Object( );
     
    img2.src = "images/card3.jpg";
    img2.href = "karta3.jsp";
     
    var img3 = new Object( );
     
    img3.src = "images/card4.jpg";
    img3.href = "karta4.jsp";

	//Put all of those objects into the array.

	imageArray[0] = img0;
	imageArray[1] = img1;
	imageArray[2] = img2;
	imageArray[3] = img3;

	function rotateImage() {

		if (i >= imageArray.length) {
			i = 0;
		}

		var img_element = document.images["pic"];
		var a_element = img_element.parentNode;

		img_element.src = imageArray[i].src;
		a_element.href = imageArray[i].href;

		i++;

		setTimeout("rotateImage()", 4000);

	}
</script>
<%@ include file="top.jsp"%>

<div class="pageTop"></div>
<div class="pageMain">
	<div class="contentArea">
		<div class="full-page">
			<div class="portfolio">
				<div class="portfolio-item">
					<h2>Μπορώ!</h2>
					<br> <a href="mporw.jsp"><img src="images/mporo.jpg"></a>
					<p>Μπες στον κόσμο της αποταμίευσης με το λογαριασμό
						ταμιευτηρίου "Μπορώ". Η συστηματική αποταμίευση ποτέ δεν ήταν πιο
						εύκολη και ταυτόχρονα αποδοτική! Αποταμίευσε αυτόματα!Ενεργοποίησε
						μία πάγια εντολή και μετέφερε αυτόματα...</p>
					<a href="mporw.jsp">Διαβάστε περισσότερα...</a>

				</div>
				<div class="portfolio-item">
					<h2>Eπιστροφή!</h2>

					<br> <a href="epistrofi.jsp"><img
						src="images/logo epistrofi.jpg" /></a>
					<p>Η Επιστροφή, το μεγαλύτερο πρόγραμμα επιβράβευσης καρτών,
						επιβραβεύει τις αγορές σας με κάρτες DreamBank σε ένα ευρύ δίκτυο
						3.500 επιχειρήσεων και σας προσφέρει καθημερινό όφελος σε
						πραγματικά ευρώ. Χρησιμοποιήστε κάρτες DreamBank σε όλες...</p>
						 
					<a href="epistrofi.jsp">Διαβάστε περισσότερα...</a>

				</div>
				<div class="portfolio-item">
					<h2>Kάρτες</h2><br> <a href=""><img
						class="left" width=280px height=160px id="pic" name="pic" /></a>
					<script type="text/javascript">
						rotateImage();
					</script>
				</div>

			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
	</div>
</div>
<%@ include file="footer.jsp"%>

</body>
</html>
