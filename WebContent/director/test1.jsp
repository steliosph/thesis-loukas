<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
  <link rel="stylesheet" type="text/css" href="../css/jquery.autocomplete.css" />
  <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
  <script src="../js/jquery.autocomplete.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <input type="text" id="autoComplete" name="autoComplete" class="input_text"/>
        <script>
        $("#autoComplete").autocomplete("autoComplete.jsp");
    </script>
    </body>
</html>
