    <%@ page import="java.sql.*;" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
	<link rel="stylesheet" type="text/css" href="css/style.css" />     
	<link rel="stylesheet" type="text/css" href="css/fancybox.css" />        
	<link rel="SHORTCUT ICON" href="images/favicon.ico" type="image/x-icon" />        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery.overlabel.min.js" type="text/javascript" ></script> 
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
    String branchid1="", address = "", city = "", telephone = "", update="";
    int branchid=0;      
    %>
     
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bank", "root","tessera");

Statement stmt=con.createStatement();

ResultSet rs;

%>    
    
<% 
branchid1=request.getParameter("branchid");
if(branchid1!=null)
branchid=Integer.parseInt(branchid1);
rs=stmt.executeQuery("Select * from branches where branchid="+branchid);
if(rs.next())
{
address=rs.getString("address");
city=rs.getString("city");
telephone=rs.getString("telephone");
}

 %>    
    
    <form name="editform" method="post" action="update.jsp">
    <table align="center" width="300px" style="background-color:#EDF6EA;border:1px solid #000000;">   
    <tr><td colspan=2 style="font-weight:bold;" align="center">Edit User</td></tr>
    <tr><td colspan=2 align="center" height="10px"></td></tr>
    <tr>
    <td>BranchID</td>
    <td><input type="text" name="branchid" value="<%=branchid%>"></td>
    </tr>    
    <tr>
    <td>Address</td>
    <td><input type="text" name="address" value="<%=address%>"></td>
    </tr>
    <tr>
    <td>City</td>
    <td><input type="text" name="city" value="<%=city%>"></td>
    </tr>
    <tr>
    <td>Telephone</td>
    <td><input type="text" name="telephone" value="<%=telephone%>"></td>
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