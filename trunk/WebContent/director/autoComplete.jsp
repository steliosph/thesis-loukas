<%@page contentType="text/html" pageEncoding="UTF-8" 
		import="sql.DatabaseClass,java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>
<jsp:useBean id="autoComplete" scope="page" class="sql.AutoCompleteRepositoryImpl" />
<%
String AutoComplete = request.getParameter("q");
ResultSet rs = autoComplete.autoComplete(AutoComplete);
while(rs.next())
{
    out.println(rs.getInt("customer_id") + " " + rs.getString("firstname") + " " +  rs.getString("lastname"));
}
%>
