<%@page import="com.bean.Subjects"%>
<%@page import="com.dao.SubjectDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bean.Teachers" %>
<%@ page import="com.dao.TeacherDAO" %>
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
int subjectId =  Integer.parseInt(request.getParameter("subject-id"));
Teachers tea = new Teachers(id,name);

try{
	Subjects sub=SubjectDAO.searchSubjectById(subjectId);
	tea.addSubject(sub);
	TeacherDAO.updateTeachers(tea);
	
		
	out.println("<h3 style='color:green;'>Teachers is updated successfully</h3>");
	response.setHeader("Refresh","1;url=update-teachers.jsp");
}
catch(Exception e)
{
	out.println("<h3 style='color:red;'>Teacher is not updated</h3>");
}

%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>