<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bean.Students" %>
<%@ page import="com.bean.Teachers" %>
<%@ page import="com.bean.Subjects" %>
<%@ page import="com.dao.StudentDAO" %>
<%@ page import="com.bean.Classes" %>
<%@ page import="com.dao.ClassDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
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
String studentName = request.getParameter("name");
int classId = Integer.parseInt(request.getParameter("class-id"));

		
try{
	Classes tempClass=ClassDAO.searchClassesById(classId);
	Students stud=new Students(studentName);
	tempClass.add(stud);
	StudentDAO.addStudents(stud);
	out.println("<h3 style='color:green;'>Student is added successfully</h3>");
	response.setHeader("Refresh","1;url=manage-students.jsp");
}
catch(Exception e){
	System.out.println(e.getMessage().toString());
	System.out.println(e.getClass().toString());
	out.println("<h3 style='color:red;'>Student is not added</h3>");
}
%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>