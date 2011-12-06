    <%@ page import="java.sql.*;" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");%>

<%!
    String branchid1="",address = "", city = "", telephone = "", update="";  
    int branchid=0;
%>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bank?useUnicode=true&mysqlEncoding=UTF-8&characterEncoding=UTF-8&characterSetResults=UTF-8", "root","tessera");

ResultSet rs;

PreparedStatement pstmt;
%>


<%
branchid1=request.getParameter("branchid");
branchid=Integer.parseInt(branchid1);
address=request.getParameter("address");
city=request.getParameter("city");
telephone=request.getParameter("telephone");

pstmt=con.prepareStatement("update branches set branchid="+branchid+",address=?, city=?, telephone=? where branchid="+branchid);
pstmt.setString(1,address);
pstmt.setString(2,city);
pstmt.setString(3,telephone);
pstmt.executeUpdate();

out.println(pstmt);
out.println(branchid);
out.println(branchid1);
 
con.close();
session.setAttribute("update","Το κατάστημα με κωδικό:("+branchid+") ανανεώθηκε!");

%>
<jsp:forward page="users-edit-sql.jsp">
    <jsp:param name="update" value="<%=branchid%>" />
</jsp:forward>
