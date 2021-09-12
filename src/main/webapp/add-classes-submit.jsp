<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.util.HibernateSessionUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
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
int classId= Integer.parseInt(request.getParameter("class-id"));
int subjectId =  Integer.parseInt(request.getParameter("subject-id"));
int teacherId = Integer.parseInt(request.getParameter("teacher-id"));

Subjects sub=SubjectDAO.searchSubjectById(subjectId);

	//cl1.setTeacher(new Teachers(teacherId,teacherName));

	try{
		SessionFactory factory = HibernateSessionUtil.buildSessionFactory();
		Session session1 = factory.openSession();
		Transaction tx = session1.beginTransaction();
		Classes cl=session1.get(Classes.class, classId);
		cl.addSubject(sub);
		session1.save(cl);
		tx.commit();
		session1.close();
		out.println("<h3 style='color:green;'>Class is added successfully</h3>");
		response.setHeader("Refresh","1;url=manage-classes.jsp");
	}
	catch(Exception e){
		out.println("<h3 style='color:red;'>Class is not added</h3>");
	}

%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>