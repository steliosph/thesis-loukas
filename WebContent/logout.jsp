<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
       <% session.setAttribute("isValid", "no") ;
       session.setAttribute("accountTypeId", null);
       session.setAttribute("firstname", null) ;
       session.setAttribute("lastname", null) ;
      %>
       
       <jsp:forward page="index.jsp"/>
    </body>
</html>
