 <%@page import="java.sql.*"%>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
 <html>
      <head>  
      <script language="javascript" type="text/javascript">  
      var xmlHttp  
      var xmlHttp
      function showState(str){
      if(typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if(window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if(xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      var url="test2.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById("state").innerHTML=xmlHttp.responseText   
      }   
      }

      </script>  
      </head>  
      <body>  
      <select name='country' onchange="showState(this.value)">  
       <option value="none">Select</option>  
    <%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bankdb", "root","tessera");

 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from customers");
 while(rs.next()){
     %>
      <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>  
      <%
 }
     %>
      </select>  
      <br>  
      <div id='state'>  
      <select name='state' >  
      <option value='-1'></option>  
      </select>  
      </div>  
      </body> 
      </html>