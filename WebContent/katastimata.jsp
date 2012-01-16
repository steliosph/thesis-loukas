<%@ page import="sql.BranchesRepository"%>
<%@ page import="bean.Branch"%>
<%@ page import="sql.BranchesRepositoryImpl"%>
<%@ page language="java" import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="branch" scope="page" class="sql.BranchesRepositoryImpl" />

<%
	String branch_id = "", country = "", city = "", postal_code="", telephone = "";
%>

<html>
<head>
<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen" />
 
</head>
<body>
 
	<%@ include file="top.jsp"%>

	<div class="pageTop"></div>
	<div class="pageMain">




		<table id="table-2">
			<thead>
				<tr>
					<th>Κωδικός Κατ.</th>
					<th>Χώρα</th>
					<th>Πόλη</th>					
					<th>Ταχ. Κωδ.</th>
					<th>Τηλέφωνο</th>
				</tr>
			</thead>
			<tbody>

				<%
					ResultSet rs = branch.getResult();
					while (rs.next()) {					
						branch_id = rs.getString("branch_id");
						country = rs.getString("address"); 
						city = rs.getString("city");
						postal_code= rs.getString("postal_code");
						telephone = rs.getString("telephone");
				%>

				<tr>					
					<td><%=branch_id%></td>
					<td><%=country%></td>
					<td><%=city%></td>
					<td><%=postal_code%></td>
					<td><%=telephone%></td>
				</tr>

				<%
					}
				%>
			</tbody>
		</table>


	</div>
	<div class="clear"></div>


	<%@ include file="footer.jsp"%>

</body>
</html>