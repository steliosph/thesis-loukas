
    <%@ page language="java" import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
 <!-- employee login -->   
        
        <%
 
String onoma = request.getParameter("onoma");
String elegxos="no";
String password = request.getParameter("password");
String idiotita = request.getParameter("idiotita");
int count=0;


session.setAttribute("empid", onoma) ;
session.setAttribute("control", elegxos) ;
HttpSession session1=null;


 
 String driver = "com.mysql.jdbc.Driver";
	Class.forName(driver).newInstance();
	
	Connection con=null;
	ResultSet rst=null;
	Statement stmt=null;
        
        try{
		String url="jdbc:mysql://localhost:3306/bankdb?user=root&password=tessera";
		con=DriverManager.getConnection(url);
		stmt=con.createStatement();
	}
	catch(Exception e){
		System.out.println(e.getMessage());
	}
        
        
        stmt=con.createStatement(); 
        rst=stmt.executeQuery(" select * from employees where loginname='"+onoma+"' and password='"+password+"' ");
        
       int jobid1=0;
        while(rst.next()){

            jobid1= rst.getInt("jobid");     
            }
              if (jobid1==1) 
                {
   session.setAttribute("control", "yes") ;    

response.setStatus(301);
response.setHeader( "Location", "director/director.jsp" );
response.setHeader( "Connection", "close" );
            
%>
 

<%



                }                    
 else if (jobid1==3)  {
    session.setAttribute("control", "yes") ;
%>
<jsp:forward page="tamias.jsp"/>
<% 

   }
       
  else if (jobid1==2)  {
    session.setAttribute("control", "yes") ;
%>
<jsp:forward page="bdirector.jsp"/>
<% 

   }  


  else if (jobid1==4)  {
    session.setAttribute("control", "yes") ;
%>
<jsp:forward page="tmimap.jsp"/>
<% 

   }  

 else if (jobid1==5)  {
    session.setAttribute("control", "yes") ;
%>
<jsp:forward page="logistirio.jsp"/>


<%
   }                 
%>


<!-- customer login --> 

        <%
        try{
		String url="jdbc:mysql://localhost:3306/bankdb?user=root&password=tessera";
		con=DriverManager.getConnection(url);
		stmt=con.createStatement();
	}
	catch(Exception e){
		System.out.println(e.getMessage());
	}
        

                 
        
        stmt=con.createStatement(); 
        rst=stmt.executeQuery(" select loginname from customers where loginname='"+onoma+"' and password='"+password+"' ");
        
        while(rst.next()){

            jobid1++;     
            } 
              if (jobid1==1) 
                {
                  session.setAttribute("control", "yes") ;
%>
<jsp:forward page="footer.jsp"/>
<% 
   }                
             else  {
                 session.setAttribute("control", "no") ;
%>
            <%@ include file="top.jsp" %> <br><br>
            <div id="content">
                <p><h1>Εισάγατε λάθος στοιχεία. <br><br> Αν θέλετε να κάνετε εγγραφή πατήστε <a href="register.jsp" > εδώ</a></p></h1>
            </div>
<%
   }       
%> 
             <%@ include file="footer.jsp" %>
</body>
</html>
