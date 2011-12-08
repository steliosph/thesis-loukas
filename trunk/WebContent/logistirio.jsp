
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<%@page import="java.util.Date"%>
<%@page import="org.omg.CORBA.TIMEOUT"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="author" content="Luka Cvrk (www.solucija.com)" />
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<link rel="stylesheet" href="css/main.css" type="text/css" />
	<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />
        <title>Τράπεζα Παπεί</title>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>

  	<link rel="stylesheet" href="css/slide.css" type="text/css" media="screen" />
	
  	<!-- PNG FIX for IE6 -->
  	<!-- http://24ways.org/2007/supersleight-transparent-png-in-ie6 -->
	<!--[if lte IE 6]>
		<script type="text/javascript" src="js/pngfix/supersleight-min.js"></script>
	<![endif]-->
	 
    <!-- jQuery - the core -->
	<script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
	<!-- Sliding effect -->
	<script src="js/slide.js" type="text/javascript"></script>
    </head>
    <body>
        <%
        
        String control1=session.getAttribute("control").toString();
        
     
      if(control1.equals("yes"))
                   {
          String empid=session.getAttribute("empid").toString();
       
        %> 

       <div id="content">
           
		<%@ include file="top.jsp" %>
		
		<div id="intro">
                            <h1> Λογιστήριο:   <span class="white"> 
                        <sql:query var="result" dataSource="jdbc/myDatasource">
                            SELECT firstname, lastname FROM employees where LoginName="<%=empid%>"
                           
                        </sql:query>
                        
                    
                            <!-- column headers -->
                           
                            <!-- column data -->
                            <c:forEach var="row" items="${result.rowsByIndex}">
                              
                                <c:forEach var="column" items="${row}">
                                    <c:out value="${column}"/>
                                </c:forEach>
                               
                            </c:forEach>
                       </span></h1>
                        <p></p>
			<div id="login">
				<p><a href="logout.jsp">Logout</a> </p>
			</div>
		</div>	
		<div id="left">
                    <p>
			<h4>Λειτουργίες Λογιστηρίου</h4>	
			
                        <p><img src="images/director.png" alt="Image" width="128" height="128" />
                        <li> <a href="logistirio/employees.jsp">Μισθοδοσία υπαλλήλων</a></li>
                     
                  
                       
               <br><br><br> <br>

			
			<ul id="articles">
                            <li> Ημέρα - Μήνας - Ώρα - Έτος  <br /><a href="#"><%= new java.util.Date() %></a></li>
				<li class="last">Λογιστήριο<br /><a href="#"><c:forEach var="row" items="${result.rowsByIndex}">
                              
                                <c:forEach var="column" items="${row}">
                                    <c:out value="${column}"/>
                                </c:forEach>
                               
                            </c:forEach></a></li>
			</ul>
                
		</div>
	
		

		<%@ include file="footer.jsp" %>	
		
	</div>
 <% }
 else {
            %>
             <h1>Η πρόσβαση σε αυτή την Ιστοσελίδα απαγορεύεται!</h1> <br><br>
            Επιστροφή στην αρχική <a href="http://localhost:8083/Bank/">σελίδα</a>.
            <%
 }
 %>
    </body>
</html>
