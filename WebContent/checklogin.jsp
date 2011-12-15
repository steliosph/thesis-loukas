
<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int account_type = request.getParameter("account_type");
		
		if (account_type == 0) {
			session.setAttribute("control", "yes");
			response.setStatus(301);
			response.setHeader("Location", "tamias/tamias.jsp");
			response.setHeader("Connection", "close");
		} 
		else if (account_type == 1) {
			session.setAttribute("control", "yes");
			response.setStatus(301);
			response.setHeader("Location", "customer/customer.jsp");
			response.setHeader("Connection", "close");
		}
%>
