<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<body>
 
 <!--       
       fix sql squery about transactions customer
        -->

    <!-- Rotate image script-->
 
     
    <script type="text/javascript">
     
    var i = 0;
     
    var imageArray = new Array();
     
    //Create each element of the array as a unique object with a src and href parameter. This is quick and dirty; you could create an
    //object 'class' for this.. but.. perhaps it's overkill. You could also use a pair of arrays with matching subscripts.
     
    var img0 = new Object( );
     
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
     
    imageArray[ 0 ] = img0;
    imageArray[ 1 ] = img1;
    imageArray[ 2 ] = img2;
    imageArray[ 3 ] = img3;
     
    function rotateImage()
    {
     
    if (i >= imageArray.length)
    {
    i = 0;
    }
     
    var img_element = document.images["pic"];
    var a_element = img_element.parentNode;
     
    img_element.src = imageArray[i].src;
    a_element.href = imageArray[i].href;
     
    i++;
     
    setTimeout("rotateImage()", 3000);
     
    }
     
    </script>
   <%@ include file="top.jsp" %>
   
<div class="pageTop"></div>
<div class="pageMain">
    <div class="contentArea">
        <div class="full-page">
        <div class="pattern_box_icon"><img src="images/slogo.png" alt="" title=""  /></div>
                Η Dream Bank είναι ένας Ευρωπαϊκός χρηματοοικονομικός οργανισμός με παρουσία σε 10 χώρες και σύνολο ενεργητικού €23,2 δισ. Απασχολεί
		πάνω από 500 άτομα και προσφέρει τα προϊόντα και τις υπηρεσίες του, τόσο μέσα από ένα δίκτυο 1,600 καταστημάτων, επιχειρηματικών
		κέντρων και σημείων εξυπηρέτησης, όσο και μέσα από εναλλακτικά δίκτυα διάθεσης. Στην Dream Bank, οι πελάτες μας βρίσκονται στο
		επίκεντρο κάθε μας ενέργειας. Σκοπός μας είναι να στεκόμαστε υπεύθυνα δίπλα σας, στηρίζοντας κάθε σας βήμα, παρέχοντας λύσεις για
		τις καθημερινές, αλλά και για τις πλέον σύνθετες ανάγκες σας. H Dream Bank ιδρύεται το 2007. Λειτούργησε αρχικά ως ένα εξειδικευμένο
		πιστωτικό ίδρυμα, με σκοπό την υποστήριξη και ανάπτυξη του αγροτικού τομέα στην Ελλάδα, ο οποίος παραμένει και σήμερα ένας από τους βασικούς
		πυλώνες δραστηριοποίησής της με προσφορά πιστώσεων και εγγυήσεων σε αγρότες και συνεταιρισμούς και με ταχεία διανομή των κοινοτικών επιδοτήσεων. 
	</div>
	<div class="clear"></div>
    </div>
		
</div>
    <div class="pageBottom"></div>         
    <div class="pageTop"></div>
    <div class="pageMain">
	<div class="contentArea">
		<div class="full-page">
			<div class="portfolio">
                            <div class="portfolio-item">
                                <a href="news.jsp"><h2>Τελευταία Νέα</h2></a>
					<div class="portfolio-description">
						<p><b>02/02/2012</b>
						Ανακοίνωση για την Αύξηση του Μετοχικού Κεφαλαίου με Καταβολή Μετρητών με Δικαίωμα Προτίμησης Υπέρ των Παλαιών Μετόχων: Ημερομηνία Αποκοπής &
						Περίοδος Διαπραγμάτευσης Δικαιώματος Προτίμησης.<br>
                                                    <br>
                                            <br><a href="news.jsp">Διαβάστε περισσότερα...</a>
					</div>
                            </div>		
				<div class="portfolio-item">
                                    <a href="programmata.jsp"><h2>Τα προγράμματα μας!</h2></a>
					<div class="portfolio-description">
						<a href="mporw.jsp" ><img src="images/mporo.jpg" class="left"></a>
						<a href="epistrofi.jsp"><img src="images/logo epistrofi.jpg"  /></a>
					</div>
				</div>
				<div class="portfolio-item">
                                    <a href="kartes.jsp"><h2>Kάρτες</h2></a>
					<a href=""><img class="left" width=280px height=160px id="pic" name="pic"/></a>
					<script type="text/javascript">rotateImage();</script>
				</div>
                            </div>
		<div class="clear"></div>					
                    </div>		
		<div class="clear"></div>			
	</div>		
    </div>           
                
   
 
   <%@ include file="footer.jsp" %>
	
</div>
</div>
</body>
</html>	
