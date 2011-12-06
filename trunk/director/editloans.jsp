    <%@ page import="java.sql.*;" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
	<link rel="stylesheet" type="text/css" href="style.css" />     
	<link rel="stylesheet" type="text/css" href="../css/fancybox.css" />        
	<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/jquery.overlabel.min.js" type="text/javascript" ></script> 
<script type="text/javascript">
    $(document).ready(function() {
        var overlayColor=$('#fancybox-overlay')             
                                     
    $(document).ready(function() {
        $("label.overlabel").overlabel();
    });                                                                
});
</script>      
</head>

 <%!
    String loanid1="", amount = "", type = "", status = "", update="";
    int loanid=0;      
    %>
     
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bankdb", "root","tessera");

Statement stmt=con.createStatement();

ResultSet rs;

%>    
    
<% 
loanid1=request.getParameter("loanid");
if(loanid1!=null)
loanid=Integer.parseInt(loanid1);
rs=stmt.executeQuery("Select * from loans where loanid="+loanid);
if(rs.next())
{
amount=rs.getString("amount");
type=rs.getString("type");
status=rs.getString("status");
}

 %>    
    
    <form name="editform" method="post" action="update.jsp">
    <table align="center" width="300px" style="background-color:#EDF6EA;border:1px solid #000000;">   
    <tr><td colspan=2 style="font-weight:bold;" align="center">Edit User</td></tr>
    <tr><td colspan=2 align="center" height="10px"></td></tr>
    <tr>
    <td>LoadID</td>
    <td><input type="text" name="branchid" value="<%=loanid%>"></td>
    </tr>    
    <tr>
    <td>Ποσό</td>
    <td><input type="text" name="address" value="<%=amount%>"></td>
    </tr>
    <tr>
    <td>Tύπος</td>
    <td><input type="text" name="city" value="<%=type%>"></td>
    </tr>
    <tr>
    <td>Κατάσταση</td>
    <td><input type="text" name="telephone" value="<%=status%>"></td>
    </tr>
    <tr>
    <td></td>
    <td><input type="submit" name="Submit" value="Update" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
    </tr>
    <tr><td colspan=2 align="center" height="10px"></td></tr>
    </table>        
    <br>
    </form>
    </body>
    </html>