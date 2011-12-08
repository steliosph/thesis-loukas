<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html> 
<head>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
</head>  
<body>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ include file="top.jsp" %>

<div class="pageTop"></div>
<div class="pageMain">

            

     <sql:query var="result" dataSource="jdbc/myDatasource">
             SELECT * FROM branches
    </sql:query>


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
<c:forEach var="row" items="${result.rows}">
        <tr>
           <td><c:out value="${row.branchid}"/></td>
           <td><c:out value="${row.address}"/></td>
           <td><c:out value="${row.city}"/></td>
           <td><c:out value="${row.telephone}"/></td>
        </tr>
</c:forEach>      
        
    </tbody>
</table>    
            

</div>
<div class="clear"></div>


<%@ include file="footer.jsp" %>

</body>
</html>