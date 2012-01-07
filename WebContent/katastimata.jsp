<%@ page import="sql.BranchesRepository"%>
<%@ page import="bean.Branch"%>
<%@ page import="sql.BranchesRepositoryImpl"%>
<%@ page language="java" contentType="text/html; import="java.sql.*"%>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="branch" scope="page" class="sql.BranchesRepositoryImpl" />

<%
	String address_id = "", branch_id = "";
%>

<html>
<head>
<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen" />
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
</head>
<body>
	<%@page contentType="text/html" pageEncoding="UTF-8"%>
	<%@ include file="top.jsp"%>

	<div class="pageTop"></div>
	<div class="pageMain">




		<table id="table-2">
			<thead>
				<tr>
					<th>Κωδικός Κατ.</th>
					<th>Διεύθυνση</th>
					<th>Πόλη</th>
					<th>Τηλέφωνο</th>
				</tr>
			</thead>
			<tbody>

				<%
					ResultSet rs = branch.getResult();
					while (rs.next()) {
						address_id = rs.getString("address_id");
						branch_id = rs.getString("branch_id");
				%>

				<tr>
					<td><%=address_id%></td>
					<td><%=branch_id%></td>
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