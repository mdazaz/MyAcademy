<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bean.Students" %>
<%@ page import="com.dao.StudentDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Learner's Academy</title>
<jsp:include page="links.jsp"></jsp:include>
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
<%
int id = Integer.parseInt(request.getParameter("id"));
String name = request.getParameter("name");
Students sub = new Students(id,name);
try{
	StudentDAO.updateStudents(sub);
	out.println("<h3 style='color:green;'>Subject is updated successfully</h3>");
	response.setHeader("Refresh","1;url=update-students.jsp");
}
catch(Exception e)
{
	out.println("<h3 style='color:red;'>Subject is not updated</h3>");
}

%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>