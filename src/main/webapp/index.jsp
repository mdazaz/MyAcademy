<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bean.Admin" %>
<%@ page import="com.dao.AdminDAO" %>
<%@ page import="com.bean.User" %>
<%@ page import="com.dao.UserDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="links.jsp"></jsp:include>

<title>Learner's Academy</title>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="container-fluid" id="about">
	<h1>Welcome to Learner's Academy Portal</h1>
	<p>This is the online management system of the Learner's Academy school. The system keeps track of its classes, subjects, students, and teachers.</p>
	<p>Administrators can use this tool to manage the resources and Users can view the relevant resources.</p>
	</div>
	<div class="container-fluid pt-4">
		<div class="row">
		<%
			String user = (String)session.getAttribute("username");
			System.out.println(user);
			List<Admin> listOfAdmin = AdminDAO.listAdmin();
			List<User> listOfUser = UserDAO.listUser();
			int admflag = 0;
			int usflag = 0;
			for(Admin ad: listOfAdmin){
				if(user != null && ad.getName().equals(user)){
					admflag = 1;
					break;	
				}
			}
			
			for(User us: listOfUser){
				if(user != null && us.getName().equals(user)){
					usflag = 1;
					break;	
				}
			}
			
			if(admflag == 1){
		%>
			<div class="col-md-2">
				<div class="card">
					  <div class="card-header bg-info text-white">
					    Subjects
					  </div>
					  <div class="card-body">
					    <h5 class="card-title">Manage Subjects</h5>
					    <p class="card-text">Create, Read, Update and Delete Subjects from the master list</p>
					    <a href="manage-subjects.jsp" class="btn btn-info">Manage</a>
					  </div>
				</div>
			</div>
			<div class="col-md-2">
				<div class="card">
					  <div class="card-header bg-success text-white">
					    Teachers
					  </div>
					  <div class="card-body">
					    <h5 class="card-title">Manage Teachers</h5>
					    <p class="card-text">Create, Read, Update and Delete Teachers from the master list</p>
					    <a href="manage-teachers.jsp" class="btn btn-success">Manage</a>
					  </div>
				</div>
			</div>
			<div class="col-md-2">
				<div class="card">
					  <div class="card-header bg-warning text-white">
					    Students
					  </div>
					  <div class="card-body">
					    <h5 class="card-title">Manage Students</h5>
					    <p class="card-text">Create, Read, Update and Delete Students from the master list</p>
					    <a href="manage-students.jsp" class="btn btn-warning">Manage</a>
					  </div>
				</div>
			</div>
			<div class="col-md-2">
				<div class="card">
					  <div class="card-header bg-danger text-white">
					    Classes
					  </div>
					  <div class="card-body">
					    <h5 class="card-title">Manage Classes</h5>
					    <p class="card-text">Create, Read, Update and Delete Classes from the master list</p>
					    <a href="manage-classes.jsp" class="btn btn-danger">Manage</a>
					  </div>
				</div>
			</div>
			<div class="col-md-2">
				<div class="card">
					  <div class="card-header bg-dark text-white">
					    Report
					  </div>
					  <div class="card-body">
					    <h5 class="card-title">View Class Report</h5>
					    <p class="card-text">View all details about a scheduled class. Eg. Subjects, Students to a class </p>
					    <a href="view-report.jsp" class="btn btn-dark">View</a>
					  </div>
				</div>
			</div>
			<%
			}
			else if(user != null && usflag == 1 ){%>
			<div class="col-md-2">
				<div class="card">
					  <div class="card-header">
					    Report
					  </div>
					  <div class="card-body">
					    <h5 class="card-title">View Class Report</h5>
					    <p class="card-text">View all details about a scheduled class. Eg. Subjects, Students to a class </p>
					    <a href="view-classes.jsp" class="btn btn-primary">View</a>
					  </div>
				</div>
			</div>
			<%}
			else{
				out.println("<h3 style='color:red;'>Inactive Session. Please login to continue!<h3>");
			}
			%> 
		</div>	
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
