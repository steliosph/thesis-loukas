    <%@ page import="java.sql.*;" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <HTML>
    <HEAD>
       	<link rel="stylesheet" type="text/css" href="css/style.css" />      
        <script src="js/jquery.min.js" type="text/javascript" ></script>
        <script type="text/javascript" SRC="js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
        <script src="js/jquery.overlabel.min.js" type="text/javascript" ></script>
        <link rel="stylesheet" type="text/css" href="css/fancybox.css" />       
        
<script type="text/javascript">
$(document).ready(function() {
    var overlayColor=$('#fancy_overlay')
$("a.login").fancybox({
	'padding':3,
	'overlayOpacity':0.2,
	'overlayColor':overlayColor,
	'frameWidth':400,
	'frameHeight':208,
	'hideOnContentClick':false,
	'callbackOnShow':modalStart,
        'transitionIn'    : 'elastic',
        'transitionOut'   : 'fade'       
});
$("a.editform").fancybox({
	'padding':3,
	'overlayOpacity':0.2,
	'overlayColor':overlayColor,
	'frameWidth':400,
	'frameHeight':208,
	'hideOnContentClick':false,
	'callbackOnShow':modalStart,
        'transitionIn'    : 'elastic',
        'transitionOut'   : 'fade'         
});
                 
function modalStart(){
    Cufon.replace('.fancy_title > div')};                                                          
});

</script>        
        
    <TITLE>Fetching Data From a Database</TITLE>
    <script type="text/javascript">
        function del()
        {
        if(confirm("Επιλέξτε OK για διαγραφή." ))
        {
        }
        else
        {
        return false;
        }
        }
    </script>
    </HEAD>
    <BODY>
    <H1>Fetching Data From a Database</H1>
    <%!
    int x=0, branchid=0;
    String delete="", address="", branchid1="", deleteid="" ;
    %>
  
    
 <%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bank", "root","tessera");

Statement stmt=con.createStatement();
Statement stmt1=con.createStatement();
Statement stmt2=con.createStatement();
Statement stmt3=con.createStatement();
Statement stmt4=con.createStatement();
Statement stmt5=con.createStatement();

ResultSet rs,rs1,rs2,rs3,rs4,rs5;

PreparedStatement pstmt,pstmt1,pstmt2,pstmt3,pstmt4,pstmt5;

%>   


        <%
            branchid1=request.getParameter("branchid");
            if(branchid1!=null)
            branchid=Integer.parseInt(branchid1);
            delete=request.getParameter("delete");
            if("yes".equals(delete))
            {
            deleteid=request.getParameter("deleteid");
            x=stmt1.executeUpdate("Delete from branches where branchid="+deleteid);
            }            
        %>
  
 
        <%
            String update="";
            update=(String)session.getAttribute("update");
            session.removeAttribute("update");
            if(update!=null)out.print(update);
        %>
  

 
        
                   <% if(x==1)
	{
	%> 
                 
			  Το κατάστημα με κωδικό (<%=deleteid%>) έχει διαγραφεί από την βάση μαs!
                   
            
			<%}%>
   <TABLE border="1" align="center">                        
    <TR>
    <Td>ID</Td>
    <Td>Address</Td>
    <Td>City</Td>
    <Td>Telehpne</Td>
    <td>actions</td>
    <td>aaa</td>

     
    </TR>

<% 
        rs=stmt.executeQuery("select * from branches");
        while(rs.next()) {

 %>    
     
    
    <tr>
    <td> <%=rs.getInt("branchid")%> </td>
    <td> <%=rs.getString("address")%> </td>
    <td> <%=rs.getString("city")%> </td>
    <td> <%=rs.getString("telephone")%> </td> 
    <td><a href="editData.jsp?branchid=<%=rs.getInt("branchid")%>" class="editform" >Edit</a></td>
    <td><a href="users-edit-sql.jsp?delete=yes&deleteid=<%=rs.getInt("branchid")%>" onclick="return del()">Delete</a></td>
    </tr>
<% }  %>    

     
    </TABLE>
</BODY>
</HTML>