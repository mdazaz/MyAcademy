<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bean.Classes" %>
<%@ page import="com.bean.Subjects" %>
<%@ page import="com.bean.Teachers" %>
<%@ page import="com.bean.Students" %>
<%@ page import="com.dao.ClassDAO" %>
<%@ page import="com.dao.SubjectDAO" %>
<%@ page import="com.dao.TeacherDAO" %>
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
String className = request.getParameter("name");

if(className != null || !(className.equals(""))){
	Classes cl1 = new Classes(className);

	try{
		ClassDAO.addClasses(cl1);
		out.println("<h3 style='color:green;'>Class is added successfully</h3>");
		response.setHeader("Refresh","1;url=manage-classes.jsp");
	}
	catch(Exception e){
		out.println("<h3 style='color:red;'>Class is not added</h3>");
	}
}
%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>