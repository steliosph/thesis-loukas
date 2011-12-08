<%@ page import="java.sql.*;"%>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<link rel="stylesheet" href="css/style.css" type="text/css" />
	<link rel="SHORTCUT ICON" href="../images/favicon.ico" type="image/x-icon" />
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
</head>
<body>

     <%   

    Class.forName("com.mysql.jdbc.Driver");    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bankdb", "root","tessera");
    ResultSet rs;
    PreparedStatement pstmt;    
    Statement stmt=con.createStatement();
    
    String username=request.getParameter("username");
    String lastname=request.getParameter("lastname");
    String firstname=request.getParameter("firstname");
    String password=request.getParameter("password");
    


pstmt=con.prepareStatement("insert into test (username,lastname,firstname,password) values (?,?,?,?)") ;
pstmt.setString(1,username);
pstmt.setString(2,lastname);
pstmt.setString(3,firstname);
pstmt.setString(4,password);
pstmt.executeUpdate();


 %>    
    
    
   <%@ include file="top.jsp" %>        
    <div class="pageTop"></div>
    <div class="pageMain">
	<div class="contentArea">
		<div class="full-page">  
                    <h1>Η εγγραφή σας ολοκληρώθηκε.<br> Πατήστε <a HREF="login popup.jsp" class="login" >εδώ</a> για να συνδεθήτε.<br><span>Στοιχεία λογαριαγμού:</span></h1>
                    Username: <%=(username)%>
                    <br>Όνομα: <%=(firstname)%>
                    <br>Επώνυμο: <%=(lastname)%>
                    <br>Κωδικός: <%=(password)%>                                        

                 </div><div class="clear"></div>					
                   
            </div>	
        </div>	
       <%@ include file="footer.jsp" %>