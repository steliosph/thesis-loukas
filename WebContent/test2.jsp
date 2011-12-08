<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String country=request.getParameter("count");  
 String buffer="<select name='state' ><option value='-1'>Select</option>";  
 try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bankdb", "root","tessera");
 
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from customers where custID='"+country+"' ");  
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(3)+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>