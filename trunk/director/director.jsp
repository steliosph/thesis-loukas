
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<%@page import="java.util.Date"%>
<%@page import="org.omg.CORBA.TIMEOUT"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<link rel="stylesheet" href="style.css" type="text/css" />
	<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />
    </head>
<body>
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
      <div class="pattern_box_icon"><img src="director.png" alt="" title=""  /></div> 
      <h1> Γενικός Διευθυντής<span> 
             <sql:query var="result" dataSource="jdbc/myDatasource">
                 SELECT firstname, lastname FROM employees where LoginName="<%=empid%>"
             </sql:query>
              <c:forEach var="row" items="${result.rowsByIndex}">
              <c:forEach var="column" items="${row}">
                    <c:out value="${column}"/>
               </c:forEach>
               </c:forEach>
                </span></h1>	             
            <p><h1>Παρακαλώ επιλέξτε μια απο τις παρακάτω λειτουργίες.</h1>
                <a href="sumloans.jsp">Συνολική εικόνα δανείων</a><br><br>
                <a href="deposits.jsp">Συνολική εικόνα καταθέσεων</a><br><br>
                <a href="egkrisi.jsp">Δάνεια προς έγκριση</a>
                       
               
                </div>
        <div class="clear"></div>
			
                
		</div>
	
		
	
		<%@ include file="../footer.jsp" %>	
		
	
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
