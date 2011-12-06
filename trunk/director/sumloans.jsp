<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <link rel="stylesheet" href="style.css" type="text/css" />
    <link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />              
    
    <script src="../js/jquery.min.js" type="text/javascript" ></script>   
 
    <link rel="stylesheet" type="text/css" href="../css/fancybox.css" />       
    
 <script type="text/javascript">
$(document).ready(function() {
    var overlayColor=$('#fancy_overlay')
$("a.editform").fancybox({
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

$(document).ready(function() {
    $("label.overlabel").overlabel();
});      

</script>
<script type="text/javascript">
    function del()
    {
    if(confirm("Επιλέξτε OK για διαγραφή." ))
    {
    }
    else
    {
    return false;}}
    </script> 
    
</head>
<body>
<%!
    int y=0, x=0, loanid=0, customerID=0 ;
    String city="", customerID1="", FirstName="" , LastName="",address="", amount="", delete="", Address="", loanid1="", deleteid="" ;
%>    

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bankdb", "root","tessera");

Statement stmt=con.createStatement();
Statement stmt1=con.createStatement();
Statement stmt2=con.createStatement();
Statement stmt3=con.createStatement();
Statement stmt4=con.createStatement();
Statement stmt5=con.createStatement();

ResultSet rs,rs1,rs2,rs3,rs4,rs5;

PreparedStatement pstmt,pstmt1,pstmt2,pstmt3,pstmt4,pstmt5;

%> 

        <%
            loanid1=request.getParameter("loanid");
            if(loanid1!=null)
            loanid=Integer.parseInt(loanid1);
            delete=request.getParameter("delete");
            if("yes".equals(delete))
            {
            deleteid=request.getParameter("deleteid");
            x=stmt1.executeUpdate("Delete from loans where loanid="+deleteid);
            }            
        %>
  
 
        <%
            String update="";
            update=(String)session.getAttribute("update");
            session.removeAttribute("update");
            if(update!=null)out.print(update);
        %>

<%
String control1=session.getAttribute("control").toString();
if(control1.equals("yes"))
    {
    String empid=session.getAttribute("empid").toString();
%>       

<%@ include file="top.jsp" %>

<div class="pageTop"></div>
    <div class="pageMain">
      <div class="contentArea">
 <!-- Main Menu Links -->
        <div id="director">	        
            <ul  class="navmain">
                <li class="list"><a href="director.jsp">Γενικός Διευθυντής</a>
                <ul class="navsub">
                  <li><a href="sumloans.jsp">Συνολική εικόνα δανείων</a></li>
                  <li> <a href="deposits.jsp">Συνολική εικόνα καταθέσεων</a></li>
                  <li> <a href="egkrisi.jsp">Δάνεια προς έγκριση</a></li>
                </ul>
                </li>
            </ul>   
        </div>

          <h1>Συνολική εικόνα Δανείων </h1>
          <div class="left noMargin">

<script language="javascript"> 
function toggle() {
	var ele = document.getElementById("toggleText");
	var text = document.getElementById("displayText");
	if(ele.style.display == "block") {
    		ele.style.display = "none";
  	}
	else {
		ele.style.display = "block";		
	}
} 
</script>

                <button class="btn" ONCLICK="window.location.href='javascript:toggle();'"><span>Συνολικό Άθροισμα Δανείων.</span></button> 
                <div id="toggleText" style="display: none">
                <h2>
                    <%
                          rs1 = stmt1.executeQuery("SELECT sum(amount)as Athroisma FROM loans");
                          while(rs1.next()) {
                    %> 
                    Η τράπεζα μας έχει δώσει <br>δάνεια αξίας:
                    <strong>  <%=rs1.getString(1)%> </strong><br> ευρώ!!
                    <% }  %> 
                </h2>
                </div><br> 
 <form action="" >
      <label for="customerID" class="overlabel">Eισαγωγή ID πελάτη</label>
      <input type="text" name="customerID" id="customerID" class="aInput textInput" />  <br>
      <button style="width:236px" class="btn" type="submit"><span>Αναζήτηση Πελάτη.</span></button><br>
      
                     <% 
customerID1=request.getParameter("customerID");
if(customerID1!=null)
customerID=Integer.parseInt(customerID1);
rs2=stmt2.executeQuery("Select * from customers where custID="+customerID);
if(rs2.next())
{
y=1;
LastName=rs2.getString("Lastname");
FirstName=rs2.getString("FirstName");
Address=rs2.getString("Address");
city=rs2.getString("City");
}
 %> 
 
 <% if(y==1)
	{
     y=0;
	%>
 
Όνομα:<%=LastName%><br>
Επώνυμο:<%=FirstName%><br>
Διεύθυνση:<%=Address%><br>
Πόλη:<%=city%><br>

<% } %>

</form>

<% if(x==1){%> 
    Το δάνειο με αριθμό (<%=deleteid%>)<br>έχει διαγραφεί από την βάση μαs!                               
<%}%>  
 


        </div>  
<div class="left " >                 
<div style="overflow: auto; height: 500px;   " >
    <table id="table-2"><caption>Στοιχεία δανείου</caption>
        <thead>
            <tr>
               <th>Αριθμός Δανείου</th>
               <th>ΙD Πελάτη</th>
               <th>Ποσό</th>
               <th>Τύπος</th>
               <th>Κατάσταση</th>
            </tr>
        </thead>
<% 
        rs=stmt.executeQuery("select * from Loans");
        while(rs.next()) {

 %>          
        <tbody>
               <tr>
                    <td> <%=rs.getInt("LoanID")%> </td>
                    <td> <%=rs.getInt("CustID")%> </td>
                    <td> <%=rs.getFloat("Amount")%> </td>
                    <td> <%=rs.getString("Type")%> </td>
                    <td> <%=rs.getString("Status")%> </td> 
                    <td><a href="editloans.jsp?loanid=<%=rs.getInt("LoanID")%>" class="editform" >Edit</a></td>
                    <td><a href="sumloans.jsp?delete=yes&deleteid=<%=rs.getInt("LoanID")%>" onclick="return del()">Delete</a></td>
               </tr>                  
         </tbody>
<% }  %> 
       </table>
    </div>
    <div class="clear"></div>
    </div>
  </div>
  <div class="clear"></div>
</div>        
<%@ include file="../footer.jsp" %>  
 <% }
 else {
            %>
<%@ include file="top.jsp" %>          
            <h1>Η πρόσβαση σε αυτή την Ιστοσελίδα απαγορεύεται! <br><br>
            Επιστροφή στην αρχική <a href="http://localhost:8083/Bank/">σελίδα</a>.</h1>
<%@ include file="../footer.jsp" %>             
            <%
 }
 %>

</body>
</html>
